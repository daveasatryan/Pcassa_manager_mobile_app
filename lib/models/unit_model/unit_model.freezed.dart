// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'unit_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnitModel _$UnitModelFromJson(Map<String, dynamic> json) {
  return _UnitModel.fromJson(json);
}

/// @nodoc
mixin _$UnitModel {
  String get guid => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnitModelCopyWith<UnitModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnitModelCopyWith<$Res> {
  factory $UnitModelCopyWith(UnitModel value, $Res Function(UnitModel) then) =
      _$UnitModelCopyWithImpl<$Res, UnitModel>;
  @useResult
  $Res call({String guid, String name});
}

/// @nodoc
class _$UnitModelCopyWithImpl<$Res, $Val extends UnitModel>
    implements $UnitModelCopyWith<$Res> {
  _$UnitModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? guid = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      guid: null == guid
          ? _value.guid
          : guid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UnitModelCopyWith<$Res> implements $UnitModelCopyWith<$Res> {
  factory _$$_UnitModelCopyWith(
          _$_UnitModel value, $Res Function(_$_UnitModel) then) =
      __$$_UnitModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String guid, String name});
}

/// @nodoc
class __$$_UnitModelCopyWithImpl<$Res>
    extends _$UnitModelCopyWithImpl<$Res, _$_UnitModel>
    implements _$$_UnitModelCopyWith<$Res> {
  __$$_UnitModelCopyWithImpl(
      _$_UnitModel _value, $Res Function(_$_UnitModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? guid = null,
    Object? name = null,
  }) {
    return _then(_$_UnitModel(
      guid: null == guid
          ? _value.guid
          : guid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnitModel implements _UnitModel {
  _$_UnitModel({required this.guid, required this.name});

  factory _$_UnitModel.fromJson(Map<String, dynamic> json) =>
      _$$_UnitModelFromJson(json);

  @override
  final String guid;
  @override
  final String name;

  @override
  String toString() {
    return 'UnitModel(guid: $guid, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UnitModel &&
            (identical(other.guid, guid) || other.guid == guid) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, guid, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UnitModelCopyWith<_$_UnitModel> get copyWith =>
      __$$_UnitModelCopyWithImpl<_$_UnitModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnitModelToJson(
      this,
    );
  }
}

abstract class _UnitModel implements UnitModel {
  factory _UnitModel({required final String guid, required final String name}) =
      _$_UnitModel;

  factory _UnitModel.fromJson(Map<String, dynamic> json) =
      _$_UnitModel.fromJson;

  @override
  String get guid;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_UnitModelCopyWith<_$_UnitModel> get copyWith =>
      throw _privateConstructorUsedError;
}
