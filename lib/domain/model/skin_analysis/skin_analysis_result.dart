class SkinAnalysisResult {
  final String analysis;
  final String? confidence;
  final String? summary;
  final String? severity;
  final DateTime analyzedAt;

  SkinAnalysisResult({
    required this.analysis,
    this.confidence,
    this.summary,
    this.severity,
    required this.analyzedAt,
  });
}
