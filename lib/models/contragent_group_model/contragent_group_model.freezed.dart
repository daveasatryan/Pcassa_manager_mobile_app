// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contragent_group_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ContragentGroupModel _$ContragentGroupModelFromJson(Map<String, dynamic> json) {
  return _ContragentGroupModel.fromJson(json);
}

/// @nodoc
mixin _$ContragentGroupModel {
  String get guid => throw _privateConstructorUsedError;
  int get isroot => throw _privateConstructorUsedError;
  int get haschildren => throw _privateConstructorUsedError;
  String get parentguid => throw _privateConstructorUsedError;
  String get caption => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContragentGroupModelCopyWith<ContragentGroupModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContragentGroupModelCopyWith<$Res> {
  factory $ContragentGroupModelCopyWith(ContragentGroupModel value,
          $Res Function(ContragentGroupModel) then) =
      _$ContragentGroupModelCopyWithImpl<$Res, ContragentGroupModel>;
  @useResult
  $Res call(
      {String guid,
      int isroot,
      int haschildren,
      String parentguid,
      String caption});
}

/// @nodoc
class _$ContragentGroupModelCopyWithImpl<$Res,
        $Val extends ContragentGroupModel>
    implements $ContragentGroupModelCopyWith<$Res> {
  _$ContragentGroupModelCopyWithImpl(this._value, this._then);

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
abstract class _$$_ContragentGroupModelCopyWith<$Res>
    implements $ContragentGroupModelCopyWith<$Res> {
  factory _$$_ContragentGroupModelCopyWith(_$_ContragentGroupModel value,
          $Res Function(_$_ContragentGroupModel) then) =
      __$$_ContragentGroupModelCopyWithImpl<$Res>;
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
class __$$_ContragentGroupModelCopyWithImpl<$Res>
    extends _$ContragentGroupModelCopyWithImpl<$Res, _$_ContragentGroupModel>
    implements _$$_ContragentGroupModelCopyWith<$Res> {
  __$$_ContragentGroupModelCopyWithImpl(_$_ContragentGroupModel _value,
      $Res Function(_$_ContragentGroupModel) _then)
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
    return _then(_$_ContragentGroupModel(
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
class _$_ContragentGroupModel extends _ContragentGroupModel {
  _$_ContragentGroupModel(
      {required this.guid,
      required this.isroot,
      required this.haschildren,
      required this.parentguid,
      required this.caption})
      : super._();

  factory _$_ContragentGroupModel.fromJson(Map<String, dynamic> json) =>
      _$$_ContragentGroupModelFromJson(json);

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
    return 'ContragentGroupModel(guid: $guid, isroot: $isroot, haschildren: $haschildren, parentguid: $parentguid, caption: $caption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ContragentGroupModel &&
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
  _$$_ContragentGroupModelCopyWith<_$_ContragentGroupModel> get copyWith =>
      __$$_ContragentGroupModelCopyWithImpl<_$_ContragentGroupModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ContragentGroupModelToJson(
      this,
    );
  }
}

abstract class _ContragentGroupModel extends ContragentGroupModel {
  factory _ContragentGroupModel(
      {required final String guid,
      required final int isroot,
      required final int haschildren,
      required final String parentguid,
      required final String caption}) = _$_ContragentGroupModel;
  _ContragentGroupModel._() : super._();

  factory _ContragentGroupModel.fromJson(Map<String, dynamic> json) =
      _$_ContragentGroupModel.fromJson;

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
  _$$_ContragentGroupModelCopyWith<_$_ContragentGroupModel> get copyWith =>
      throw _privateConstructorUsedError;
}
