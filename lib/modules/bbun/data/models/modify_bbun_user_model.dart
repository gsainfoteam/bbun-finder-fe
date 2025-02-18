import "package:freezed_annotation/freezed_annotation.dart";

part 'modify_bbun_user_model.freezed.dart';
part 'modify_bbun_user_model.g.dart';

@freezed
class ModifyBbunUserModel with _$ModifyBbunUserModel {
  const ModifyBbunUserModel._();

  const factory ModifyBbunUserModel({
    String? department,
    @JsonKey(name: 'MBTI') String? mbti,
    @JsonKey(name: 'insta_ID') String? instaId,
    String? description,
  }) = _ModifyBbunUserModel;

  factory ModifyBbunUserModel.fromJson(Map<String, dynamic> json) =>
      _$ModifyBbunUserModelFromJson(json);
}
