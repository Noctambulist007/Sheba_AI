class Manufacturer {
  final int manufacturerId;
  final String name;
  final String slug;
  final int genericsCount;
  final int brandNamesCount;
  final String createdAt;
  final String updatedAt;

  Manufacturer({
    required this.manufacturerId,
    required this.name,
    required this.slug,
    required this.genericsCount,
    required this.brandNamesCount,
    required this.createdAt,
    required this.updatedAt,
  });
}
