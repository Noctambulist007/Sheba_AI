class CreateOrder {
  final String orderNumber;
  final String shippingAddress;
  final String phoneNumber;
  final String paymentMethod;
  final String? notes;

  CreateOrder({
    required this.orderNumber,
    required this.shippingAddress,
    required this.phoneNumber,
    required this.paymentMethod,
    this.notes,
  });
}