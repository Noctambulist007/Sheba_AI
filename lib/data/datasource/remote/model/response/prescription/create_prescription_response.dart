import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_prescription_response.freezed.dart';
part 'create_prescription_response.g.dart';

@freezed
abstract class CreatePrescriptionResponse with _$CreatePrescriptionResponse {
  const factory CreatePrescriptionResponse({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'image') required String image,
  }) = _CreatePrescriptionResponse;

  factory CreatePrescriptionResponse.fromJson(Map<String, dynamic> json) =>
      _$CreatePrescriptionResponseFromJson(json);
}
