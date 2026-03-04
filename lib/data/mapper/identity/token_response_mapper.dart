import 'package:sheba_ai/domain/model/identity/token_data.dart';

extension TokenResponseMapper on Map<String, dynamic> {
  TokenData toTokenData() {
    return TokenData(
      tokenType: this['token_type'],
      exp: this['exp'] is int ? this['exp'] : int.parse(this['exp'].toString()),
      iat: this['iat'] is int ? this['iat'] : int.parse(this['iat'].toString()),
      jti: this['jti'],
      userId: this['user_id'] is int
          ? this['user_id']
          : int.parse(this['user_id'].toString()),
      email: this['email'] ?? "",
      firstName: this['first_name'] ?? "",
      lastName: this['last_name'] ?? "",
      isActive: this['is_active'] ?? true,
      currentDatetime: this['current_datetime'] ?? "",
    );
  }
}
