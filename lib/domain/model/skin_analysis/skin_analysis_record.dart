import 'package:sheba_ai/domain/model/skin_analysis/skin_analysis_result.dart';

class SkinAnalysisRecord {
  final String id;
  final String? imagePath;
  final String analysis;
  final String? confidence;
  final String? summary;
  final String? severity;
  final DateTime analyzedAt;

  SkinAnalysisRecord({
    required this.id,
    this.imagePath,
    required this.analysis,
    this.confidence,
    this.summary,
    this.severity,
    required this.analyzedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'imagePath': imagePath,
      'analysis': analysis,
      'confidence': confidence,
      'summary': summary,
      'severity': severity,
      'analyzedAt': analyzedAt.toIso8601String(),
    };
  }

  factory SkinAnalysisRecord.fromMap(Map<String, dynamic> map) {
    return SkinAnalysisRecord(
      id: map['id'],
      imagePath: map['imagePath'],
      analysis: map['analysis'],
      confidence: map['confidence'],
      summary: map['summary'],
      severity: map['severity'],
      analyzedAt: DateTime.parse(map['analyzedAt']),
    );
  }

  SkinAnalysisResult toResult() {
    return SkinAnalysisResult(
      analysis: analysis,
      confidence: confidence,
      summary: summary,
      severity: severity,
      analyzedAt: analyzedAt,
    );
  }
}
