import 'package:sheba_ai/data/datasource/remote/model/request/order/create_order_request.dart';
import 'package:sheba_ai/domain/model/order/create_order.dart';
import 'package:sheba_ai/domain/repository/order_repository.dart';
import 'package:sheba_ai/domain/util/failure.dart';
import 'package:sheba_ai/domain/util/result.dart';

class CreateOrderUseCase {
  final OrderRepository _orderRepository;

  CreateOrderUseCase({required OrderRepository orderRepository})
    : _orderRepository = orderRepository;

  Future<Result<CreateOrder>> call({required CreateOrderRequest requestBody}) async {
    return await _orderRepository
        .createOrder(requestBody: requestBody)
        .then((createOrder) => Result.success(createOrder))
        .onError((Failure failure, stackTrace) => Result.failure(failure));
  }
}
