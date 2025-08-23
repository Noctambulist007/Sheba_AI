class Register {
  final String username;
  final String email;
  final String firstName;
  final String lastName;
  final String phone;
  final String address;

  Register({
    required this.username,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.address,
  });

  @override
  String toString() {
    return 'Register{username: $username, email: $email, firstName: $firstName, lastName: $lastName, phone: $phone, address: $address}';
  }
}