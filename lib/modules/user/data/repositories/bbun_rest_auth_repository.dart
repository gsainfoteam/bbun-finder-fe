import 'package:bbun/modules/user/data/data_sources/remote/user_api.dart';
import 'package:bbun/modules/user/data/repositories/bbun_cookie_manager.dart';
import 'package:bbun/modules/user/data/repositories/bbun_web_auth_2_oauth_repository.dart';
import 'package:bbun/modules/user/data/repositories/bbun_web_storage_token_repository.dart';
import 'package:bbun/modules/user/data/repositories/rest_auth_repository.dart';
import 'package:bbun/modules/user/data/repositories/web_auth_2_oauth_repository.dart';
import 'package:bbun/modules/user/domain/repositories/token_repository.dart';
import 'package:injectable/injectable.dart';

@named
@Singleton(as: RestAuthRepository)
class BbunRestAuthRepository extends RestAuthRepository {
  BbunRestAuthRepository(
      UserApi api,
      @Named.from(BbunWebStorageTokenRepository)
      TokenRepository tokenRepository,
      BbunCookieManager cookieManager,
      @Named.from(BbunWebAuth2OauthRepository)
      WebAuth2OAuthRepository oAuthRepository)
      : super(
            api: api,
            tokenRepository: tokenRepository,
            cookieManager: cookieManager,
            oAuthRepository: oAuthRepository);
}
