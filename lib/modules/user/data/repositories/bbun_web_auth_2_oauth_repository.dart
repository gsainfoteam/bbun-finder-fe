import 'package:injectable/injectable.dart';

import 'web_auth_2_oauth_repository.dart';

@named
@Singleton(as: WebAuth2OAuthRepository)
class BbunWebAuth2OauthRepository extends WebAuth2OAuthRepository {
  BbunWebAuth2OauthRepository(super.api);
}
