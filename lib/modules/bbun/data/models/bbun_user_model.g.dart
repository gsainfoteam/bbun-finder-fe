// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bbun_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BbunUserModelImpl _$$BbunUserModelImplFromJson(Map<String, dynamic> json) =>
    _$BbunUserModelImpl(
      uuid: json['uuid'] as String,
      name: json['name'] as String,
      studentId: json['studentNumber'] as String,
      email: json['email'] as String,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
      isBbunRegistered: json['isBbunRegistered'] as bool,
      department: json['department'] as String?,
      mbti: json['MBTI'] as String?,
      instaId: json['insta_ID'] as String?,
      description: json['description'] as String?,
      profileImage: json['profileImage'] as String?,
    );

Map<String, dynamic> _$$BbunUserModelImplToJson(_$BbunUserModelImpl instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'studentNumber': instance.studentId,
      'email': instance.email,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'deletedAt': instance.deletedAt?.toIso8601String(),
      'isBbunRegistered': instance.isBbunRegistered,
      'department': instance.department,
      'MBTI': instance.mbti,
      'insta_ID': instance.instaId,
      'description': instance.description,
      'profileImage': instance.profileImage,
    };
