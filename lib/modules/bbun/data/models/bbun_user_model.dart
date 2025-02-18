import 'package:bbun/modules/bbun/domain/entities/bbun_user_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bbun_user_model.freezed.dart';
part 'bbun_user_model.g.dart';

@freezed
class BbunUserModel with _$BbunUserModel implements BbunUserEntity {
  const BbunUserModel._();

  const factory BbunUserModel({
    required String uuid,
    required String name,
    @JsonKey(name: 'studentNumber') required String studentId,
    required String email,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
    required bool isBbunRegistered,
    String? department,
    @JsonKey(name: 'MBTI') String? mbti,
    @JsonKey(name: 'insta_ID') String? instaId,
    String? description,
    String? profileImage,
  }) = _BbunUserModel;

  factory BbunUserModel.fromJson(Map<String, dynamic> json) =>
      _$BbunUserModelFromJson(json);

  @override
  BbunUserModel toModel() {
    return BbunUserModel(
      uuid: uuid,
      name: name,
      studentId: studentId,
      email: email,
      createdAt: createdAt,
      updatedAt: updatedAt,
      deletedAt: deletedAt,
      isBbunRegistered: isBbunRegistered,
      department: department,
      mbti: mbti,
      instaId: instaId,
      description: description,
      profileImage: profileImage,
    );
  }
}
