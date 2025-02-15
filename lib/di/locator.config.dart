// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:bbun/modules/core/data/dio/bbun_dio.dart' as _i328;
import 'package:bbun/modules/core/data/repositories/memory_api_channel_repository.dart'
    as _i668;
import 'package:bbun/modules/core/domain/repositories/api_channel_repository.dart'
    as _i372;
import 'package:bbun/modules/user/data/data_sources/remote/bbun_authorize_interceptor.dart'
    as _i772;
import 'package:bbun/modules/user/data/data_sources/remote/user_api.dart'
    as _i451;
import 'package:bbun/modules/user/data/repositories/bbun_cookie_manager.dart'
    as _i59;
import 'package:bbun/modules/user/data/repositories/bbun_rest_auth_repository.dart'
    as _i19;
import 'package:bbun/modules/user/data/repositories/bbun_web_auth_2_oauth_repository.dart'
    as _i278;
import 'package:bbun/modules/user/data/repositories/bbun_web_storage_token_repository.dart'
    as _i496;
import 'package:bbun/modules/user/data/repositories/rest_auth_repository.dart'
    as _i226;
import 'package:bbun/modules/user/data/repositories/web_auth_2_oauth_repository.dart'
    as _i843;
import 'package:bbun/modules/user/domain/repositories/token_repository.dart'
    as _i244;
import 'package:bbun/modules/user/presentation/bloc/auth_bloc.dart' as _i213;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i59.BbunCookieManager>(() => _i59.BbunCookieManager());
    gh.singleton<_i244.TokenRepository>(
      () => _i496.BbunWebStorageTokenRepository(),
      instanceName: 'BbunWebStorageTokenRepository',
    );
    gh.singleton<_i772.BbunAuthorizeInterceptor>(() =>
        _i772.BbunAuthorizeInterceptor(gh<_i244.TokenRepository>(
            instanceName: 'BbunWebStorageTokenRepository')));
    gh.singleton<_i843.WebAuth2OAuthRepository>(
      () => _i278.BbunWebAuth2OauthRepository(),
      instanceName: 'BbunWebAuth2OauthRepository',
    );
    gh.singleton<_i328.BbunDio>(() => _i328.BbunDio(
          gh<_i772.BbunAuthorizeInterceptor>(),
          gh<_i59.BbunCookieManager>(),
        ));
    gh.singleton<_i372.ApiChannelRepository>(
      () => _i668.MemoryApiChannelRepository(gh<_i328.BbunDio>()),
      dispose: _i668.MemoryApiChannelRepository.dispose,
    );
    gh.factory<_i451.UserApi>(() => _i451.UserApi(gh<_i328.BbunDio>()));
    gh.singleton<_i226.RestAuthRepository>(
      () => _i19.BbunRestAuthRepository(
        gh<_i451.UserApi>(),
        gh<_i244.TokenRepository>(
            instanceName: 'BbunWebStorageTokenRepository'),
        gh<_i59.BbunCookieManager>(),
        gh<_i843.WebAuth2OAuthRepository>(
            instanceName: 'BbunWebAuth2OauthRepository'),
      ),
      instanceName: 'BbunRestAuthRepository',
    );
    gh.factory<_i213.AuthBloc>(() => _i213.AuthBloc(
        gh<_i226.RestAuthRepository>(instanceName: 'BbunRestAuthRepository')));
    return this;
  }
}
