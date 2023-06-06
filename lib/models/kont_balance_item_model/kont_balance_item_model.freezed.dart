// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kont_balance_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

KontBalanceItemModel _$KontBalanceItemModelFromJson(Map<String, dynamic> json) {
  return _KontBalanceItemModel.fromJson(json);
}

/// @nodoc
mixin _$KontBalanceItemModel {
  String? get tip => throw _privateConstructorUsedError;
  int? get amount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KontBalanceItemModelCopyWith<KontBalanceItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KontBalanceItemModelCopyWith<$Res> {
  factory $KontBalanceItemModelCopyWith(KontBalanceItemModel value,
          $Res Function(KontBalanceItemModel) then) =
      _$KontBalanceItemModelCopyWithImpl<$Res, KontBalanceItemModel>;
  @useResult
  $Res call({String? tip, int? amount});
}

/// @nodoc
class _$KontBalanceItemModelCopyWithImpl<$Res,
        $Val extends KontBalanceItemModel>
    implements $KontBalanceItemModelCopyWith<$Res> {
  _$KontBalanceItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tip = freezed,
    Object? amount = freezed,
  }) {
    return _then(_value.copyWith(
      tip: freezed == tip
          ? _value.tip
          : tip // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_KontBalanceItemModelCopyWith<$Res>
    implements $KontBalanceItemModelCopyWith<$Res> {
  factory _$$_KontBalanceItemModelCopyWith(_$_KontBalanceItemModel value,
          $Res Function(_$_KontBalanceItemModel) then) =
      __$$_KontBalanceItemModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? tip, int? amount});
}

/// @nodoc
class __$$_KontBalanceItemModelCopyWithImpl<$Res>
    extends _$KontBalanceItemModelCopyWithImpl<$Res, _$_KontBalanceItemModel>
    implements _$$_KontBalanceItemModelCopyWith<$Res> {
  __$$_KontBalanceItemModelCopyWithImpl(_$_KontBalanceItemModel _value,
      $Res Function(_$_KontBalanceItemModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tip = freezed,
    Object? amount = freezed,
  }) {
    return _then(_$_KontBalanceItemModel(
      tip: freezed == tip
          ? _value.tip
          : tip // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_KontBalanceItemModel implements _KontBalanceItemModel {
  _$_KontBalanceItemModel({this.tip, this.amount});

  factory _$_KontBalanceItemModel.fromJson(Map<String, dynamic> json) =>
      _$$_KontBalanceItemModelFromJson(json);

  @override
  final String? tip;
  @override
  final int? amount;

  @override
  String toString() {
    return 'KontBalanceItemModel(tip: $tip, amount: $amount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_KontBalanceItemModel &&
            (identical(other.tip, tip) || other.tip == tip) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, tip, amount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_KontBalanceItemModelCopyWith<_$_KontBalanceItemModel> get copyWith =>
      __$$_KontBalanceItemModelCopyWithImpl<_$_KontBalanceItemModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_KontBalanceItemModelToJson(
      this,
    );
  }
}

abstract class _KontBalanceItemModel implements KontBalanceItemModel {
  factory _KontBalanceItemModel({final String? tip, final int? amount}) =
      _$_KontBalanceItemModel;

  factory _KontBalanceItemModel.fromJson(Map<String, dynamic> json) =
      _$_KontBalanceItemModel.fromJson;

  @override
  String? get tip;
  @override
  int? get amount;
  @override
  @JsonKey(ignore: true)
  _$$_KontBalanceItemModelCopyWith<_$_KontBalanceItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}
