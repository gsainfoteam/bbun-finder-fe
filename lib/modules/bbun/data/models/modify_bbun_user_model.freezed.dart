// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'modify_bbun_user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ModifyBbunUserModel _$ModifyBbunUserModelFromJson(Map<String, dynamic> json) {
  return _ModifyBbunUserModel.fromJson(json);
}

/// @nodoc
mixin _$ModifyBbunUserModel {
  String? get department => throw _privateConstructorUsedError;
  @JsonKey(name: 'MBTI')
  String? get mbti => throw _privateConstructorUsedError;
  @JsonKey(name: 'insta_ID')
  String? get instaId => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  /// Serializes this ModifyBbunUserModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ModifyBbunUserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ModifyBbunUserModelCopyWith<ModifyBbunUserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ModifyBbunUserModelCopyWith<$Res> {
  factory $ModifyBbunUserModelCopyWith(
          ModifyBbunUserModel value, $Res Function(ModifyBbunUserModel) then) =
      _$ModifyBbunUserModelCopyWithImpl<$Res, ModifyBbunUserModel>;
  @useResult
  $Res call(
      {String? department,
      @JsonKey(name: 'MBTI') String? mbti,
      @JsonKey(name: 'insta_ID') String? instaId,
      String? description});
}

/// @nodoc
class _$ModifyBbunUserModelCopyWithImpl<$Res, $Val extends ModifyBbunUserModel>
    implements $ModifyBbunUserModelCopyWith<$Res> {
  _$ModifyBbunUserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ModifyBbunUserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? department = freezed,
    Object? mbti = freezed,
    Object? instaId = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ModifyBbunUserModelImplCopyWith<$Res>
    implements $ModifyBbunUserModelCopyWith<$Res> {
  factory _$$ModifyBbunUserModelImplCopyWith(_$ModifyBbunUserModelImpl value,
          $Res Function(_$ModifyBbunUserModelImpl) then) =
      __$$ModifyBbunUserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? department,
      @JsonKey(name: 'MBTI') String? mbti,
      @JsonKey(name: 'insta_ID') String? instaId,
      String? description});
}

/// @nodoc
class __$$ModifyBbunUserModelImplCopyWithImpl<$Res>
    extends _$ModifyBbunUserModelCopyWithImpl<$Res, _$ModifyBbunUserModelImpl>
    implements _$$ModifyBbunUserModelImplCopyWith<$Res> {
  __$$ModifyBbunUserModelImplCopyWithImpl(_$ModifyBbunUserModelImpl _value,
      $Res Function(_$ModifyBbunUserModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ModifyBbunUserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? department = freezed,
    Object? mbti = freezed,
    Object? instaId = freezed,
    Object? description = freezed,
  }) {
    return _then(_$ModifyBbunUserModelImpl(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ModifyBbunUserModelImpl extends _ModifyBbunUserModel {
  const _$ModifyBbunUserModelImpl(
      {this.department,
      @JsonKey(name: 'MBTI') this.mbti,
      @JsonKey(name: 'insta_ID') this.instaId,
      this.description})
      : super._();

  factory _$ModifyBbunUserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ModifyBbunUserModelImplFromJson(json);

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
  String toString() {
    return 'ModifyBbunUserModel(department: $department, mbti: $mbti, instaId: $instaId, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ModifyBbunUserModelImpl &&
            (identical(other.department, department) ||
                other.department == department) &&
            (identical(other.mbti, mbti) || other.mbti == mbti) &&
            (identical(other.instaId, instaId) || other.instaId == instaId) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, department, mbti, instaId, description);

  /// Create a copy of ModifyBbunUserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ModifyBbunUserModelImplCopyWith<_$ModifyBbunUserModelImpl> get copyWith =>
      __$$ModifyBbunUserModelImplCopyWithImpl<_$ModifyBbunUserModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ModifyBbunUserModelImplToJson(
      this,
    );
  }
}

abstract class _ModifyBbunUserModel extends ModifyBbunUserModel {
  const factory _ModifyBbunUserModel(
      {final String? department,
      @JsonKey(name: 'MBTI') final String? mbti,
      @JsonKey(name: 'insta_ID') final String? instaId,
      final String? description}) = _$ModifyBbunUserModelImpl;
  const _ModifyBbunUserModel._() : super._();

  factory _ModifyBbunUserModel.fromJson(Map<String, dynamic> json) =
      _$ModifyBbunUserModelImpl.fromJson;

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

  /// Create a copy of ModifyBbunUserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ModifyBbunUserModelImplCopyWith<_$ModifyBbunUserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
