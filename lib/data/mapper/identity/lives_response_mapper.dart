
import 'package:sheba_ai/data/datasource/remote/model/response/identity/lives_response.dart';
import 'package:sheba_ai/domain/model/identity/lives.dart';

extension LivesResponseMapper on LivesResponse {
  Lives toLives() {
    return Lives(
      livesRemaining: livesRemaining,
      maxLives: maxLives,
      lastReset: lastReset,
      nextReset: nextReset,
    );
  }
}
