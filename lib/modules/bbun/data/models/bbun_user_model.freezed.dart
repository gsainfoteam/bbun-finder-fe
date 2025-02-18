// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bbun_user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BbunUserModel _$BbunUserModelFromJson(Map<String, dynamic> json) {
  return _BbunUserModel.fromJson(json);
}

/// @nodoc
mixin _$BbunUserModel {
  String get uuid => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'studentNumber')
  String get studentId => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  DateTime? get deletedAt => throw _privateConstructorUsedError;
  bool get isBbunRegistered => throw _privateConstructorUsedError;
  String? get department => throw _privateConstructorUsedError;
  @JsonKey(name: 'MBTI')
  String? get mbti => throw _privateConstructorUsedError;
  @JsonKey(name: 'insta_ID')
  String? get instaId => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get profileImage => throw _privateConstructorUsedError;

  /// Serializes this BbunUserModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BbunUserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BbunUserModelCopyWith<BbunUserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BbunUserModelCopyWith<$Res> {
  factory $BbunUserModelCopyWith(
          BbunUserModel value, $Res Function(BbunUserModel) then) =
      _$BbunUserModelCopyWithImpl<$Res, BbunUserModel>;
  @useResult
  $Res call(
      {String uuid,
      String name,
      @JsonKey(name: 'studentNumber') String studentId,
      String email,
      DateTime? createdAt,
      DateTime? updatedAt,
      DateTime? deletedAt,
      bool isBbunRegistered,
      String? department,
      @JsonKey(name: 'MBTI') String? mbti,
      @JsonKey(name: 'insta_ID') String? instaId,
      String? description,
      String? profileImage});
}

/// @nodoc
class _$BbunUserModelCopyWithImpl<$Res, $Val extends BbunUserModel>
    implements $BbunUserModelCopyWith<$Res> {
  _$BbunUserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BbunUserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? name = null,
    Object? studentId = null,
    Object? email = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? deletedAt = freezed,
    Object? isBbunRegistered = null,
    Object? department = freezed,
    Object? mbti = freezed,
    Object? instaId = freezed,
    Object? description = freezed,
    Object? profileImage = freezed,
  }) {
    return _then(_value.copyWith(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      studentId: null == studentId
          ? _value.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isBbunRegistered: null == isBbunRegistered
          ? _value.isBbunRegistered
          : isBbunRegistered // ignore: cast_nullable_to_non_nullable
              as bool,
      department: freezed == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as String?,
      mbti: freezed == mbti
          ? _value.mbti
          : mbti // ignore: cast_nullable_to_non_nullable
              as String?,
      instaId: freezed == instaId
          ? _value.instaId
          : instaId // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BbunUserModelImplCopyWith<$Res>
    implements $BbunUserModelCopyWith<$Res> {
  factory _$$BbunUserModelImplCopyWith(
          _$BbunUserModelImpl value, $Res Function(_$BbunUserModelImpl) then) =
      __$$BbunUserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uuid,
      String name,
      @JsonKey(name: 'studentNumber') String studentId,
      String email,
      DateTime? createdAt,
      DateTime? updatedAt,
      DateTime? deletedAt,
      bool isBbunRegistered,
      String? department,
      @JsonKey(name: 'MBTI') String? mbti,
      @JsonKey(name: 'insta_ID') String? instaId,
      String? description,
      String? profileImage});
}

/// @nodoc
class __$$BbunUserModelImplCopyWithImpl<$Res>
    extends _$BbunUserModelCopyWithImpl<$Res, _$BbunUserModelImpl>
    implements _$$BbunUserModelImplCopyWith<$Res> {
  __$$BbunUserModelImplCopyWithImpl(
      _$BbunUserModelImpl _value, $Res Function(_$BbunUserModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of BbunUserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? name = null,
    Object? studentId = null,
    Object? email = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? deletedAt = freezed,
    Object? isBbunRegistered = null,
    Object? department = freezed,
    Object? mbti = freezed,
    Object? instaId = freezed,
    Object? description = freezed,
    Object? profileImage = freezed,
  }) {
    return _then(_$BbunUserModelImpl(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      studentId: null == studentId
          ? _value.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isBbunRegistered: null == isBbunRegistered
          ? _value.isBbunRegistered
          : isBbunRegistered // ignore: cast_nullable_to_non_nullable
              as bool,
      department: freezed == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as String?,
      mbti: freezed == mbti
          ? _value.mbti
          : mbti // ignore: cast_nullable_to_non_nullable
              as String?,
      instaId: freezed == instaId
          ? _value.instaId
          : instaId // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BbunUserModelImpl extends _BbunUserModel {
  const _$BbunUserModelImpl(
      {required this.uuid,
      required this.name,
      @JsonKey(name: 'studentNumber') required this.studentId,
      required this.email,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      required this.isBbunRegistered,
      this.department,
      @JsonKey(name: 'MBTI') this.mbti,
      @JsonKey(name: 'insta_ID') this.instaId,
      this.description,
      this.profileImage})
      : super._();

  factory _$BbunUserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BbunUserModelImplFromJson(json);

  @override
  final String uuid;
  @override
  final String name;
  @override
  @JsonKey(name: 'studentNumber')
  final String studentId;
  @override
  final String email;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  @override
  final DateTime? deletedAt;
  @override
  final bool isBbunRegistered;
  @override
  final String? department;
  @override
  @JsonKey(name: 'MBTI')
  final String? mbti;
  @override
  @JsonKey(name: 'insta_ID')
  final String? instaId;
  @override
  final String? description;
  @override
  final String? profileImage;

  @override
  String toString() {
    return 'BbunUserModel(uuid: $uuid, name: $name, studentId: $studentId, email: $email, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, isBbunRegistered: $isBbunRegistered, department: $department, mbti: $mbti, instaId: $instaId, description: $description, profileImage: $profileImage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BbunUserModelImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.studentId, studentId) ||
                other.studentId == studentId) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt) &&
            (identical(other.isBbunRegistered, isBbunRegistered) ||
                other.isBbunRegistered == isBbunRegistered) &&
            (identical(other.department, department) ||
                other.department == department) &&
            (identical(other.mbti, mbti) || other.mbti == mbti) &&
            (identical(other.instaId, instaId) || other.instaId == instaId) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.profileImage, profileImage) ||
                other.profileImage == profileImage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uuid,
      name,
      studentId,
      email,
      createdAt,
      updatedAt,
      deletedAt,
      isBbunRegistered,
      department,
      mbti,
      instaId,
      description,
      profileImage);

  /// Create a copy of BbunUserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BbunUserModelImplCopyWith<_$BbunUserModelImpl> get copyWith =>
      __$$BbunUserModelImplCopyWithImpl<_$BbunUserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BbunUserModelImplToJson(
      this,
    );
  }
}

abstract class _BbunUserModel extends BbunUserModel {
  const factory _BbunUserModel(
      {required final String uuid,
      required final String name,
      @JsonKey(name: 'studentNumber') required final String studentId,
      required final String email,
      final DateTime? createdAt,
      final DateTime? updatedAt,
      final DateTime? deletedAt,
      required final bool isBbunRegistered,
      final String? department,
      @JsonKey(name: 'MBTI') final String? mbti,
      @JsonKey(name: 'insta_ID') final String? instaId,
      final String? description,
      final String? profileImage}) = _$BbunUserModelImpl;
  const _BbunUserModel._() : super._();

  factory _BbunUserModel.fromJson(Map<String, dynamic> json) =
      _$BbunUserModelImpl.fromJson;

  @override
  String get uuid;
  @override
  String get name;
  @override
  @JsonKey(name: 'studentNumber')
  String get studentId;
  @override
  String get email;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  DateTime? get deletedAt;
  @override
  bool get isBbunRegistered;
  @override
  String? get department;
  @override
  @JsonKey(name: 'MBTI')
  String? get mbti;
  @override
  @JsonKey(name: 'insta_ID')
  String? get instaId;
  @override
  String? get description;
  @override
  String? get profileImage;

  /// Create a copy of BbunUserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BbunUserModelImplCopyWith<_$BbunUserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
