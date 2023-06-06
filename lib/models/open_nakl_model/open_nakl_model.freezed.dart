// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'open_nakl_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OpenNaklModel _$OpenNaklModelFromJson(Map<String, dynamic> json) {
  return _OpenNaklModel.fromJson(json);
}

/// @nodoc
mixin _$OpenNaklModel {
  NaklInfoItemsModel get naklinfo => throw _privateConstructorUsedError;
  List<TovarArrayItems> get tovar => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OpenNaklModelCopyWith<OpenNaklModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OpenNaklModelCopyWith<$Res> {
  factory $OpenNaklModelCopyWith(
          OpenNaklModel value, $Res Function(OpenNaklModel) then) =
      _$OpenNaklModelCopyWithImpl<$Res, OpenNaklModel>;
  @useResult
  $Res call({NaklInfoItemsModel naklinfo, List<TovarArrayItems> tovar});

  $NaklInfoItemsModelCopyWith<$Res> get naklinfo;
}

/// @nodoc
class _$OpenNaklModelCopyWithImpl<$Res, $Val extends OpenNaklModel>
    implements $OpenNaklModelCopyWith<$Res> {
  _$OpenNaklModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? naklinfo = null,
    Object? tovar = null,
  }) {
    return _then(_value.copyWith(
      naklinfo: null == naklinfo
          ? _value.naklinfo
          : naklinfo // ignore: cast_nullable_to_non_nullable
              as NaklInfoItemsModel,
      tovar: null == tovar
          ? _value.tovar
          : tovar // ignore: cast_nullable_to_non_nullable
              as List<TovarArrayItems>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $NaklInfoItemsModelCopyWith<$Res> get naklinfo {
    return $NaklInfoItemsModelCopyWith<$Res>(_value.naklinfo, (value) {
      return _then(_value.copyWith(naklinfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_OpenNaklModelCopyWith<$Res>
    implements $OpenNaklModelCopyWith<$Res> {
  factory _$$_OpenNaklModelCopyWith(
          _$_OpenNaklModel value, $Res Function(_$_OpenNaklModel) then) =
      __$$_OpenNaklModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({NaklInfoItemsModel naklinfo, List<TovarArrayItems> tovar});

  @override
  $NaklInfoItemsModelCopyWith<$Res> get naklinfo;
}

/// @nodoc
class __$$_OpenNaklModelCopyWithImpl<$Res>
    extends _$OpenNaklModelCopyWithImpl<$Res, _$_OpenNaklModel>
    implements _$$_OpenNaklModelCopyWith<$Res> {
  __$$_OpenNaklModelCopyWithImpl(
      _$_OpenNaklModel _value, $Res Function(_$_OpenNaklModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? naklinfo = null,
    Object? tovar = null,
  }) {
    return _then(_$_OpenNaklModel(
      naklinfo: null == naklinfo
          ? _value.naklinfo
          : naklinfo // ignore: cast_nullable_to_non_nullable
              as NaklInfoItemsModel,
      tovar: null == tovar
          ? _value._tovar
          : tovar // ignore: cast_nullable_to_non_nullable
              as List<TovarArrayItems>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OpenNaklModel implements _OpenNaklModel {
  _$_OpenNaklModel(
      {required this.naklinfo, required final List<TovarArrayItems> tovar})
      : _tovar = tovar;

  factory _$_OpenNaklModel.fromJson(Map<String, dynamic> json) =>
      _$$_OpenNaklModelFromJson(json);

  @override
  final NaklInfoItemsModel naklinfo;
  final List<TovarArrayItems> _tovar;
  @override
  List<TovarArrayItems> get tovar {
    if (_tovar is EqualUnmodifiableListView) return _tovar;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tovar);
  }

  @override
  String toString() {
    return 'OpenNaklModel(naklinfo: $naklinfo, tovar: $tovar)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OpenNaklModel &&
            (identical(other.naklinfo, naklinfo) ||
                other.naklinfo == naklinfo) &&
            const DeepCollectionEquality().equals(other._tovar, _tovar));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, naklinfo, const DeepCollectionEquality().hash(_tovar));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OpenNaklModelCopyWith<_$_OpenNaklModel> get copyWith =>
      __$$_OpenNaklModelCopyWithImpl<_$_OpenNaklModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OpenNaklModelToJson(
      this,
    );
  }
}

abstract class _OpenNaklModel implements OpenNaklModel {
  factory _OpenNaklModel(
      {required final NaklInfoItemsModel naklinfo,
      required final List<TovarArrayItems> tovar}) = _$_OpenNaklModel;

  factory _OpenNaklModel.fromJson(Map<String, dynamic> json) =
      _$_OpenNaklModel.fromJson;

  @override
  NaklInfoItemsModel get naklinfo;
  @override
  List<TovarArrayItems> get tovar;
  @override
  @JsonKey(ignore: true)
  _$$_OpenNaklModelCopyWith<_$_OpenNaklModel> get copyWith =>
      throw _privateConstructorUsedError;
}
