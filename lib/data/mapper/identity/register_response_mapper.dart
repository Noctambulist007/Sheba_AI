import 'package:sheba_ai/data/datasource/remote/model/response/identity/register_response.dart';
import 'package:sheba_ai/domain/model/identity/register.dart';

extension RegisterResponseMapper on RegisterResponse {
  Register toRegister() {
    return Register(
      username: username,
      email: email,
      firstName: firstName,
      lastName: lastName,
      phone: phone,
      address: address,
    );
  }
}