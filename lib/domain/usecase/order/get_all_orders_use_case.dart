import 'package:sheba_ai/domain/model/order/list_of_order_item.dart';
import 'package:sheba_ai/domain/repository/order_repository.dart';
import 'package:sheba_ai/domain/util/failure.dart';
import 'package:sheba_ai/domain/util/result.dart';

class GetAllOrdersUseCase {
  final OrderRepository _orderRepository;

  GetAllOrdersUseCase({required OrderRepository orderRepository})
    : _orderRepository = orderRepository;

  Future<Result<List<ListOfOrderItem>>> call({int? page}) async {
    return await _orderRepository
        .getAllOrders(page: page)
        .then((orders) => Result.success(orders))
        .onError((Failure failure, stackTrace) => Result.failure(failure));
  }
}
