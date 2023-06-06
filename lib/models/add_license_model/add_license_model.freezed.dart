// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_license_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AddLicenseModel _$AddLicenseModelFromJson(Map<String, dynamic> json) {
  return _AddLicenseModel.fromJson(json);
}

/// @nodoc
mixin _$AddLicenseModel {
  int? get port => throw _privateConstructorUsedError;
  String? get ip => throw _privateConstructorUsedError;
  String? get license_key => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddLicenseModelCopyWith<AddLicenseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddLicenseModelCopyWith<$Res> {
  factory $AddLicenseModelCopyWith(
          AddLicenseModel value, $Res Function(AddLicenseModel) then) =
      _$AddLicenseModelCopyWithImpl<$Res, AddLicenseModel>;
  @useResult
  $Res call({int? port, String? ip, String? license_key});
}

/// @nodoc
class _$AddLicenseModelCopyWithImpl<$Res, $Val extends AddLicenseModel>
    implements $AddLicenseModelCopyWith<$Res> {
  _$AddLicenseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? port = freezed,
    Object? ip = freezed,
    Object? license_key = freezed,
  }) {
    return _then(_value.copyWith(
      port: freezed == port
          ? _value.port
          : port // ignore: cast_nullable_to_non_nullable
              as int?,
      ip: freezed == ip
          ? _value.ip
          : ip // ignore: cast_nullable_to_non_nullable
              as String?,
      license_key: freezed == license_key
          ? _value.license_key
          : license_key // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AddLicenseModelCopyWith<$Res>
    implements $AddLicenseModelCopyWith<$Res> {
  factory _$$_AddLicenseModelCopyWith(
          _$_AddLicenseModel value, $Res Function(_$_AddLicenseModel) then) =
      __$$_AddLicenseModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? port, String? ip, String? license_key});
}

/// @nodoc
class __$$_AddLicenseModelCopyWithImpl<$Res>
    extends _$AddLicenseModelCopyWithImpl<$Res, _$_AddLicenseModel>
    implements _$$_AddLicenseModelCopyWith<$Res> {
  __$$_AddLicenseModelCopyWithImpl(
      _$_AddLicenseModel _value, $Res Function(_$_AddLicenseModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? port = freezed,
    Object? ip = freezed,
    Object? license_key = freezed,
  }) {
    return _then(_$_AddLicenseModel(
      port: freezed == port
          ? _value.port
          : port // ignore: cast_nullable_to_non_nullable
              as int?,
      ip: freezed == ip
          ? _value.ip
          : ip // ignore: cast_nullable_to_non_nullable
              as String?,
      license_key: freezed == license_key
          ? _value.license_key
          : license_key // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AddLicenseModel implements _AddLicenseModel {
  _$_AddLicenseModel({this.port, this.ip, this.license_key});

  factory _$_AddLicenseModel.fromJson(Map<String, dynamic> json) =>
      _$$_AddLicenseModelFromJson(json);

  @override
  final int? port;
  @override
  final String? ip;
  @override
  final String? license_key;

  @override
  String toString() {
    return 'AddLicenseModel(port: $port, ip: $ip, license_key: $license_key)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddLicenseModel &&
            (identical(other.port, port) || other.port == port) &&
            (identical(other.ip, ip) || other.ip == ip) &&
            (identical(other.license_key, license_key) ||
                other.license_key == license_key));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, port, ip, license_key);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddLicenseModelCopyWith<_$_AddLicenseModel> get copyWith =>
      __$$_AddLicenseModelCopyWithImpl<_$_AddLicenseModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AddLicenseModelToJson(
      this,
    );
  }
}

abstract class _AddLicenseModel implements AddLicenseModel {
  factory _AddLicenseModel(
      {final int? port,
      final String? ip,
      final String? license_key}) = _$_AddLicenseModel;

  factory _AddLicenseModel.fromJson(Map<String, dynamic> json) =
      _$_AddLicenseModel.fromJson;

  @override
  int? get port;
  @override
  String? get ip;
  @override
  String? get license_key;
  @override
  @JsonKey(ignore: true)
  _$$_AddLicenseModelCopyWith<_$_AddLicenseModel> get copyWith =>
      throw _privateConstructorUsedError;
}
