import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sheba_ai/presentation/screen/cart/notifier/cart_notifier.dart';
import 'package:sheba_ai/presentation/screen/cart/state/cart_state.dart';

final cartNotifierProvider = StateNotifierProvider<CartNotifier, CartState>(
  (ref) => CartNotifier(ref),
);
