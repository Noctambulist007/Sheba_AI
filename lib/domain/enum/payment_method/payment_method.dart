enum PaymentMethod {
  cashOnDelivery('cash_on_delivery', 'Cash on Delivery'),
  creditCard('credit_card', 'Credit Card'),
  mobileBanking('mobile_banking', 'Mobile Banking');

  final String code;
  final String description;

  const PaymentMethod(this.code, this.description);

  static PaymentMethod? fromCode(String code) {
    for (var method in PaymentMethod.values) {
      if (method.code == code) {
        return method;
      }
    }
    return null;
  }
}
