import 'package:sheba_ai/domain/model/cart/cart_item.dart';

class CartState {
  final List<CartItem> items;
  final String? couponCode;
  final double discount;
  final bool isLoading;

  CartState({
    this.items = const [],
    this.couponCode,
    this.discount = 0.0,
    this.isLoading = false,
  });

  double get subtotal => items.fold(
      0, (total, item) => total + (double.parse(item.medicine.price ?? '0') * item.quantity));

  double get total => subtotal - discount;

  CartState copyWith({
    List<CartItem>? items,
    String? couponCode,
    double? discount,
    bool? isLoading,
  }) {
    return CartState(
      items: items ?? this.items,
      couponCode: couponCode ?? this.couponCode,
      discount: discount ?? this.discount,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}