import 'package:bbun/modules/bbun/data/models/bbun_user_list_model.dart';
import 'package:bbun/modules/bbun/data/models/bbun_user_model.dart';
import 'package:bbun/modules/bbun/data/models/modify_bbun_user_model.dart';
import 'package:bbun/modules/core/data/dio/bbun_dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'bbun_api.g.dart';

@injectable
@RestApi(baseUrl: 'user/')
abstract class BbunApi {
  @factoryMethod
  factory BbunApi(BbunDio dio) = _BbunApi;

  @GET('')
  Future<BbunUserModel> getUser();

  @PATCH('register')
  Future<BbunUserModel> register(@Body() ModifyBbunUserModel model,
      {@Header("Content-Type") String contentType = "application/json"});

  @PATCH('')
  Future<BbunUserModel> update(@Body() ModifyBbunUserModel model,
      {@Header("Content-Type") String contentType = "application/json"});

  @GET('bbunline')
  Future<BbunUserListModel> getBbunline();
}
