// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'saled_product_items_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SaledItemsModel _$SaledItemsModelFromJson(Map<String, dynamic> json) {
  return _SaledItemsModel.fromJson(json);
}

/// @nodoc
mixin _$SaledItemsModel {
  int? get quantity => throw _privateConstructorUsedError;
  int? get amount => throw _privateConstructorUsedError;
  int? get saleprice => throw _privateConstructorUsedError;
  String? get kod_tov => throw _privateConstructorUsedError;
  String? get barcode => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get edizm => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SaledItemsModelCopyWith<SaledItemsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SaledItemsModelCopyWith<$Res> {
  factory $SaledItemsModelCopyWith(
          SaledItemsModel value, $Res Function(SaledItemsModel) then) =
      _$SaledItemsModelCopyWithImpl<$Res, SaledItemsModel>;
  @useResult
  $Res call(
      {int? quantity,
      int? amount,
      int? saleprice,
      String? kod_tov,
      String? barcode,
      String? name,
      String? edizm});
}

/// @nodoc
class _$SaledItemsModelCopyWithImpl<$Res, $Val extends SaledItemsModel>
    implements $SaledItemsModelCopyWith<$Res> {
  _$SaledItemsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quantity = freezed,
    Object? amount = freezed,
    Object? saleprice = freezed,
    Object? kod_tov = freezed,
    Object? barcode = freezed,
    Object? name = freezed,
    Object? edizm = freezed,
  }) {
    return _then(_value.copyWith(
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
      saleprice: freezed == saleprice
          ? _value.saleprice
          : saleprice // ignore: cast_nullable_to_non_nullable
              as int?,
      kod_tov: freezed == kod_tov
          ? _value.kod_tov
          : kod_tov // ignore: cast_nullable_to_non_nullable
              as String?,
      barcode: freezed == barcode
          ? _value.barcode
          : barcode // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      edizm: freezed == edizm
          ? _value.edizm
          : edizm // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SaledItemsModelCopyWith<$Res>
    implements $SaledItemsModelCopyWith<$Res> {
  factory _$$_SaledItemsModelCopyWith(
          _$_SaledItemsModel value, $Res Function(_$_SaledItemsModel) then) =
      __$$_SaledItemsModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? quantity,
      int? amount,
      int? saleprice,
      String? kod_tov,
      String? barcode,
      String? name,
      String? edizm});
}

/// @nodoc
class __$$_SaledItemsModelCopyWithImpl<$Res>
    extends _$SaledItemsModelCopyWithImpl<$Res, _$_SaledItemsModel>
    implements _$$_SaledItemsModelCopyWith<$Res> {
  __$$_SaledItemsModelCopyWithImpl(
      _$_SaledItemsModel _value, $Res Function(_$_SaledItemsModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quantity = freezed,
    Object? amount = freezed,
    Object? saleprice = freezed,
    Object? kod_tov = freezed,
    Object? barcode = freezed,
    Object? name = freezed,
    Object? edizm = freezed,
  }) {
    return _then(_$_SaledItemsModel(
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
      saleprice: freezed == saleprice
          ? _value.saleprice
          : saleprice // ignore: cast_nullable_to_non_nullable
              as int?,
      kod_tov: freezed == kod_tov
          ? _value.kod_tov
          : kod_tov // ignore: cast_nullable_to_non_nullable
              as String?,
      barcode: freezed == barcode
          ? _value.barcode
          : barcode // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      edizm: freezed == edizm
          ? _value.edizm
          : edizm // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SaledItemsModel implements _SaledItemsModel {
  _$_SaledItemsModel(
      {this.quantity,
      this.amount,
      this.saleprice,
      this.kod_tov,
      this.barcode,
      this.name,
      this.edizm});

  factory _$_SaledItemsModel.fromJson(Map<String, dynamic> json) =>
      _$$_SaledItemsModelFromJson(json);

  @override
  final int? quantity;
  @override
  final int? amount;
  @override
  final int? saleprice;
  @override
  final String? kod_tov;
  @override
  final String? barcode;
  @override
  final String? name;
  @override
  final String? edizm;

  @override
  String toString() {
    return 'SaledItemsModel(quantity: $quantity, amount: $amount, saleprice: $saleprice, kod_tov: $kod_tov, barcode: $barcode, name: $name, edizm: $edizm)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SaledItemsModel &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.saleprice, saleprice) ||
                other.saleprice == saleprice) &&
            (identical(other.kod_tov, kod_tov) || other.kod_tov == kod_tov) &&
            (identical(other.barcode, barcode) || other.barcode == barcode) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.edizm, edizm) || other.edizm == edizm));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, quantity, amount, saleprice, kod_tov, barcode, name, edizm);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SaledItemsModelCopyWith<_$_SaledItemsModel> get copyWith =>
      __$$_SaledItemsModelCopyWithImpl<_$_SaledItemsModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SaledItemsModelToJson(
      this,
    );
  }
}

abstract class _SaledItemsModel implements SaledItemsModel {
  factory _SaledItemsModel(
      {final int? quantity,
      final int? amount,
      final int? saleprice,
      final String? kod_tov,
      final String? barcode,
      final String? name,
      final String? edizm}) = _$_SaledItemsModel;

  factory _SaledItemsModel.fromJson(Map<String, dynamic> json) =
      _$_SaledItemsModel.fromJson;

  @override
  int? get quantity;
  @override
  int? get amount;
  @override
  int? get saleprice;
  @override
  String? get kod_tov;
  @override
  String? get barcode;
  @override
  String? get name;
  @override
  String? get edizm;
  @override
  @JsonKey(ignore: true)
  _$$_SaledItemsModelCopyWith<_$_SaledItemsModel> get copyWith =>
      throw _privateConstructorUsedError;
}
