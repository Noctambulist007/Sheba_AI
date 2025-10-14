import 'package:sheba_ai/data/datasource/remote/model/response/order/create_order_response_data.dart';
import 'package:sheba_ai/domain/model/order/create_order.dart';

extension CreateOrderResponseMapper on CreateOrderResponseData {
  CreateOrder toCreateOrder() {
    return CreateOrder(
      orderNumber: orderNumber,
      shippingAddress: shippingAddress,
      phoneNumber: phoneNumber,
      paymentMethod: paymentMethod,
      notes: notes,
    );
  }
}
