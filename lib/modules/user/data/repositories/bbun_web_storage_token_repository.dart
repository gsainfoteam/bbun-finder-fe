import 'package:bbun/modules/user/data/repositories/web_storage_token_repository.dart';
import 'package:bbun/modules/user/domain/repositories/token_repository.dart';
import 'package:injectable/injectable.dart';

@named
@Singleton(as: TokenRepository)
class BbunWebStorageTokenRepository extends WebStorageTokenRepository {
  BbunWebStorageTokenRepository()
      : super(
          tokenKey: '_bbun_token',
          expiredAtKey: '_bbun_expiredAt',
          refreshTokenKey: '_bbun_refreshToken',
          refreshTokenExpiredAtKey: '_bbun_refreshTokenExpiredAt',
        );
}
