// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'access_pageaccess_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AccessPageAccessModel _$AccessPageAccessModelFromJson(
    Map<String, dynamic> json) {
  return _AccessPageAccessModel.fromJson(json);
}

/// @nodoc
mixin _$AccessPageAccessModel {
  String? get name => throw _privateConstructorUsedError;
  set name(String? value) => throw _privateConstructorUsedError;
  bool? get status => throw _privateConstructorUsedError;
  set status(bool? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AccessPageAccessModelCopyWith<AccessPageAccessModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccessPageAccessModelCopyWith<$Res> {
  factory $AccessPageAccessModelCopyWith(AccessPageAccessModel value,
          $Res Function(AccessPageAccessModel) then) =
      _$AccessPageAccessModelCopyWithImpl<$Res, AccessPageAccessModel>;
  @useResult
  $Res call({String? name, bool? status});
}

/// @nodoc
class _$AccessPageAccessModelCopyWithImpl<$Res,
        $Val extends AccessPageAccessModel>
    implements $AccessPageAccessModelCopyWith<$Res> {
  _$AccessPageAccessModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AccessPageAccessModelCopyWith<$Res>
    implements $AccessPageAccessModelCopyWith<$Res> {
  factory _$$_AccessPageAccessModelCopyWith(_$_AccessPageAccessModel value,
          $Res Function(_$_AccessPageAccessModel) then) =
      __$$_AccessPageAccessModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? name, bool? status});
}

/// @nodoc
class __$$_AccessPageAccessModelCopyWithImpl<$Res>
    extends _$AccessPageAccessModelCopyWithImpl<$Res, _$_AccessPageAccessModel>
    implements _$$_AccessPageAccessModelCopyWith<$Res> {
  __$$_AccessPageAccessModelCopyWithImpl(_$_AccessPageAccessModel _value,
      $Res Function(_$_AccessPageAccessModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? status = freezed,
  }) {
    return _then(_$_AccessPageAccessModel(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AccessPageAccessModel implements _AccessPageAccessModel {
  _$_AccessPageAccessModel({this.name, this.status});

  factory _$_AccessPageAccessModel.fromJson(Map<String, dynamic> json) =>
      _$$_AccessPageAccessModelFromJson(json);

  @override
  String? name;
  @override
  bool? status;

  @override
  String toString() {
    return 'AccessPageAccessModel(name: $name, status: $status)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AccessPageAccessModelCopyWith<_$_AccessPageAccessModel> get copyWith =>
      __$$_AccessPageAccessModelCopyWithImpl<_$_AccessPageAccessModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AccessPageAccessModelToJson(
      this,
    );
  }
}

abstract class _AccessPageAccessModel implements AccessPageAccessModel {
  factory _AccessPageAccessModel({String? name, bool? status}) =
      _$_AccessPageAccessModel;

  factory _AccessPageAccessModel.fromJson(Map<String, dynamic> json) =
      _$_AccessPageAccessModel.fromJson;

  @override
  String? get name;
  set name(String? value);
  @override
  bool? get status;
  set status(bool? value);
  @override
  @JsonKey(ignore: true)
  _$$_AccessPageAccessModelCopyWith<_$_AccessPageAccessModel> get copyWith =>
      throw _privateConstructorUsedError;
}
