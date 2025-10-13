import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sheba_ai/data/datasource/remote/model/response/medicine/dosage_form_response_data.dart';
import 'package:sheba_ai/data/datasource/remote/model/response/medicine/generic_response_data.dart';
import 'package:sheba_ai/data/datasource/remote/model/response/medicine/manufacturer_response_data.dart';

part 'order_response_data.freezed.dart';
part 'order_response_data.g.dart';

@freezed
abstract class OrderResponseData with _$OrderResponseData {
  const factory OrderResponseData({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'order_number') required String orderNumber,
    @JsonKey(name: 'status') required String status,
    @JsonKey(name: 'status_display') required String statusDisplay,
    @JsonKey(name: 'total_price') required String totalPrice,
    @JsonKey(name: 'payment_method') required String paymentMethod,
    @JsonKey(name: 'payment_method_display') required String paymentMethodDisplay,
    @JsonKey(name: 'payment_status') required bool paymentStatus,
    @JsonKey(name: 'item_count') required int itemCount,
    @JsonKey(name: 'created_at') required String createdAt,

  }) = _OrderResponseData;

  factory OrderResponseData.fromJson(Map<String, dynamic> json) =>
      _$OrderResponseDataFromJson(json);
}
