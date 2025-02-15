import 'package:bbun/di/locator.dart';
import 'package:bbun/modules/core/data/dio/bbun_dio.dart';
import 'package:bbun/modules/user/data/data_sources/remote/authorize_interceptor.dart';
import 'package:bbun/modules/user/data/data_sources/remote/user_api.dart';
import 'package:bbun/modules/user/data/repositories/bbun_web_storage_token_repository.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@singleton
class BbunAuthorizeInterceptor extends AuthorizeInterceptor {
  final String identifier = "BbunInterceptor";

  BbunAuthorizeInterceptor(
    @Named.from(BbunWebStorageTokenRepository) super.repository,
  );

  @override
  Dio getDio() {
    return sl<BbunDio>();
  }

  @override
  Future<bool> refresh() async {
    if (mutex.isWriteLocked) {
      await mutex.acquireRead();
      mutex.release();
      return true;
    }
    await mutex.acquireWrite();
    final userApi = sl<UserApi>();
    try {
      final token = await userApi.refresh();
      await repository.saveToken(token.accessToken);
      return true;
    } catch (e) {
      await repository.deleteToken();
      return false;
    } finally {
      mutex.release();
    }
  }
}
