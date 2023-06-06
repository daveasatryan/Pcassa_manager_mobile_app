// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'spent_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SpentModel _$SpentModelFromJson(Map<String, dynamic> json) {
  return _SpentModel.fromJson(json);
}

/// @nodoc
mixin _$SpentModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SpentModelCopyWith<SpentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpentModelCopyWith<$Res> {
  factory $SpentModelCopyWith(
          SpentModel value, $Res Function(SpentModel) then) =
      _$SpentModelCopyWithImpl<$Res, SpentModel>;
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class _$SpentModelCopyWithImpl<$Res, $Val extends SpentModel>
    implements $SpentModelCopyWith<$Res> {
  _$SpentModelCopyWithImpl(this._value, this._then);

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
abstract class _$$_SpentModelCopyWith<$Res>
    implements $SpentModelCopyWith<$Res> {
  factory _$$_SpentModelCopyWith(
          _$_SpentModel value, $Res Function(_$_SpentModel) then) =
      __$$_SpentModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class __$$_SpentModelCopyWithImpl<$Res>
    extends _$SpentModelCopyWithImpl<$Res, _$_SpentModel>
    implements _$$_SpentModelCopyWith<$Res> {
  __$$_SpentModelCopyWithImpl(
      _$_SpentModel _value, $Res Function(_$_SpentModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$_SpentModel(
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
class _$_SpentModel implements _SpentModel {
  _$_SpentModel({required this.id, required this.name});

  factory _$_SpentModel.fromJson(Map<String, dynamic> json) =>
      _$$_SpentModelFromJson(json);

  @override
  final int id;
  @override
  final String name;

  @override
  String toString() {
    return 'SpentModel(id: $id, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SpentModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SpentModelCopyWith<_$_SpentModel> get copyWith =>
      __$$_SpentModelCopyWithImpl<_$_SpentModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SpentModelToJson(
      this,
    );
  }
}

abstract class _SpentModel implements SpentModel {
  factory _SpentModel({required final int id, required final String name}) =
      _$_SpentModel;

  factory _SpentModel.fromJson(Map<String, dynamic> json) =
      _$_SpentModel.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_SpentModelCopyWith<_$_SpentModel> get copyWith =>
      throw _privateConstructorUsedError;
}
