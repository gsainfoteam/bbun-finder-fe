import 'package:bbun/modules/core/data/dio/idp_dio.dart';
import 'package:bbun/modules/user/data/models/token_model.dart';
import 'package:bbun/modules/user/data/models/token_request_with_code_model.dart';
import 'package:bbun/modules/user/data/models/token_request_with_refresh_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'oauth_api.g.dart';

@injectable
@RestApi(baseUrl: 'oauth/')
abstract class OAuthApi {
  @factoryMethod
  factory OAuthApi(IdPDio dio) = _OAuthApi;

  @POST('token')
  Future<TokenModel> getTokenFromCode(
    @Body() TokenRequestWithCodeModel request,
  );

  @POST('token')
  Future<TokenModel> getTokenFromRefresh(
    @Body() TokenRequestWithRefreshModel request,
  );
}
