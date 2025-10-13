import 'package:freezed_annotation/freezed_annotation.dart';

part 'dosage_form_response_data.freezed.dart';
part 'dosage_form_response_data.g.dart';

@freezed
abstract class DosageFormResponseData with _$DosageFormResponseData {
  const factory DosageFormResponseData({
    @JsonKey(name: 'dosage_form_id') required int dosageFormId,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'slug') required String slug,
    @JsonKey(name: 'generics_count') required int genericsCount,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
  }) = _DosageFormResponseData;

  factory DosageFormResponseData.fromJson(Map<String, dynamic> json) =>
      _$DosageFormResponseDataFromJson(json);
}
