// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'access_type_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AccessTypeModel _$AccessTypeModelFromJson(Map<String, dynamic> json) {
  return _AccessTypeModel.fromJson(json);
}

/// @nodoc
mixin _$AccessTypeModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AccessTypeModelCopyWith<AccessTypeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccessTypeModelCopyWith<$Res> {
  factory $AccessTypeModelCopyWith(
          AccessTypeModel value, $Res Function(AccessTypeModel) then) =
      _$AccessTypeModelCopyWithImpl<$Res, AccessTypeModel>;
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class _$AccessTypeModelCopyWithImpl<$Res, $Val extends AccessTypeModel>
    implements $AccessTypeModelCopyWith<$Res> {
  _$AccessTypeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AccessTypeModelCopyWith<$Res>
    implements $AccessTypeModelCopyWith<$Res> {
  factory _$$_AccessTypeModelCopyWith(
          _$_AccessTypeModel value, $Res Function(_$_AccessTypeModel) then) =
      __$$_AccessTypeModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class __$$_AccessTypeModelCopyWithImpl<$Res>
    extends _$AccessTypeModelCopyWithImpl<$Res, _$_AccessTypeModel>
    implements _$$_AccessTypeModelCopyWith<$Res> {
  __$$_AccessTypeModelCopyWithImpl(
      _$_AccessTypeModel _value, $Res Function(_$_AccessTypeModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$_AccessTypeModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AccessTypeModel implements _AccessTypeModel {
  _$_AccessTypeModel({required this.id, required this.name});

  factory _$_AccessTypeModel.fromJson(Map<String, dynamic> json) =>
      _$$_AccessTypeModelFromJson(json);

  @override
  final int id;
  @override
  final String name;

  @override
  String toString() {
    return 'AccessTypeModel(id: $id, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AccessTypeModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AccessTypeModelCopyWith<_$_AccessTypeModel> get copyWith =>
      __$$_AccessTypeModelCopyWithImpl<_$_AccessTypeModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AccessTypeModelToJson(
      this,
    );
  }
}

abstract class _AccessTypeModel implements AccessTypeModel {
  factory _AccessTypeModel(
      {required final int id, required final String name}) = _$_AccessTypeModel;

  factory _AccessTypeModel.fromJson(Map<String, dynamic> json) =
      _$_AccessTypeModel.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_AccessTypeModelCopyWith<_$_AccessTypeModel> get copyWith =>
      throw _privateConstructorUsedError;
}
