import 'package:sheba_ai/data/datasource/remote/api/medicine_api.dart';
import 'package:sheba_ai/data/datasource/remote/api/order_api.dart';
import 'package:sheba_ai/data/datasource/remote/model/request/order/create_order_request.dart';
import 'package:sheba_ai/data/repository/source/remote/medicine_remote_data_source.dart';
import 'package:sheba_ai/data/repository/source/remote/order_remote_data_source.dart';
import 'package:sheba_ai/domain/model/medicine/medicine.dart';
import 'package:sheba_ai/domain/model/order/create_order.dart';
import 'package:sheba_ai/domain/model/order/list_of_order_item.dart';

class OrderRemoteDataSourceImpl extends OrderRemoteDataSource {
  final OrderApi _orderApi;

  OrderRemoteDataSourceImpl({required OrderApi orderApi})
    : _orderApi = orderApi;

  @override
  Future<List<ListOfOrderItem>> getAllOrders({int? page}) async {
    var response = await _orderApi.getAllOrders(page: page);
    return response;
  }

  @override
  Future<CreateOrder> createOrder({
    required CreateOrderRequest requestBody,
  }) async {
    var response = await _orderApi.createOrder(requestBody: requestBody);
    return response;
  }
}
