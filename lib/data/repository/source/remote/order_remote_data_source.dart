import 'package:sheba_ai/data/datasource/remote/model/request/order/create_order_request.dart';
import 'package:sheba_ai/domain/model/order/list_of_order_item.dart';

abstract class OrderRemoteDataSource {
  Future<List<ListOfOrderItem>> getAllOrders({int? page});

  Future<void> createOrder({required CreateOrderRequest requestBody});
}
