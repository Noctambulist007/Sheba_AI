class DosageForm {
  final int dosageFormId;
  final String name;
  final String slug;
  final int genericsCount;
  final String createdAt;
  final String updatedAt;

  DosageForm({
    required this.dosageFormId,
    required this.name,
    required this.slug,
    required this.genericsCount,
    required this.createdAt,
    required this.updatedAt,
  });
}
