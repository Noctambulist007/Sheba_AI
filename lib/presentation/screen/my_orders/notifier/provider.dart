import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sheba_ai/presentation/screen/my_orders/notifier/my_orders_notifier.dart';
import 'package:sheba_ai/presentation/screen/my_orders/state/my_orders_ui_state.dart';

typedef MyOrdersNotifierProvider =
    StateNotifierProvider<MyOrdersNotifier, MyOrdersUiState>;

final MyOrdersNotifierProvider myOrdersNotifierProvider = StateNotifierProvider(
  (ref) => MyOrdersNotifier(),
);
