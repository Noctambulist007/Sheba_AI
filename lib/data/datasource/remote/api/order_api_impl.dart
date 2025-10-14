import 'package:sheba_ai/data/datasource/remote/api/order_api.dart';
import 'package:sheba_ai/data/datasource/remote/model/request/order/create_order_request.dart';
import 'package:sheba_ai/data/datasource/remote/model/response/order/create_order_response.dart';
import 'package:sheba_ai/data/datasource/remote/model/response/order/order_list_response.dart';
import 'package:sheba_ai/data/datasource/remote/util/api_client.dart';
import 'package:sheba_ai/data/mapper/order/create_order_response_mapper.dart';
import 'package:sheba_ai/data/mapper/order/order_list_response_mapper.dart';
import 'package:sheba_ai/domain/model/order/create_order.dart';
import 'package:sheba_ai/domain/model/order/list_of_order_item.dart';

class OrderApiImpl extends OrderApi {
  final ApiClient _client;

  static const getAllOrdersUrl = 'orders/';
  static const createOrderUrl = 'orders/create/';

  OrderApiImpl({required ApiClient client}) : _client = client;

  @override
  Future<List<ListOfOrderItem>> getAllOrders({int? page}) async {
    final response = await _client.get<JSONObject, OrderListResponse>(
      path: getAllOrdersUrl,
      queryParameters: {if (page != null) 'page': page},
      converter: (json) => OrderListResponse.fromJson(json),
    );
    return response.toOrderList();
  }

  @override
  Future<CreateOrder> createOrder({required CreateOrderRequest requestBody}) async {
    final response = await _client.post<JSONObject, CreateOrderResponse>(
      path: createOrderUrl,
      data: requestBody.toJson(),
      converter: (json) => CreateOrderResponse.fromJson(json),
    );
    return response.data.toCreateOrder();
  }
}
