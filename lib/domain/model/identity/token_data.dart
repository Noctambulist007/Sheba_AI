class TokenData {
  final String tokenType;
  final int exp;
  final int iat;
  final String jti;
  final int userId;
  final String email;
  final String firstName;
  final String lastName;
  final bool isActive;
  final String currentDatetime;

  TokenData({
    required this.tokenType,
    required this.exp,
    required this.iat,
    required this.jti,
    required this.userId,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.isActive,
    required this.currentDatetime,
  });

  factory TokenData.fromJson(Map<String, dynamic> json) {
    return TokenData(
      tokenType: json['token_type'],
      exp: json['exp'],
      iat: json['iat'],
      jti: json['jti'],
      userId: json['user_id'],
      email: json['email'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      isActive: json['is_active'],
      currentDatetime: json['current_datetime'],
    );
  }
}
