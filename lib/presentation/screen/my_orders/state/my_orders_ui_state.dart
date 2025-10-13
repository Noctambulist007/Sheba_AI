import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sheba_ai/domain/model/medicine/medicine.dart';
import 'package:sheba_ai/domain/model/order/list_of_order_item.dart';

part 'my_orders_ui_state.freezed.dart';

@freezed
class MyOrdersUiState with _$MyOrdersUiState {
  const factory MyOrdersUiState.initial() = InitialState;

  const factory MyOrdersUiState.loading() = LoadingState;

  const factory MyOrdersUiState.success({
    required List<ListOfOrderItem> order,
    @Default(false) bool isLoadingMore,
    @Default(true) bool hasMore,
  }) = SuccessState;

  const factory MyOrdersUiState.error(String message) = ErrorState;
}
