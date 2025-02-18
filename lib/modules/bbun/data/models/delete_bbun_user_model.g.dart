// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_bbun_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DeleteBbunUserModelImpl _$$DeleteBbunUserModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DeleteBbunUserModelImpl(
      studentId: json['studentNumber'] as String,
      isBbunRegistered: json['isBbunRegistered'] as bool,
    );

Map<String, dynamic> _$$DeleteBbunUserModelImplToJson(
        _$DeleteBbunUserModelImpl instance) =>
    <String, dynamic>{
      'studentNumber': instance.studentId,
      'isBbunRegistered': instance.isBbunRegistered,
    };
