import 'package:bbun/modules/bbun/domain/entities/bbun_user_entity.dart';
import 'package:bbun/modules/bbun/domain/entities/bbun_user_list_entity.dart';

abstract class BbunRepository {
  Future<BbunUserEntity> getUser();
  Future<BbunUserEntity> register({
    required String? department,
    required String? mbti,
    required String? instaId,
    required String? description,
  });
  Future<BbunUserEntity> update({
    required String? department,
    required String? mbti,
    required String? instaId,
    required String? description,
  });
  Future<BbunUserListEntity> getBbunline();
}
