import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sheba_ai/domain/model/cart/cart_item.dart';
import 'package:sheba_ai/presentation/screen/cart/state/cart_state.dart';
import 'package:sheba_ai/domain/model/medicine/medicine.dart';
import 'package:sheba_ai/presentation/screen/auth/state/auth_ui_state.dart';
import 'package:sheba_ai/presentation/screen/auth/notifier/provider.dart';

class CartNotifier extends StateNotifier<CartState> {
  CartNotifier(this.ref) : super(CartState());
  
  final Ref ref;

  bool get isAuthenticated {
    final authState = ref.read(authNotifierProvider);
    return authState is AuthenticatedState;
  }

  bool addToCart(Medicine medicine) {
    if (!isAuthenticated) {
      return false;
    }
    
    final items = [...state.items];
    final existingIndex = items.indexWhere(
      (item) => item.medicine.medicineId == medicine.medicineId,
    );

    if (existingIndex >= 0) {
      items[existingIndex] = items[existingIndex].copyWith(
        quantity: items[existingIndex].quantity + 1,
      );
    } else {
      items.add(CartItem(medicine: medicine));
    }

    state = state.copyWith(items: items);
    return true;
  }

  void removeFromCart(int medicineId) {
    final items = [...state.items];
    items.removeWhere((item) => item.medicine.medicineId == medicineId);
    state = state.copyWith(items: items);
  }

  void updateQuantity(int medicineId, int quantity) {
    if (quantity <= 0) {
      removeFromCart(medicineId);
      return;
    }

    final items = [...state.items];
    final index = items.indexWhere(
      (item) => item.medicine.medicineId == medicineId,
    );

    if (index >= 0) {
      items[index] = items[index].copyWith(quantity: quantity);
      state = state.copyWith(items: items);
    }
  }

  void incrementQuantity(int medicineId) {
    final items = [...state.items];
    final index = items.indexWhere(
      (item) => item.medicine.medicineId == medicineId,
    );

    if (index >= 0) {
      items[index] = items[index].copyWith(quantity: items[index].quantity + 1);
      state = state.copyWith(items: items);
    }
  }

  void decrementQuantity(int medicineId) {
    final items = [...state.items];
    final index = items.indexWhere(
      (item) => item.medicine.medicineId == medicineId,
    );

    if (index >= 0) {
      final newQuantity = items[index].quantity - 1;
      if (newQuantity <= 0) {
        removeFromCart(medicineId);
      } else {
        items[index] = items[index].copyWith(quantity: newQuantity);
        state = state.copyWith(items: items);
      }
    }
  }

  void applyCoupon(String code) {
    if (code == 'DISCOUNT20') {
      state = state.copyWith(couponCode: code, discount: state.subtotal * 0.2);
    } else if (code == 'FLAT100') {
      state = state.copyWith(couponCode: code, discount: 100.0);
    }
  }

  void clearCart() {
    state = CartState();
  }
}
