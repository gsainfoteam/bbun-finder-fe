// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delete_bbun_user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DeleteBbunUserModel _$DeleteBbunUserModelFromJson(Map<String, dynamic> json) {
  return _DeleteBbunUserModel.fromJson(json);
}

/// @nodoc
mixin _$DeleteBbunUserModel {
  @JsonKey(name: 'studentNumber')
  String get studentId => throw _privateConstructorUsedError;
  bool get isBbunRegistered => throw _privateConstructorUsedError;

  /// Serializes this DeleteBbunUserModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DeleteBbunUserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeleteBbunUserModelCopyWith<DeleteBbunUserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeleteBbunUserModelCopyWith<$Res> {
  factory $DeleteBbunUserModelCopyWith(
          DeleteBbunUserModel value, $Res Function(DeleteBbunUserModel) then) =
      _$DeleteBbunUserModelCopyWithImpl<$Res, DeleteBbunUserModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'studentNumber') String studentId,
      bool isBbunRegistered});
}

/// @nodoc
class _$DeleteBbunUserModelCopyWithImpl<$Res, $Val extends DeleteBbunUserModel>
    implements $DeleteBbunUserModelCopyWith<$Res> {
  _$DeleteBbunUserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeleteBbunUserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? studentId = null,
    Object? isBbunRegistered = null,
  }) {
    return _then(_value.copyWith(
      studentId: null == studentId
          ? _value.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as String,
      isBbunRegistered: null == isBbunRegistered
          ? _value.isBbunRegistered
          : isBbunRegistered // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeleteBbunUserModelImplCopyWith<$Res>
    implements $DeleteBbunUserModelCopyWith<$Res> {
  factory _$$DeleteBbunUserModelImplCopyWith(_$DeleteBbunUserModelImpl value,
          $Res Function(_$DeleteBbunUserModelImpl) then) =
      __$$DeleteBbunUserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'studentNumber') String studentId,
      bool isBbunRegistered});
}

/// @nodoc
class __$$DeleteBbunUserModelImplCopyWithImpl<$Res>
    extends _$DeleteBbunUserModelCopyWithImpl<$Res, _$DeleteBbunUserModelImpl>
    implements _$$DeleteBbunUserModelImplCopyWith<$Res> {
  __$$DeleteBbunUserModelImplCopyWithImpl(_$DeleteBbunUserModelImpl _value,
      $Res Function(_$DeleteBbunUserModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeleteBbunUserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? studentId = null,
    Object? isBbunRegistered = null,
  }) {
    return _then(_$DeleteBbunUserModelImpl(
      studentId: null == studentId
          ? _value.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as String,
      isBbunRegistered: null == isBbunRegistered
          ? _value.isBbunRegistered
          : isBbunRegistered // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeleteBbunUserModelImpl extends _DeleteBbunUserModel {
  const _$DeleteBbunUserModelImpl(
      {@JsonKey(name: 'studentNumber') required this.studentId,
      required this.isBbunRegistered})
      : super._();

  factory _$DeleteBbunUserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeleteBbunUserModelImplFromJson(json);

  @override
  @JsonKey(name: 'studentNumber')
  final String studentId;
  @override
  final bool isBbunRegistered;

  @override
  String toString() {
    return 'DeleteBbunUserModel(studentId: $studentId, isBbunRegistered: $isBbunRegistered)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteBbunUserModelImpl &&
            (identical(other.studentId, studentId) ||
                other.studentId == studentId) &&
            (identical(other.isBbunRegistered, isBbunRegistered) ||
                other.isBbunRegistered == isBbunRegistered));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, studentId, isBbunRegistered);

  /// Create a copy of DeleteBbunUserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteBbunUserModelImplCopyWith<_$DeleteBbunUserModelImpl> get copyWith =>
      __$$DeleteBbunUserModelImplCopyWithImpl<_$DeleteBbunUserModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeleteBbunUserModelImplToJson(
      this,
    );
  }
}

abstract class _DeleteBbunUserModel extends DeleteBbunUserModel {
  const factory _DeleteBbunUserModel(
      {@JsonKey(name: 'studentNumber') required final String studentId,
      required final bool isBbunRegistered}) = _$DeleteBbunUserModelImpl;
  const _DeleteBbunUserModel._() : super._();

  factory _DeleteBbunUserModel.fromJson(Map<String, dynamic> json) =
      _$DeleteBbunUserModelImpl.fromJson;

  @override
  @JsonKey(name: 'studentNumber')
  String get studentId;
  @override
  bool get isBbunRegistered;

  /// Create a copy of DeleteBbunUserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeleteBbunUserModelImplCopyWith<_$DeleteBbunUserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
