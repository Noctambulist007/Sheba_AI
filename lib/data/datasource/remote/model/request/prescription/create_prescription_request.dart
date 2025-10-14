import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_prescription_request.freezed.dart';
part 'create_prescription_request.g.dart';

@freezed
abstract class CreatePrescriptionRequest with _$CreatePrescriptionRequest {
  const factory CreatePrescriptionRequest({
    @JsonKey(name: 'image') required String image,
  }) = _CreatePrescriptionRequest;

  factory CreatePrescriptionRequest.fromJson(Map<String, dynamic> json) =>
      _$CreatePrescriptionRequestFromJson(json);
}
