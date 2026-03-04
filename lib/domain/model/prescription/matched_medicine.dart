class MatchedMedicine {
  final int id;
  final String name;
  final String genericName;
  final String price;
  final ExtractionDetails? extractDetails;

  MatchedMedicine({
    required this.id,
    required this.name,
    required this.genericName,
    required this.price,
    this.extractDetails,
  });
}

class ExtractionDetails {
  final String? strength;
  final String? frequency;
  final String? duration;
  final String? instructions;
  final String? type;

  ExtractionDetails({
    this.strength,
    this.frequency,
    this.duration,
    this.instructions,
    this.type,
  });
}