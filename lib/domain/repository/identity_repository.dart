import 'package:sheba_ai/domain/model/identity/token_data.dart';

abstract class IdentityRepository {
  Future<TokenData?> getToken();

  Future<TokenData?> login({
    required String username,
    required String password,
  });

}
