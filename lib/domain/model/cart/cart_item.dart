import 'package:sheba_ai/domain/model/medicine/medicine.dart';

class CartItem {
  final Medicine medicine;
  final int quantity;

  CartItem({
    required this.medicine,
    this.quantity = 1,
  });

  double get totalPrice => double.parse(medicine.price ?? '0') * quantity;

  CartItem copyWith({
    Medicine? medicine,
    int? quantity,
  }) {
    return CartItem(
      medicine: medicine ?? this.medicine,
      quantity: quantity ?? this.quantity,
    );
  }
}