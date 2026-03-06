import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:sheba_ai/domain/model/skin_analysis/skin_analysis_result.dart';

class SkinAnalysisService {
  static const String _apiKey = 'AIzaSyA3UT4oxoOhH_S6qhMw37LNR-oTOHlP0Ek';

  late final List<GenerativeModel> _models;

  SkinAnalysisService() {
    _models = [
      GenerativeModel(
        model: 'gemini-2.5-flash',
        apiKey: _apiKey,
      ),
      // GenerativeModel(
      //   model: 'gemini-1.5-pro',
      //   apiKey: _apiKey,
      // ),
      // GenerativeModel(
      //   model: 'gemini-1.5-flash',
      //   apiKey: _apiKey,
      // ),
    ];
  }

  Future<SkinAnalysisResult> analyzeSkinCondition({
    required String imagePath,
  }) async {
    final imageBytes = await File(imagePath).readAsBytes();
    final mimeType = _getMimeType(imagePath);

    final content = [
      Content.multi([
        TextPart(_medicalPrompt),
        DataPart(mimeType, imageBytes),
      ]),
    ];

    GenerateContentResponse? response;
    Exception? lastException;

    for (final model in _models) {
      try {
        response = await model.generateContent(content);
        break;
      } catch (e) {
        lastException = e is Exception ? e : Exception(e.toString());
        debugPrint('Model \${model.model} failed: \$e');
      }
    }

    if (response == null) {
      final errorStr = lastException.toString();
      if (errorStr.contains('503') || errorStr.contains('UNAVAILABLE') || errorStr.contains('high demand')) {
        throw Exception('The AI service is currently experiencing high demand. Please try again in a few moments.');
      }
      throw lastException ?? Exception('Unable to analyze the image. Please try again.');
    }

    final text = response.text;

    if (text == null || text.isEmpty) {
      throw Exception('Unable to analyze the image. Please try again.');
    }

    return SkinAnalysisResult(
      analysis: text,
      confidence: _extractField(text, 'Overall confidence'),
      summary: _extractSection(text, 'Short summary', 'Diagnosis'),
      severity: _extractField(text, 'Severity'),
      analyzedAt: DateTime.now(),
    );
  }

  String _getMimeType(String path) {
    final lower = path.toLowerCase();
    if (lower.endsWith('.png')) return 'image/png';
    if (lower.endsWith('.webp')) return 'image/webp';
    if (lower.endsWith('.heic')) return 'image/heic';
    return 'image/jpeg';
  }

  String? _extractField(String text, String fieldName) {
    final pattern = RegExp(
      '$fieldName[:\\s]*([^\\n]+)',
      caseSensitive: false,
    );
    final match = pattern.firstMatch(text);
    return match?.group(1)?.trim();
  }

  String? _extractSection(String text, String startHeader, String endHeader) {
    final startPattern = RegExp(
      '\\*?\\*?$startHeader\\*?\\*?[:\\s]*',
      caseSensitive: false,
    );
    final endPattern = RegExp(
      '\\*?\\*?$endHeader\\*?\\*?[:\\s]*',
      caseSensitive: false,
    );
    final startMatch = startPattern.firstMatch(text);
    if (startMatch == null) return null;

    final startIdx = startMatch.end;
    final remainingText = text.substring(startIdx);
    final endMatch = endPattern.firstMatch(remainingText);

    int endIdx;
    if (endMatch != null) {
      endIdx = startIdx + endMatch.start;
    } else {
      endIdx = startIdx + 200;
      if (endIdx > text.length) {
        endIdx = text.length;
      }
    }

    return text.substring(startIdx, endIdx).trim();
  }

  static const String _medicalPrompt = '''
You are an expert medical-assistant AI that reviews images of visible skin conditions, wounds, burns, and rashes. Be cautious, conservative, and explicit about uncertainty. Provide safe, practical, non-prescriptive guidance only. Always include a clear, prominent disclaimer that your reply is not medical advice and that users should consult a licensed healthcare professional for diagnosis and treatment. When you cannot determine a condition with confidence, say so and present likely possibilities with confidence levels.

Please analyze the provided skin image and respond with the following structure:

**Disclaimer:** This is AI-generated informational guidance only and not a medical diagnosis. Consult a licensed healthcare professional for medical advice and treatment.

**Short summary** (1-2 sentences): State what you see and your top 1-2 most likely diagnostic possibilities, with a confidence percentage for each (e.g., "Eczema — 45%").

**Diagnosis details:**
- Most likely condition name(s) (list up to 3 possibilities, each with a short rationale and confidence %).
- Key visual signs that guided your assessment (color, borders, discharge, texture, symmetry, distribution).

**Severity assessment:**
- Severity level: Mild / Moderate / Severe.
- Explain why (signs that indicate severity).

**Immediate first-aid / urgent actions (if any):**
- What to do now (clear, step-by-step, short actions).
- What to avoid doing immediately (do not apply X, do not cut/squeeze, avoid home remedies that increase infection risk).

**Primary safe home remedies and over-the-counter options (3-5 items):**
- For each: name, how to use it (dosage/frequency if relevant), duration to try, and one-line rationale.
- Include commonly available OTC products where appropriate (e.g., topical antiseptic, emollients, 1% hydrocortisone for short-term use), but do NOT recommend prescription drugs.

**Warning signs that require immediate professional care:**
- List red flags (spread, fever, severe pain, pus, signs of systemic infection, rapidly worsening).
- For each red flag say why it is concerning.

**Suggested follow-up timeframe:**
- When to see primary care / dermatologist / emergency (e.g., "See a doctor within 48 hours if X", "Seek emergency care now if Y").

**Additional recommendations:**
- Practical self-care tips (hygiene, dressing, pain control).
- One-sentence note on likely differential diagnoses to consider.
- Suggested short patient-facing summary (3-4 lines) that can be shown in the app UI.

**Confidence & uncertainty:**
- Overall confidence level for the analysis (Low / Medium / High) and a brief explanation of limitations (image quality, lighting, no history).
- Follow-up questions you would ask the user to improve the assessment (e.g., duration, pain, fever, recent travel, medication, allergies, photos of surrounding area).

**Sources:**
- If you cite guidelines or recommendations, mention the source and year. If not available, say "no direct guideline cited".
''';
}
