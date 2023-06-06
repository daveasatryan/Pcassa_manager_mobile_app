// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_discount_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GetDiscountsModel _$GetDiscountsModelFromJson(Map<String, dynamic> json) {
  return _GetDiscountsModel.fromJson(json);
}

/// @nodoc
mixin _$GetDiscountsModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get linkfoto => throw _privateConstructorUsedError;
  List<DiscountItemsModel> get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetDiscountsModelCopyWith<GetDiscountsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetDiscountsModelCopyWith<$Res> {
  factory $GetDiscountsModelCopyWith(
          GetDiscountsModel value, $Res Function(GetDiscountsModel) then) =
      _$GetDiscountsModelCopyWithImpl<$Res, GetDiscountsModel>;
  @useResult
  $Res call(
      {int id, String name, String? linkfoto, List<DiscountItemsModel> items});
}

/// @nodoc
class _$GetDiscountsModelCopyWithImpl<$Res, $Val extends GetDiscountsModel>
    implements $GetDiscountsModelCopyWith<$Res> {
  _$GetDiscountsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? linkfoto = freezed,
    Object? items = null,
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
      linkfoto: freezed == linkfoto
          ? _value.linkfoto
          : linkfoto // ignore: cast_nullable_to_non_nullable
              as String?,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<DiscountItemsModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GetDiscountsModelCopyWith<$Res>
    implements $GetDiscountsModelCopyWith<$Res> {
  factory _$$_GetDiscountsModelCopyWith(_$_GetDiscountsModel value,
          $Res Function(_$_GetDiscountsModel) then) =
      __$$_GetDiscountsModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id, String name, String? linkfoto, List<DiscountItemsModel> items});
}

/// @nodoc
class __$$_GetDiscountsModelCopyWithImpl<$Res>
    extends _$GetDiscountsModelCopyWithImpl<$Res, _$_GetDiscountsModel>
    implements _$$_GetDiscountsModelCopyWith<$Res> {
  __$$_GetDiscountsModelCopyWithImpl(
      _$_GetDiscountsModel _value, $Res Function(_$_GetDiscountsModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? linkfoto = freezed,
    Object? items = null,
  }) {
    return _then(_$_GetDiscountsModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      linkfoto: freezed == linkfoto
          ? _value.linkfoto
          : linkfoto // ignore: cast_nullable_to_non_nullable
              as String?,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<DiscountItemsModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GetDiscountsModel implements _GetDiscountsModel {
  _$_GetDiscountsModel(
      {required this.id,
      required this.name,
      this.linkfoto,
      required this.items});

  factory _$_GetDiscountsModel.fromJson(Map<String, dynamic> json) =>
      _$$_GetDiscountsModelFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String? linkfoto;
  @override
  final List<DiscountItemsModel> items;

  @override
  String toString() {
    return 'GetDiscountsModel(id: $id, name: $name, linkfoto: $linkfoto, items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetDiscountsModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.linkfoto, linkfoto) ||
                other.linkfoto == linkfoto) &&
            const DeepCollectionEquality().equals(other.items, items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, linkfoto,
      const DeepCollectionEquality().hash(items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetDiscountsModelCopyWith<_$_GetDiscountsModel> get copyWith =>
      __$$_GetDiscountsModelCopyWithImpl<_$_GetDiscountsModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GetDiscountsModelToJson(
      this,
    );
  }
}

abstract class _GetDiscountsModel implements GetDiscountsModel {
  factory _GetDiscountsModel(
      {required final int id,
      required final String name,
      final String? linkfoto,
      required final List<DiscountItemsModel> items}) = _$_GetDiscountsModel;

  factory _GetDiscountsModel.fromJson(Map<String, dynamic> json) =
      _$_GetDiscountsModel.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String? get linkfoto;
  @override
  List<DiscountItemsModel> get items;
  @override
  @JsonKey(ignore: true)
  _$$_GetDiscountsModelCopyWith<_$_GetDiscountsModel> get copyWith =>
      throw _privateConstructorUsedError;
}
