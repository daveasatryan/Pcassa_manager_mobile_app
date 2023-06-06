// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_category_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductCategoryModel _$ProductCategoryModelFromJson(Map<String, dynamic> json) {
  return _ProductCategoryModel.fromJson(json);
}

/// @nodoc
mixin _$ProductCategoryModel {
  String get guid => throw _privateConstructorUsedError;
  int get isroot => throw _privateConstructorUsedError;
  int get haschildren => throw _privateConstructorUsedError;
  String get parentguid => throw _privateConstructorUsedError;
  String get caption => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductCategoryModelCopyWith<ProductCategoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductCategoryModelCopyWith<$Res> {
  factory $ProductCategoryModelCopyWith(ProductCategoryModel value,
          $Res Function(ProductCategoryModel) then) =
      _$ProductCategoryModelCopyWithImpl<$Res, ProductCategoryModel>;
  @useResult
  $Res call(
      {String guid,
      int isroot,
      int haschildren,
      String parentguid,
      String caption});
}

/// @nodoc
class _$ProductCategoryModelCopyWithImpl<$Res,
        $Val extends ProductCategoryModel>
    implements $ProductCategoryModelCopyWith<$Res> {
  _$ProductCategoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? guid = null,
    Object? isroot = null,
    Object? haschildren = null,
    Object? parentguid = null,
    Object? caption = null,
  }) {
    return _then(_value.copyWith(
      guid: null == guid
          ? _value.guid
          : guid // ignore: cast_nullable_to_non_nullable
              as String,
      isroot: null == isroot
          ? _value.isroot
          : isroot // ignore: cast_nullable_to_non_nullable
              as int,
      haschildren: null == haschildren
          ? _value.haschildren
          : haschildren // ignore: cast_nullable_to_non_nullable
              as int,
      parentguid: null == parentguid
          ? _value.parentguid
          : parentguid // ignore: cast_nullable_to_non_nullable
              as String,
      caption: null == caption
          ? _value.caption
          : caption // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProductCategoryModelCopyWith<$Res>
    implements $ProductCategoryModelCopyWith<$Res> {
  factory _$$_ProductCategoryModelCopyWith(_$_ProductCategoryModel value,
          $Res Function(_$_ProductCategoryModel) then) =
      __$$_ProductCategoryModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String guid,
      int isroot,
      int haschildren,
      String parentguid,
      String caption});
}

/// @nodoc
class __$$_ProductCategoryModelCopyWithImpl<$Res>
    extends _$ProductCategoryModelCopyWithImpl<$Res, _$_ProductCategoryModel>
    implements _$$_ProductCategoryModelCopyWith<$Res> {
  __$$_ProductCategoryModelCopyWithImpl(_$_ProductCategoryModel _value,
      $Res Function(_$_ProductCategoryModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? guid = null,
    Object? isroot = null,
    Object? haschildren = null,
    Object? parentguid = null,
    Object? caption = null,
  }) {
    return _then(_$_ProductCategoryModel(
      guid: null == guid
          ? _value.guid
          : guid // ignore: cast_nullable_to_non_nullable
              as String,
      isroot: null == isroot
          ? _value.isroot
          : isroot // ignore: cast_nullable_to_non_nullable
              as int,
      haschildren: null == haschildren
          ? _value.haschildren
          : haschildren // ignore: cast_nullable_to_non_nullable
              as int,
      parentguid: null == parentguid
          ? _value.parentguid
          : parentguid // ignore: cast_nullable_to_non_nullable
              as String,
      caption: null == caption
          ? _value.caption
          : caption // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProductCategoryModel extends _ProductCategoryModel {
  _$_ProductCategoryModel(
      {required this.guid,
      required this.isroot,
      required this.haschildren,
      required this.parentguid,
      required this.caption})
      : super._();

  factory _$_ProductCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$$_ProductCategoryModelFromJson(json);

  @override
  final String guid;
  @override
  final int isroot;
  @override
  final int haschildren;
  @override
  final String parentguid;
  @override
  final String caption;

  @override
  String toString() {
    return 'ProductCategoryModel(guid: $guid, isroot: $isroot, haschildren: $haschildren, parentguid: $parentguid, caption: $caption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductCategoryModel &&
            (identical(other.guid, guid) || other.guid == guid) &&
            (identical(other.isroot, isroot) || other.isroot == isroot) &&
            (identical(other.haschildren, haschildren) ||
                other.haschildren == haschildren) &&
            (identical(other.parentguid, parentguid) ||
                other.parentguid == parentguid) &&
            (identical(other.caption, caption) || other.caption == caption));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, guid, isroot, haschildren, parentguid, caption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProductCategoryModelCopyWith<_$_ProductCategoryModel> get copyWith =>
      __$$_ProductCategoryModelCopyWithImpl<_$_ProductCategoryModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProductCategoryModelToJson(
      this,
    );
  }
}

abstract class _ProductCategoryModel extends ProductCategoryModel {
  factory _ProductCategoryModel(
      {required final String guid,
      required final int isroot,
      required final int haschildren,
      required final String parentguid,
      required final String caption}) = _$_ProductCategoryModel;
  _ProductCategoryModel._() : super._();

  factory _ProductCategoryModel.fromJson(Map<String, dynamic> json) =
      _$_ProductCategoryModel.fromJson;

  @override
  String get guid;
  @override
  int get isroot;
  @override
  int get haschildren;
  @override
  String get parentguid;
  @override
  String get caption;
  @override
  @JsonKey(ignore: true)
  _$$_ProductCategoryModelCopyWith<_$_ProductCategoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}
