import 'package:freezed_annotation/freezed_annotation.dart';

part 'manufacturer_response_data.freezed.dart';
part 'manufacturer_response_data.g.dart';

@freezed
abstract class ManufacturerResponseData with _$ManufacturerResponseData {
  const factory ManufacturerResponseData({
    @JsonKey(name: 'manufacturer_id') required int manufacturerId,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'slug') required String slug,
    @JsonKey(name: 'generics_count') required int genericsCount,
    @JsonKey(name: 'brand_names_count') required int brandNamesCount,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,

  }) = _ManufacturerResponseData;

  factory ManufacturerResponseData.fromJson(Map<String, dynamic> json) =>
      _$ManufacturerResponseDataFromJson(json);
}
