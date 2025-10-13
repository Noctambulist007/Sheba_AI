
class ListOfOrderItem {
  final int id;
  final String orderNumber;
  final String status;
  final String statusDisplay;
  final String totalPrice;
  final String paymentMethod;
  final String paymentMethodDisplay;
  final bool paymentStatus;
  final int itemCount;
  final String createdAt;

  ListOfOrderItem({
    required this.id,
    required this.orderNumber,
    required this.status,
    required this.statusDisplay,
    required this.totalPrice,
    required this.paymentMethod,
    required this.paymentMethodDisplay,
    required this.paymentStatus,
    required this.itemCount,
    required this.createdAt,
  });
}
