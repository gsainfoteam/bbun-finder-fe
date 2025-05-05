import '../entities/token_entity.dart';

abstract class OAuthRepository {
  Future<TokenEntity> getToken();
  Future<void> setRecentLogout([bool value = true]);
}
