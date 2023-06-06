// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_discount_items_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DiscountItemsModel _$DiscountItemsModelFromJson(Map<String, dynamic> json) {
  return _DiscountItemsModel.fromJson(json);
}

/// @nodoc
mixin _$DiscountItemsModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get tip => throw _privateConstructorUsedError;
  int get val => throw _privateConstructorUsedError;
  int get status => throw _privateConstructorUsedError;
  String get rejim => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DiscountItemsModelCopyWith<DiscountItemsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiscountItemsModelCopyWith<$Res> {
  factory $DiscountItemsModelCopyWith(
          DiscountItemsModel value, $Res Function(DiscountItemsModel) then) =
      _$DiscountItemsModelCopyWithImpl<$Res, DiscountItemsModel>;
  @useResult
  $Res call(
      {int id, String name, String tip, int val, int status, String rejim});
}

/// @nodoc
class _$DiscountItemsModelCopyWithImpl<$Res, $Val extends DiscountItemsModel>
    implements $DiscountItemsModelCopyWith<$Res> {
  _$DiscountItemsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? tip = null,
    Object? val = null,
    Object? status = null,
    Object? rejim = null,
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
      tip: null == tip
          ? _value.tip
          : tip // ignore: cast_nullable_to_non_nullable
              as String,
      val: null == val
          ? _value.val
          : val // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      rejim: null == rejim
          ? _value.rejim
          : rejim // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DiscountItemsModelCopyWith<$Res>
    implements $DiscountItemsModelCopyWith<$Res> {
  factory _$$_DiscountItemsModelCopyWith(_$_DiscountItemsModel value,
          $Res Function(_$_DiscountItemsModel) then) =
      __$$_DiscountItemsModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id, String name, String tip, int val, int status, String rejim});
}

/// @nodoc
class __$$_DiscountItemsModelCopyWithImpl<$Res>
    extends _$DiscountItemsModelCopyWithImpl<$Res, _$_DiscountItemsModel>
    implements _$$_DiscountItemsModelCopyWith<$Res> {
  __$$_DiscountItemsModelCopyWithImpl(
      _$_DiscountItemsModel _value, $Res Function(_$_DiscountItemsModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? tip = null,
    Object? val = null,
    Object? status = null,
    Object? rejim = null,
  }) {
    return _then(_$_DiscountItemsModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      tip: null == tip
          ? _value.tip
          : tip // ignore: cast_nullable_to_non_nullable
              as String,
      val: null == val
          ? _value.val
          : val // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      rejim: null == rejim
          ? _value.rejim
          : rejim // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DiscountItemsModel implements _DiscountItemsModel {
  _$_DiscountItemsModel(
      {required this.id,
      required this.name,
      required this.tip,
      required this.val,
      required this.status,
      required this.rejim});

  factory _$_DiscountItemsModel.fromJson(Map<String, dynamic> json) =>
      _$$_DiscountItemsModelFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String tip;
  @override
  final int val;
  @override
  final int status;
  @override
  final String rejim;

  @override
  String toString() {
    return 'DiscountItemsModel(id: $id, name: $name, tip: $tip, val: $val, status: $status, rejim: $rejim)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DiscountItemsModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.tip, tip) || other.tip == tip) &&
            (identical(other.val, val) || other.val == val) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.rejim, rejim) || other.rejim == rejim));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, tip, val, status, rejim);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DiscountItemsModelCopyWith<_$_DiscountItemsModel> get copyWith =>
      __$$_DiscountItemsModelCopyWithImpl<_$_DiscountItemsModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DiscountItemsModelToJson(
      this,
    );
  }
}

abstract class _DiscountItemsModel implements DiscountItemsModel {
  factory _DiscountItemsModel(
      {required final int id,
      required final String name,
      required final String tip,
      required final int val,
      required final int status,
      required final String rejim}) = _$_DiscountItemsModel;

  factory _DiscountItemsModel.fromJson(Map<String, dynamic> json) =
      _$_DiscountItemsModel.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get tip;
  @override
  int get val;
  @override
  int get status;
  @override
  String get rejim;
  @override
  @JsonKey(ignore: true)
  _$$_DiscountItemsModelCopyWith<_$_DiscountItemsModel> get copyWith =>
      throw _privateConstructorUsedError;
}
