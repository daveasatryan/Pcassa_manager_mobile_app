// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'station_type_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StationTypeModel _$StationTypeModelFromJson(Map<String, dynamic> json) {
  return _StationTypeModel.fromJson(json);
}

/// @nodoc
mixin _$StationTypeModel {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get rshet => throw _privateConstructorUsedError;
  String? get prim => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StationTypeModelCopyWith<StationTypeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StationTypeModelCopyWith<$Res> {
  factory $StationTypeModelCopyWith(
          StationTypeModel value, $Res Function(StationTypeModel) then) =
      _$StationTypeModelCopyWithImpl<$Res, StationTypeModel>;
  @useResult
  $Res call({int? id, String? name, String? rshet, String? prim});
}

/// @nodoc
class _$StationTypeModelCopyWithImpl<$Res, $Val extends StationTypeModel>
    implements $StationTypeModelCopyWith<$Res> {
  _$StationTypeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? rshet = freezed,
    Object? prim = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      rshet: freezed == rshet
          ? _value.rshet
          : rshet // ignore: cast_nullable_to_non_nullable
              as String?,
      prim: freezed == prim
          ? _value.prim
          : prim // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StationTypeModelCopyWith<$Res>
    implements $StationTypeModelCopyWith<$Res> {
  factory _$$_StationTypeModelCopyWith(
          _$_StationTypeModel value, $Res Function(_$_StationTypeModel) then) =
      __$$_StationTypeModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? name, String? rshet, String? prim});
}

/// @nodoc
class __$$_StationTypeModelCopyWithImpl<$Res>
    extends _$StationTypeModelCopyWithImpl<$Res, _$_StationTypeModel>
    implements _$$_StationTypeModelCopyWith<$Res> {
  __$$_StationTypeModelCopyWithImpl(
      _$_StationTypeModel _value, $Res Function(_$_StationTypeModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? rshet = freezed,
    Object? prim = freezed,
  }) {
    return _then(_$_StationTypeModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      rshet: freezed == rshet
          ? _value.rshet
          : rshet // ignore: cast_nullable_to_non_nullable
              as String?,
      prim: freezed == prim
          ? _value.prim
          : prim // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StationTypeModel implements _StationTypeModel {
  _$_StationTypeModel(
      {required this.id,
      required this.name,
      required this.rshet,
      required this.prim});

  factory _$_StationTypeModel.fromJson(Map<String, dynamic> json) =>
      _$$_StationTypeModelFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? rshet;
  @override
  final String? prim;

  @override
  String toString() {
    return 'StationTypeModel(id: $id, name: $name, rshet: $rshet, prim: $prim)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StationTypeModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.rshet, rshet) || other.rshet == rshet) &&
            (identical(other.prim, prim) || other.prim == prim));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, rshet, prim);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StationTypeModelCopyWith<_$_StationTypeModel> get copyWith =>
      __$$_StationTypeModelCopyWithImpl<_$_StationTypeModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StationTypeModelToJson(
      this,
    );
  }
}

abstract class _StationTypeModel implements StationTypeModel {
  factory _StationTypeModel(
      {required final int? id,
      required final String? name,
      required final String? rshet,
      required final String? prim}) = _$_StationTypeModel;

  factory _StationTypeModel.fromJson(Map<String, dynamic> json) =
      _$_StationTypeModel.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get rshet;
  @override
  String? get prim;
  @override
  @JsonKey(ignore: true)
  _$$_StationTypeModelCopyWith<_$_StationTypeModel> get copyWith =>
      throw _privateConstructorUsedError;
}
