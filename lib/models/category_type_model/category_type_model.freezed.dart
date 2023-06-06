// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_type_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CategorytypeModel _$CategorytypeModelFromJson(Map<String, dynamic> json) {
  return _CategorytypeModel.fromJson(json);
}

/// @nodoc
mixin _$CategorytypeModel {
  String get guid => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategorytypeModelCopyWith<CategorytypeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategorytypeModelCopyWith<$Res> {
  factory $CategorytypeModelCopyWith(
          CategorytypeModel value, $Res Function(CategorytypeModel) then) =
      _$CategorytypeModelCopyWithImpl<$Res, CategorytypeModel>;
  @useResult
  $Res call({String guid, String name});
}

/// @nodoc
class _$CategorytypeModelCopyWithImpl<$Res, $Val extends CategorytypeModel>
    implements $CategorytypeModelCopyWith<$Res> {
  _$CategorytypeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? guid = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      guid: null == guid
          ? _value.guid
          : guid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CategorytypeModelCopyWith<$Res>
    implements $CategorytypeModelCopyWith<$Res> {
  factory _$$_CategorytypeModelCopyWith(_$_CategorytypeModel value,
          $Res Function(_$_CategorytypeModel) then) =
      __$$_CategorytypeModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String guid, String name});
}

/// @nodoc
class __$$_CategorytypeModelCopyWithImpl<$Res>
    extends _$CategorytypeModelCopyWithImpl<$Res, _$_CategorytypeModel>
    implements _$$_CategorytypeModelCopyWith<$Res> {
  __$$_CategorytypeModelCopyWithImpl(
      _$_CategorytypeModel _value, $Res Function(_$_CategorytypeModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? guid = null,
    Object? name = null,
  }) {
    return _then(_$_CategorytypeModel(
      guid: null == guid
          ? _value.guid
          : guid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CategorytypeModel implements _CategorytypeModel {
  _$_CategorytypeModel({required this.guid, required this.name});

  factory _$_CategorytypeModel.fromJson(Map<String, dynamic> json) =>
      _$$_CategorytypeModelFromJson(json);

  @override
  final String guid;
  @override
  final String name;

  @override
  String toString() {
    return 'CategorytypeModel(guid: $guid, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CategorytypeModel &&
            (identical(other.guid, guid) || other.guid == guid) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, guid, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CategorytypeModelCopyWith<_$_CategorytypeModel> get copyWith =>
      __$$_CategorytypeModelCopyWithImpl<_$_CategorytypeModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CategorytypeModelToJson(
      this,
    );
  }
}

abstract class _CategorytypeModel implements CategorytypeModel {
  factory _CategorytypeModel(
      {required final String guid,
      required final String name}) = _$_CategorytypeModel;

  factory _CategorytypeModel.fromJson(Map<String, dynamic> json) =
      _$_CategorytypeModel.fromJson;

  @override
  String get guid;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_CategorytypeModelCopyWith<_$_CategorytypeModel> get copyWith =>
      throw _privateConstructorUsedError;
}
