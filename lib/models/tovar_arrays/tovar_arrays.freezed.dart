// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tovar_arrays.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TovarArray _$TovarArrayFromJson(Map<String, dynamic> json) {
  return _TovarArray.fromJson(json);
}

/// @nodoc
mixin _$TovarArray {
  List<TovarArrayItems> get tovarArrays => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TovarArrayCopyWith<TovarArray> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TovarArrayCopyWith<$Res> {
  factory $TovarArrayCopyWith(
          TovarArray value, $Res Function(TovarArray) then) =
      _$TovarArrayCopyWithImpl<$Res, TovarArray>;
  @useResult
  $Res call({List<TovarArrayItems> tovarArrays});
}

/// @nodoc
class _$TovarArrayCopyWithImpl<$Res, $Val extends TovarArray>
    implements $TovarArrayCopyWith<$Res> {
  _$TovarArrayCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tovarArrays = null,
  }) {
    return _then(_value.copyWith(
      tovarArrays: null == tovarArrays
          ? _value.tovarArrays
          : tovarArrays // ignore: cast_nullable_to_non_nullable
              as List<TovarArrayItems>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TovarArrayCopyWith<$Res>
    implements $TovarArrayCopyWith<$Res> {
  factory _$$_TovarArrayCopyWith(
          _$_TovarArray value, $Res Function(_$_TovarArray) then) =
      __$$_TovarArrayCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<TovarArrayItems> tovarArrays});
}

/// @nodoc
class __$$_TovarArrayCopyWithImpl<$Res>
    extends _$TovarArrayCopyWithImpl<$Res, _$_TovarArray>
    implements _$$_TovarArrayCopyWith<$Res> {
  __$$_TovarArrayCopyWithImpl(
      _$_TovarArray _value, $Res Function(_$_TovarArray) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tovarArrays = null,
  }) {
    return _then(_$_TovarArray(
      tovarArrays: null == tovarArrays
          ? _value._tovarArrays
          : tovarArrays // ignore: cast_nullable_to_non_nullable
              as List<TovarArrayItems>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TovarArray implements _TovarArray {
  _$_TovarArray({final List<TovarArrayItems> tovarArrays = const []})
      : _tovarArrays = tovarArrays;

  factory _$_TovarArray.fromJson(Map<String, dynamic> json) =>
      _$$_TovarArrayFromJson(json);

  final List<TovarArrayItems> _tovarArrays;
  @override
  @JsonKey()
  List<TovarArrayItems> get tovarArrays {
    if (_tovarArrays is EqualUnmodifiableListView) return _tovarArrays;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tovarArrays);
  }

  @override
  String toString() {
    return 'TovarArray(tovarArrays: $tovarArrays)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TovarArray &&
            const DeepCollectionEquality()
                .equals(other._tovarArrays, _tovarArrays));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_tovarArrays));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TovarArrayCopyWith<_$_TovarArray> get copyWith =>
      __$$_TovarArrayCopyWithImpl<_$_TovarArray>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TovarArrayToJson(
      this,
    );
  }
}

abstract class _TovarArray implements TovarArray {
  factory _TovarArray({final List<TovarArrayItems> tovarArrays}) =
      _$_TovarArray;

  factory _TovarArray.fromJson(Map<String, dynamic> json) =
      _$_TovarArray.fromJson;

  @override
  List<TovarArrayItems> get tovarArrays;
  @override
  @JsonKey(ignore: true)
  _$$_TovarArrayCopyWith<_$_TovarArray> get copyWith =>
      throw _privateConstructorUsedError;
}
