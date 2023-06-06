// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'viruchka_items_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ViruchkaItemModel _$ViruchkaItemModelFromJson(Map<String, dynamic> json) {
  return _ViruchkaItemModel.fromJson(json);
}

/// @nodoc
mixin _$ViruchkaItemModel {
  int? get id => throw _privateConstructorUsedError;
  int? get quantity => throw _privateConstructorUsedError;
  int? get saleprice => throw _privateConstructorUsedError;
  int? get realprice => throw _privateConstructorUsedError;
  String? get productcode => throw _privateConstructorUsedError;
  String? get productname => throw _privateConstructorUsedError;
  int? get flag => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ViruchkaItemModelCopyWith<ViruchkaItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViruchkaItemModelCopyWith<$Res> {
  factory $ViruchkaItemModelCopyWith(
          ViruchkaItemModel value, $Res Function(ViruchkaItemModel) then) =
      _$ViruchkaItemModelCopyWithImpl<$Res, ViruchkaItemModel>;
  @useResult
  $Res call(
      {int? id,
      int? quantity,
      int? saleprice,
      int? realprice,
      String? productcode,
      String? productname,
      int? flag});
}

/// @nodoc
class _$ViruchkaItemModelCopyWithImpl<$Res, $Val extends ViruchkaItemModel>
    implements $ViruchkaItemModelCopyWith<$Res> {
  _$ViruchkaItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? quantity = freezed,
    Object? saleprice = freezed,
    Object? realprice = freezed,
    Object? productcode = freezed,
    Object? productname = freezed,
    Object? flag = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      saleprice: freezed == saleprice
          ? _value.saleprice
          : saleprice // ignore: cast_nullable_to_non_nullable
              as int?,
      realprice: freezed == realprice
          ? _value.realprice
          : realprice // ignore: cast_nullable_to_non_nullable
              as int?,
      productcode: freezed == productcode
          ? _value.productcode
          : productcode // ignore: cast_nullable_to_non_nullable
              as String?,
      productname: freezed == productname
          ? _value.productname
          : productname // ignore: cast_nullable_to_non_nullable
              as String?,
      flag: freezed == flag
          ? _value.flag
          : flag // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ViruchkaItemModelCopyWith<$Res>
    implements $ViruchkaItemModelCopyWith<$Res> {
  factory _$$_ViruchkaItemModelCopyWith(_$_ViruchkaItemModel value,
          $Res Function(_$_ViruchkaItemModel) then) =
      __$$_ViruchkaItemModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int? quantity,
      int? saleprice,
      int? realprice,
      String? productcode,
      String? productname,
      int? flag});
}

/// @nodoc
class __$$_ViruchkaItemModelCopyWithImpl<$Res>
    extends _$ViruchkaItemModelCopyWithImpl<$Res, _$_ViruchkaItemModel>
    implements _$$_ViruchkaItemModelCopyWith<$Res> {
  __$$_ViruchkaItemModelCopyWithImpl(
      _$_ViruchkaItemModel _value, $Res Function(_$_ViruchkaItemModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? quantity = freezed,
    Object? saleprice = freezed,
    Object? realprice = freezed,
    Object? productcode = freezed,
    Object? productname = freezed,
    Object? flag = freezed,
  }) {
    return _then(_$_ViruchkaItemModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      saleprice: freezed == saleprice
          ? _value.saleprice
          : saleprice // ignore: cast_nullable_to_non_nullable
              as int?,
      realprice: freezed == realprice
          ? _value.realprice
          : realprice // ignore: cast_nullable_to_non_nullable
              as int?,
      productcode: freezed == productcode
          ? _value.productcode
          : productcode // ignore: cast_nullable_to_non_nullable
              as String?,
      productname: freezed == productname
          ? _value.productname
          : productname // ignore: cast_nullable_to_non_nullable
              as String?,
      flag: freezed == flag
          ? _value.flag
          : flag // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ViruchkaItemModel implements _ViruchkaItemModel {
  _$_ViruchkaItemModel(
      {this.id,
      this.quantity,
      this.saleprice,
      this.realprice,
      this.productcode,
      this.productname,
      this.flag});

  factory _$_ViruchkaItemModel.fromJson(Map<String, dynamic> json) =>
      _$$_ViruchkaItemModelFromJson(json);

  @override
  final int? id;
  @override
  final int? quantity;
  @override
  final int? saleprice;
  @override
  final int? realprice;
  @override
  final String? productcode;
  @override
  final String? productname;
  @override
  final int? flag;

  @override
  String toString() {
    return 'ViruchkaItemModel(id: $id, quantity: $quantity, saleprice: $saleprice, realprice: $realprice, productcode: $productcode, productname: $productname, flag: $flag)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ViruchkaItemModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.saleprice, saleprice) ||
                other.saleprice == saleprice) &&
            (identical(other.realprice, realprice) ||
                other.realprice == realprice) &&
            (identical(other.productcode, productcode) ||
                other.productcode == productcode) &&
            (identical(other.productname, productname) ||
                other.productname == productname) &&
            (identical(other.flag, flag) || other.flag == flag));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, quantity, saleprice,
      realprice, productcode, productname, flag);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ViruchkaItemModelCopyWith<_$_ViruchkaItemModel> get copyWith =>
      __$$_ViruchkaItemModelCopyWithImpl<_$_ViruchkaItemModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ViruchkaItemModelToJson(
      this,
    );
  }
}

abstract class _ViruchkaItemModel implements ViruchkaItemModel {
  factory _ViruchkaItemModel(
      {final int? id,
      final int? quantity,
      final int? saleprice,
      final int? realprice,
      final String? productcode,
      final String? productname,
      final int? flag}) = _$_ViruchkaItemModel;

  factory _ViruchkaItemModel.fromJson(Map<String, dynamic> json) =
      _$_ViruchkaItemModel.fromJson;

  @override
  int? get id;
  @override
  int? get quantity;
  @override
  int? get saleprice;
  @override
  int? get realprice;
  @override
  String? get productcode;
  @override
  String? get productname;
  @override
  int? get flag;
  @override
  @JsonKey(ignore: true)
  _$$_ViruchkaItemModelCopyWith<_$_ViruchkaItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}
