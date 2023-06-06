// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'remainder_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RemainderItemListModel _$RemainderItemListModelFromJson(
    Map<String, dynamic> json) {
  return _RemainderItemListModel.fromJson(json);
}

/// @nodoc
mixin _$RemainderItemListModel {
  List<RemainderItemsModel> get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RemainderItemListModelCopyWith<RemainderItemListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RemainderItemListModelCopyWith<$Res> {
  factory $RemainderItemListModelCopyWith(RemainderItemListModel value,
          $Res Function(RemainderItemListModel) then) =
      _$RemainderItemListModelCopyWithImpl<$Res, RemainderItemListModel>;
  @useResult
  $Res call({List<RemainderItemsModel> items});
}

/// @nodoc
class _$RemainderItemListModelCopyWithImpl<$Res,
        $Val extends RemainderItemListModel>
    implements $RemainderItemListModelCopyWith<$Res> {
  _$RemainderItemListModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<RemainderItemsModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RemainderItemListModelCopyWith<$Res>
    implements $RemainderItemListModelCopyWith<$Res> {
  factory _$$_RemainderItemListModelCopyWith(_$_RemainderItemListModel value,
          $Res Function(_$_RemainderItemListModel) then) =
      __$$_RemainderItemListModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<RemainderItemsModel> items});
}

/// @nodoc
class __$$_RemainderItemListModelCopyWithImpl<$Res>
    extends _$RemainderItemListModelCopyWithImpl<$Res,
        _$_RemainderItemListModel>
    implements _$$_RemainderItemListModelCopyWith<$Res> {
  __$$_RemainderItemListModelCopyWithImpl(_$_RemainderItemListModel _value,
      $Res Function(_$_RemainderItemListModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
  }) {
    return _then(_$_RemainderItemListModel(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<RemainderItemsModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RemainderItemListModel implements _RemainderItemListModel {
  _$_RemainderItemListModel({required final List<RemainderItemsModel> items})
      : _items = items;

  factory _$_RemainderItemListModel.fromJson(Map<String, dynamic> json) =>
      _$$_RemainderItemListModelFromJson(json);

  final List<RemainderItemsModel> _items;
  @override
  List<RemainderItemsModel> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'RemainderItemListModel(items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RemainderItemListModel &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RemainderItemListModelCopyWith<_$_RemainderItemListModel> get copyWith =>
      __$$_RemainderItemListModelCopyWithImpl<_$_RemainderItemListModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RemainderItemListModelToJson(
      this,
    );
  }
}

abstract class _RemainderItemListModel implements RemainderItemListModel {
  factory _RemainderItemListModel(
          {required final List<RemainderItemsModel> items}) =
      _$_RemainderItemListModel;

  factory _RemainderItemListModel.fromJson(Map<String, dynamic> json) =
      _$_RemainderItemListModel.fromJson;

  @override
  List<RemainderItemsModel> get items;
  @override
  @JsonKey(ignore: true)
  _$$_RemainderItemListModelCopyWith<_$_RemainderItemListModel> get copyWith =>
      throw _privateConstructorUsedError;
}
