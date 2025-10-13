import 'package:freezed_annotation/freezed_annotation.dart';

part 'generic_response_data.freezed.dart';
part 'generic_response_data.g.dart';

@freezed
abstract class GenericResponseData with _$GenericResponseData {
  const factory GenericResponseData({
    @JsonKey(name: 'generic_id') required int genericId,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'slug') required String slug,
    @JsonKey(name: 'brand_names_count') required int brandNamesCount,
  }) = _GenericResponseData;

  factory GenericResponseData.fromJson(Map<String, dynamic> json) =>
      _$GenericResponseDataFromJson(json);
}
