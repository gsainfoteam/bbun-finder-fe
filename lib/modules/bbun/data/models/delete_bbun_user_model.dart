import "package:bbun/modules/bbun/domain/entities/delete_bbun_user_entity.dart";
import "package:freezed_annotation/freezed_annotation.dart";

part 'delete_bbun_user_model.freezed.dart';
part 'delete_bbun_user_model.g.dart';

@freezed
class DeleteBbunUserModel
    with _$DeleteBbunUserModel
    implements DeleteBbunUserEntity {
  const DeleteBbunUserModel._();

  const factory DeleteBbunUserModel({
    @JsonKey(name: 'studentNumber') required String studentId,
    required bool isBbunRegistered,
  }) = _DeleteBbunUserModel;

  factory DeleteBbunUserModel.fromJson(Map<String, dynamic> json) =>
      _$DeleteBbunUserModelFromJson(json);
}
