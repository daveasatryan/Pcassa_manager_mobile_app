// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'warehosue_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WarehouseModel _$WarehouseModelFromJson(Map<String, dynamic> json) {
  return _WarehouseModel.fromJson(json);
}

/// @nodoc
mixin _$WarehouseModel {
  int get cod => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WarehouseModelCopyWith<WarehouseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WarehouseModelCopyWith<$Res> {
  factory $WarehouseModelCopyWith(
          WarehouseModel value, $Res Function(WarehouseModel) then) =
      _$WarehouseModelCopyWithImpl<$Res, WarehouseModel>;
  @useResult
  $Res call({int cod, String name});
}

/// @nodoc
class _$WarehouseModelCopyWithImpl<$Res, $Val extends WarehouseModel>
    implements $WarehouseModelCopyWith<$Res> {
  _$WarehouseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      cod: null == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WarehouseModelCopyWith<$Res>
    implements $WarehouseModelCopyWith<$Res> {
  factory _$$_WarehouseModelCopyWith(
          _$_WarehouseModel value, $Res Function(_$_WarehouseModel) then) =
      __$$_WarehouseModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int cod, String name});
}

/// @nodoc
class __$$_WarehouseModelCopyWithImpl<$Res>
    extends _$WarehouseModelCopyWithImpl<$Res, _$_WarehouseModel>
    implements _$$_WarehouseModelCopyWith<$Res> {
  __$$_WarehouseModelCopyWithImpl(
      _$_WarehouseModel _value, $Res Function(_$_WarehouseModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = null,
    Object? name = null,
  }) {
    return _then(_$_WarehouseModel(
      cod: null == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
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
class _$_WarehouseModel implements _WarehouseModel {
  _$_WarehouseModel({required this.cod, required this.name});

  factory _$_WarehouseModel.fromJson(Map<String, dynamic> json) =>
      _$$_WarehouseModelFromJson(json);

  @override
  final int cod;
  @override
  final String name;

  @override
  String toString() {
    return 'WarehouseModel(cod: $cod, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WarehouseModel &&
            (identical(other.cod, cod) || other.cod == cod) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, cod, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WarehouseModelCopyWith<_$_WarehouseModel> get copyWith =>
      __$$_WarehouseModelCopyWithImpl<_$_WarehouseModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WarehouseModelToJson(
      this,
    );
  }
}

abstract class _WarehouseModel implements WarehouseModel {
  factory _WarehouseModel(
      {required final int cod, required final String name}) = _$_WarehouseModel;

  factory _WarehouseModel.fromJson(Map<String, dynamic> json) =
      _$_WarehouseModel.fromJson;

  @override
  int get cod;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_WarehouseModelCopyWith<_$_WarehouseModel> get copyWith =>
      throw _privateConstructorUsedError;
}
