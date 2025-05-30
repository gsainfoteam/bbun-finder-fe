import 'package:bbun/modules/user/data/data_sources/remote/base_auth_api.dart';
import 'package:bbun/modules/user/data/repositories/bbun_cookie_manager.dart';
import 'package:bbun/modules/user/domain/repositories/auth_repository.dart';
import 'package:bbun/modules/user/domain/repositories/oauth_repository.dart';
import 'package:bbun/modules/user/domain/repositories/token_repository.dart';

abstract class RestAuthRepository implements AuthRepository {
  final BaseAuthApi _api;
  final TokenRepository _tokenRepository;
  final BbunCookieManager _cookieManager;
  final OAuthRepository _oAuthRepository;

  RestAuthRepository({
    required BaseAuthApi api,
    required TokenRepository tokenRepository,
    required BbunCookieManager cookieManager,
    required OAuthRepository oAuthRepository,
  })  : _api = api,
        _tokenRepository = tokenRepository,
        _cookieManager = cookieManager,
        _oAuthRepository = oAuthRepository;

  @override
  Future<void> login() async {
    final token = await _oAuthRepository.getToken();
    await _tokenRepository.saveToken(token.accessToken);
    if (token.refreshToken != null) {
      await _tokenRepository.saveRefreshToken(token.refreshToken!);
    }
  }

  @override
  Stream<bool> get isSignedIn => _tokenRepository.token.asyncMap(
        (_) async {
          try {
            await _api.info();
            return true;
          } catch (_) {
            return false;
          }
        },
      );

  @override
  Future<void> logout() async {
    await _tokenRepository.deleteToken();
    await _cookieManager.deleteAllCookies();
    await _oAuthRepository.setRecentLogout(true);
  }
}
