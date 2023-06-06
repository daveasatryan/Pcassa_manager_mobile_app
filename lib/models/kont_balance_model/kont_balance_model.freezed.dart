// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kont_balance_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

KontBalanceModel _$KontBalanceModelFromJson(Map<String, dynamic> json) {
  return _KontBalanceModel.fromJson(json);
}

/// @nodoc
mixin _$KontBalanceModel {
  int? get sumitems => throw _privateConstructorUsedError;
  int? get nachost => throw _privateConstructorUsedError;
  List<KontBalanceItemModel> get items => throw _privateConstructorUsedError;
  int? get endost => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KontBalanceModelCopyWith<KontBalanceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KontBalanceModelCopyWith<$Res> {
  factory $KontBalanceModelCopyWith(
          KontBalanceModel value, $Res Function(KontBalanceModel) then) =
      _$KontBalanceModelCopyWithImpl<$Res, KontBalanceModel>;
  @useResult
  $Res call(
      {int? sumitems,
      int? nachost,
      List<KontBalanceItemModel> items,
      int? endost});
}

/// @nodoc
class _$KontBalanceModelCopyWithImpl<$Res, $Val extends KontBalanceModel>
    implements $KontBalanceModelCopyWith<$Res> {
  _$KontBalanceModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sumitems = freezed,
    Object? nachost = freezed,
    Object? items = null,
    Object? endost = freezed,
  }) {
    return _then(_value.copyWith(
      sumitems: freezed == sumitems
          ? _value.sumitems
          : sumitems // ignore: cast_nullable_to_non_nullable
              as int?,
      nachost: freezed == nachost
          ? _value.nachost
          : nachost // ignore: cast_nullable_to_non_nullable
              as int?,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<KontBalanceItemModel>,
      endost: freezed == endost
          ? _value.endost
          : endost // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_KontBalanceModelCopyWith<$Res>
    implements $KontBalanceModelCopyWith<$Res> {
  factory _$$_KontBalanceModelCopyWith(
          _$_KontBalanceModel value, $Res Function(_$_KontBalanceModel) then) =
      __$$_KontBalanceModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? sumitems,
      int? nachost,
      List<KontBalanceItemModel> items,
      int? endost});
}

/// @nodoc
class __$$_KontBalanceModelCopyWithImpl<$Res>
    extends _$KontBalanceModelCopyWithImpl<$Res, _$_KontBalanceModel>
    implements _$$_KontBalanceModelCopyWith<$Res> {
  __$$_KontBalanceModelCopyWithImpl(
      _$_KontBalanceModel _value, $Res Function(_$_KontBalanceModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sumitems = freezed,
    Object? nachost = freezed,
    Object? items = null,
    Object? endost = freezed,
  }) {
    return _then(_$_KontBalanceModel(
      sumitems: freezed == sumitems
          ? _value.sumitems
          : sumitems // ignore: cast_nullable_to_non_nullable
              as int?,
      nachost: freezed == nachost
          ? _value.nachost
          : nachost // ignore: cast_nullable_to_non_nullable
              as int?,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<KontBalanceItemModel>,
      endost: freezed == endost
          ? _value.endost
          : endost // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_KontBalanceModel implements _KontBalanceModel {
  _$_KontBalanceModel(
      {this.sumitems,
      this.nachost,
      final List<KontBalanceItemModel> items = const [],
      this.endost})
      : _items = items;

  factory _$_KontBalanceModel.fromJson(Map<String, dynamic> json) =>
      _$$_KontBalanceModelFromJson(json);

  @override
  final int? sumitems;
  @override
  final int? nachost;
  final List<KontBalanceItemModel> _items;
  @override
  @JsonKey()
  List<KontBalanceItemModel> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final int? endost;

  @override
  String toString() {
    return 'KontBalanceModel(sumitems: $sumitems, nachost: $nachost, items: $items, endost: $endost)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_KontBalanceModel &&
            (identical(other.sumitems, sumitems) ||
                other.sumitems == sumitems) &&
            (identical(other.nachost, nachost) || other.nachost == nachost) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.endost, endost) || other.endost == endost));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, sumitems, nachost,
      const DeepCollectionEquality().hash(_items), endost);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_KontBalanceModelCopyWith<_$_KontBalanceModel> get copyWith =>
      __$$_KontBalanceModelCopyWithImpl<_$_KontBalanceModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_KontBalanceModelToJson(
      this,
    );
  }
}

abstract class _KontBalanceModel implements KontBalanceModel {
  factory _KontBalanceModel(
      {final int? sumitems,
      final int? nachost,
      final List<KontBalanceItemModel> items,
      final int? endost}) = _$_KontBalanceModel;

  factory _KontBalanceModel.fromJson(Map<String, dynamic> json) =
      _$_KontBalanceModel.fromJson;

  @override
  int? get sumitems;
  @override
  int? get nachost;
  @override
  List<KontBalanceItemModel> get items;
  @override
  int? get endost;
  @override
  @JsonKey(ignore: true)
  _$$_KontBalanceModelCopyWith<_$_KontBalanceModel> get copyWith =>
      throw _privateConstructorUsedError;
}
