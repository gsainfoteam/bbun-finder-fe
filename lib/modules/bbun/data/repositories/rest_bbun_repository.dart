import 'package:bbun/modules/bbun/data/data_sources/remote/bbun_api.dart';
import 'package:bbun/modules/bbun/data/models/modify_bbun_user_model.dart';
import 'package:bbun/modules/bbun/domain/entities/bbun_user_entity.dart';
import 'package:bbun/modules/bbun/domain/entities/bbun_user_list_entity.dart';
import 'package:bbun/modules/bbun/domain/repositories/bbun_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: BbunRepository)
class RestBbunRepository implements BbunRepository {
  final BbunApi _api;

  RestBbunRepository(this._api);

  @override
  Future<BbunUserEntity> getUser() async {
    final response = await _api.getUser();
    return response;
  }

  @override
  Future<BbunUserEntity> register({
    required String? department,
    required String? mbti,
    required String? instaId,
    required String? description,
  }) async {
    final response = await _api.register(ModifyBbunUserModel(
      department: department,
      mbti: mbti,
      instaId: instaId,
      description: description,
    ));
    return response;
  }

  @override
  Future<BbunUserEntity> update({
    required String? department,
    required String? mbti,
    required String? instaId,
    required String? description,
  }) async {
    final response = await _api.register(ModifyBbunUserModel(
      department: department,
      mbti: mbti,
      instaId: instaId,
      description: description,
    ));
    return response;
  }

  @override
  Future<BbunUserListEntity> getBbunline() async {
    final response = await _api.getBbunline();
    return response;
  }
}
