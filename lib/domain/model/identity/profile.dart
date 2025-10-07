class Profile {
  final int id;
  final String username;
  final String email;
  final String firstName;
  final String lastName;
  final String phone;
  final String address;
  final String createdAt;

  Profile({
    required this.id,
    required this.username,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.address,
    required this.createdAt,
  });

  @override
  String toString() {
    return 'Profile{id: $id, username: $username, email: $email, firstName: $firstName, lastName: $lastName, phone: $phone, address: $address, createdAt: $createdAt}';
  }
}
