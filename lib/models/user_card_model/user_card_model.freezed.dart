// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_card_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CardModel _$CardModelFromJson(Map<String, dynamic> json) {
  return _CardModel.fromJson(json);
}

/// @nodoc
mixin _$CardModel {
  String get cod => throw _privateConstructorUsedError;
  String? get shtrix => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CardModelCopyWith<CardModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardModelCopyWith<$Res> {
  factory $CardModelCopyWith(CardModel value, $Res Function(CardModel) then) =
      _$CardModelCopyWithImpl<$Res, CardModel>;
  @useResult
  $Res call({String cod, String? shtrix});
}

/// @nodoc
class _$CardModelCopyWithImpl<$Res, $Val extends CardModel>
    implements $CardModelCopyWith<$Res> {
  _$CardModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = null,
    Object? shtrix = freezed,
  }) {
    return _then(_value.copyWith(
      cod: null == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as String,
      shtrix: freezed == shtrix
          ? _value.shtrix
          : shtrix // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CardModelCopyWith<$Res> implements $CardModelCopyWith<$Res> {
  factory _$$_CardModelCopyWith(
          _$_CardModel value, $Res Function(_$_CardModel) then) =
      __$$_CardModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String cod, String? shtrix});
}

/// @nodoc
class __$$_CardModelCopyWithImpl<$Res>
    extends _$CardModelCopyWithImpl<$Res, _$_CardModel>
    implements _$$_CardModelCopyWith<$Res> {
  __$$_CardModelCopyWithImpl(
      _$_CardModel _value, $Res Function(_$_CardModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = null,
    Object? shtrix = freezed,
  }) {
    return _then(_$_CardModel(
      cod: null == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as String,
      shtrix: freezed == shtrix
          ? _value.shtrix
          : shtrix // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CardModel implements _CardModel {
  _$_CardModel({required this.cod, this.shtrix});

  factory _$_CardModel.fromJson(Map<String, dynamic> json) =>
      _$$_CardModelFromJson(json);

  @override
  final String cod;
  @override
  final String? shtrix;

  @override
  String toString() {
    return 'CardModel(cod: $cod, shtrix: $shtrix)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CardModel &&
            (identical(other.cod, cod) || other.cod == cod) &&
            (identical(other.shtrix, shtrix) || other.shtrix == shtrix));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, cod, shtrix);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CardModelCopyWith<_$_CardModel> get copyWith =>
      __$$_CardModelCopyWithImpl<_$_CardModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CardModelToJson(
      this,
    );
  }
}

abstract class _CardModel implements CardModel {
  factory _CardModel({required final String cod, final String? shtrix}) =
      _$_CardModel;

  factory _CardModel.fromJson(Map<String, dynamic> json) =
      _$_CardModel.fromJson;

  @override
  String get cod;
  @override
  String? get shtrix;
  @override
  @JsonKey(ignore: true)
  _$$_CardModelCopyWith<_$_CardModel> get copyWith =>
      throw _privateConstructorUsedError;
}
