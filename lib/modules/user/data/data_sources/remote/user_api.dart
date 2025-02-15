import 'package:bbun/modules/core/data/dio/bbun_dio.dart';
import 'package:bbun/modules/user/data/data_sources/remote/base_auth_api.dart';
import 'package:bbun/modules/user/data/models/token_model.dart';
import 'package:bbun/modules/user/data/models/user_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:bbun/modules/user/data/data_sources/remote/authorize_interceptor.dart';

part 'user_api.g.dart';

@injectable
@RestApi(baseUrl: 'user/')
abstract class UserApi extends BaseAuthApi {
  @factoryMethod
  factory UserApi(BbunDio dio) = _UserApi;

  @override
  @GET('login')
  Future<TokenModel> login(
    @Query('code') String code, [
    @Query('type') String type = 'local',
  ]);

  @POST('refresh')
  @Extra({AuthorizeInterceptor.retriedKey: true})
  Future<TokenModel> refresh();

  @override
  @GET('')
  Future<UserModel> info();
}
