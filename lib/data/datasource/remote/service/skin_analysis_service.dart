import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:sheba_ai/domain/model/skin_analysis/skin_analysis_result.dart';

class SkinAnalysisService {
  static final String _apiKey = dotenv.get('GEMINI_API_KEY', fallback: '');

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
You are an expert medical AI reviewing a skin image. Provide extremely brief, high-impact, and safe guidance.
Use stylish Markdown (bullet points, bolding). **Keep each section under 15 words.**

Please respond with EXACTLY this structure and nothing else:

**Disclaimer:** AI insight only. Not a medical diagnosis. Consult a doctor.

**Short summary:** (1 very short sentence of what you see)

**Diagnosis details:**
- **Likely:** (Name, Confidence %)
- **Signs:** (3-4 words max)

**Immediate actions:**
- (1 short bullet on what to do)
- (1 short bullet on what to avoid)

**Warning signs:**
- (1-2 red flags in 3-4 words max)
''';
}
