
import 'package:sheba_ai/data/datasource/remote/model/response/identity/profile_response.dart';
import 'package:sheba_ai/domain/model/identity/profile.dart';

extension ProfileResponseMapper on ProfileResponse {
  Profile toProfile() {
    return Profile(
      id: id,
      username: username,
      firstName: firstName,
      lastName: lastName,
      email: email,
      phone: phone ?? "",
      address: address ?? "",
      createdAt: createdAt,
    );
  }
}
