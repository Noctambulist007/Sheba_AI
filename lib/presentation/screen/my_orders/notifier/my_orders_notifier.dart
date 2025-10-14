import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sheba_ai/data/datasource/remote/model/request/order/create_order_request.dart';
import 'package:sheba_ai/data/datasource/remote/model/request/order/order_item_request.dart';
import 'package:sheba_ai/domain/model/cart/cart_item.dart';
import 'package:sheba_ai/domain/model/order/list_of_order_item.dart';
import 'package:sheba_ai/domain/usecase/order/create_order_use_case.dart';
import 'package:sheba_ai/domain/usecase/order/get_all_orders_use_case.dart';
import 'package:sheba_ai/domain/util/result.dart';
import 'package:sheba_ai/injection.dart';
import 'package:sheba_ai/presentation/screen/my_orders/state/my_orders_ui_state.dart';

class MyOrdersNotifier extends StateNotifier<MyOrdersUiState> {
  MyOrdersNotifier() : super(const MyOrdersUiState.initial()) {
    fetchMyOrders();
  }

  final _useCase = getIt<GetAllOrdersUseCase>();
  int _currentPage = 1;
  bool _hasMore = true;
  bool _isLoadingMore = false;
  final List<ListOfOrderItem> _myOrders = [];

  Future<void> fetchMyOrders({bool loadMore = false}) async {
    if (_isLoadingMore) return;
    if (loadMore && !_hasMore) return;

    if (!loadMore) {
      state = const MyOrdersUiState.loading();
      _currentPage = 1;
      _myOrders.clear();
      _hasMore = true;
    }

    _isLoadingMore = loadMore;

    final result = await _useCase(page: _currentPage);

    result.when(
      success: (newMyOrders) {
        if (!loadMore && newMyOrders.isEmpty) {
          _hasMore = false;
          _isLoadingMore = false;
          state = const MyOrdersUiState.success(order: [], hasMore: false);
          return;
        }

        if (newMyOrders.isEmpty) {
          _hasMore = false;
        } else {
          _myOrders.addAll(newMyOrders);
          _currentPage++;
        }

        _isLoadingMore = false;

        state = MyOrdersUiState.success(
          order: List.unmodifiable(_myOrders),
          isLoadingMore: _isLoadingMore,
          hasMore: _hasMore,
        );
      },
      failure: (error) {
        _isLoadingMore = false;
        state = MyOrdersUiState.error(error.message);
      },
    );
  }

  Future<void> createOrder({
    required String shippingAddress,
    required String phoneNumber,
    required String paymentMethod,
    String? notes,
    required List<CartItem> items,
  }) async {
    state = const MyOrdersUiState.loading();

    final useCase = getIt<CreateOrderUseCase>();
    final result = await useCase(
      requestBody: CreateOrderRequest(
        shippingAddress: shippingAddress,
        phoneNumber: phoneNumber,
        paymentMethod: paymentMethod,
        notes: notes,
        items: items.map((item) => OrderItemRequest(
          medicineId: item.medicine.medicineId,
          quantity: item.quantity,
        )).toList(),
      )
    );

    result.when(
      success: (order) {
        state = MyOrdersUiState.initial();
        fetchMyOrders();
      },
      failure: (error) {
        state = MyOrdersUiState.error(error.message);
      },
    );
  }
}
