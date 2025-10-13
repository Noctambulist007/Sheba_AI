import 'package:flutter/foundation.dart';
import 'package:sheba_ai/data/datasource/remote/model/request/order/create_order_request.dart';
import 'package:sheba_ai/data/repository/source/remote/medicine_remote_data_source.dart';
import 'package:sheba_ai/data/repository/source/remote/order_remote_data_source.dart';
import 'package:sheba_ai/domain/model/medicine/medicine.dart';
import 'package:sheba_ai/domain/model/order/list_of_order_item.dart';
import 'package:sheba_ai/domain/repository/medicine_repository.dart';
import 'package:sheba_ai/domain/repository/order_repository.dart';

class OrderRepositoryImpl implements OrderRepository {
  final OrderRemoteDataSource orderRemoteDataSource;

  OrderRepositoryImpl({required this.orderRemoteDataSource});

  @override
  Future<List<ListOfOrderItem>> getAllOrders({int? page}) async {
    try {
      final response = await orderRemoteDataSource.getAllOrders(page: page);
      return response;
    } catch (error, stackTrace) {
      debugPrintStack(stackTrace: stackTrace);
      rethrow;
    }
  }

  @override
  Future<void> createOrder({required CreateOrderRequest requestBody}) async {
    try {
      await orderRemoteDataSource.createOrder(requestBody: requestBody);
    } catch (error, stackTrace) {
      debugPrintStack(stackTrace: stackTrace);
      rethrow;
    }
  }
}
