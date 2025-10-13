import 'package:sheba_ai/data/datasource/remote/model/response/order/order_response_data.dart';
import 'package:sheba_ai/domain/model/order/list_of_order_item.dart';

extension OrderResponseMapper on OrderResponseData {
  ListOfOrderItem toOrder() {
    return ListOfOrderItem(
      id: id,
      orderNumber: orderNumber,
      status: status,
      statusDisplay: statusDisplay,
      totalPrice: totalPrice,
      paymentMethod: paymentMethod,
      paymentMethodDisplay: paymentMethodDisplay,
      paymentStatus: paymentStatus,
      itemCount: itemCount,
      createdAt: createdAt,
    );
  }
}
