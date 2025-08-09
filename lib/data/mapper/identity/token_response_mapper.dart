//
// extension TokenResponseMapper on Map<String, dynamic> {
//   TokenData toTokenData() {
//     return TokenData(
//       tokenType: this['token_type'],
//       exp: this['exp'],
//       iat: this['iat'],
//       jti: this['jti'],
//       userId: this['user_id'],
//       email: this['email']??"",
//       firstName: this['first_name']??"",
//       lastName: this['last_name']??"",
//       isActive: this['is_active']??true,
//       currentDatetime: this['current_datetime']??"",
//     );
//   }
// }
