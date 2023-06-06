// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'saled_product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SaledProductModel _$SaledProductModelFromJson(Map<String, dynamic> json) {
  return _SaledProductModel.fromJson(json);
}

/// @nodoc
mixin _$SaledProductModel {
  int? get summa => throw _privateConstructorUsedError;
  List<SaledItemsModel>? get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SaledProductModelCopyWith<SaledProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SaledProductModelCopyWith<$Res> {
  factory $SaledProductModelCopyWith(
          SaledProductModel value, $Res Function(SaledProductModel) then) =
      _$SaledProductModelCopyWithImpl<$Res, SaledProductModel>;
  @useResult
  $Res call({int? summa, List<SaledItemsModel>? items});
}

/// @nodoc
class _$SaledProductModelCopyWithImpl<$Res, $Val extends SaledProductModel>
    implements $SaledProductModelCopyWith<$Res> {
  _$SaledProductModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? summa = freezed,
    Object? items = freezed,
  }) {
    return _then(_value.copyWith(
      summa: freezed == summa
          ? _value.summa
          : summa // ignore: cast_nullable_to_non_nullable
              as int?,
      items: freezed == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<SaledItemsModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SaledProductModelCopyWith<$Res>
    implements $SaledProductModelCopyWith<$Res> {
  factory _$$_SaledProductModelCopyWith(_$_SaledProductModel value,
          $Res Function(_$_SaledProductModel) then) =
      __$$_SaledProductModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? summa, List<SaledItemsModel>? items});
}

/// @nodoc
class __$$_SaledProductModelCopyWithImpl<$Res>
    extends _$SaledProductModelCopyWithImpl<$Res, _$_SaledProductModel>
    implements _$$_SaledProductModelCopyWith<$Res> {
  __$$_SaledProductModelCopyWithImpl(
      _$_SaledProductModel _value, $Res Function(_$_SaledProductModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? summa = freezed,
    Object? items = freezed,
  }) {
    return _then(_$_SaledProductModel(
      summa: freezed == summa
          ? _value.summa
          : summa // ignore: cast_nullable_to_non_nullable
              as int?,
      items: freezed == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<SaledItemsModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SaledProductModel implements _SaledProductModel {
  _$_SaledProductModel({this.summa, final List<SaledItemsModel>? items})
      : _items = items;

  factory _$_SaledProductModel.fromJson(Map<String, dynamic> json) =>
      _$$_SaledProductModelFromJson(json);

  @override
  final int? summa;
  final List<SaledItemsModel>? _items;
  @override
  List<SaledItemsModel>? get items {
    final value = _items;
    if (value == null) return null;
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'SaledProductModel(summa: $summa, items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SaledProductModel &&
            (identical(other.summa, summa) || other.summa == summa) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, summa, const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SaledProductModelCopyWith<_$_SaledProductModel> get copyWith =>
      __$$_SaledProductModelCopyWithImpl<_$_SaledProductModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SaledProductModelToJson(
      this,
    );
  }
}

abstract class _SaledProductModel implements SaledProductModel {
  factory _SaledProductModel(
      {final int? summa,
      final List<SaledItemsModel>? items}) = _$_SaledProductModel;

  factory _SaledProductModel.fromJson(Map<String, dynamic> json) =
      _$_SaledProductModel.fromJson;

  @override
  int? get summa;
  @override
  List<SaledItemsModel>? get items;
  @override
  @JsonKey(ignore: true)
  _$$_SaledProductModelCopyWith<_$_SaledProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}
