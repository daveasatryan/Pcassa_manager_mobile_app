// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'info_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

InfoModel _$InfoModelFromJson(Map<String, dynamic> json) {
  return _InfoModel.fromJson(json);
}

/// @nodoc
mixin _$InfoModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get adress => throw _privateConstructorUsedError;
  String get tel => throw _privateConstructorUsedError;
  String get mail => throw _privateConstructorUsedError;
  String get prim => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InfoModelCopyWith<InfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InfoModelCopyWith<$Res> {
  factory $InfoModelCopyWith(InfoModel value, $Res Function(InfoModel) then) =
      _$InfoModelCopyWithImpl<$Res, InfoModel>;
  @useResult
  $Res call(
      {int id,
      String name,
      String adress,
      String tel,
      String mail,
      String prim});
}

/// @nodoc
class _$InfoModelCopyWithImpl<$Res, $Val extends InfoModel>
    implements $InfoModelCopyWith<$Res> {
  _$InfoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? adress = null,
    Object? tel = null,
    Object? mail = null,
    Object? prim = null,
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
      adress: null == adress
          ? _value.adress
          : adress // ignore: cast_nullable_to_non_nullable
              as String,
      tel: null == tel
          ? _value.tel
          : tel // ignore: cast_nullable_to_non_nullable
              as String,
      mail: null == mail
          ? _value.mail
          : mail // ignore: cast_nullable_to_non_nullable
              as String,
      prim: null == prim
          ? _value.prim
          : prim // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InfoModelCopyWith<$Res> implements $InfoModelCopyWith<$Res> {
  factory _$$_InfoModelCopyWith(
          _$_InfoModel value, $Res Function(_$_InfoModel) then) =
      __$$_InfoModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String adress,
      String tel,
      String mail,
      String prim});
}

/// @nodoc
class __$$_InfoModelCopyWithImpl<$Res>
    extends _$InfoModelCopyWithImpl<$Res, _$_InfoModel>
    implements _$$_InfoModelCopyWith<$Res> {
  __$$_InfoModelCopyWithImpl(
      _$_InfoModel _value, $Res Function(_$_InfoModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? adress = null,
    Object? tel = null,
    Object? mail = null,
    Object? prim = null,
  }) {
    return _then(_$_InfoModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      adress: null == adress
          ? _value.adress
          : adress // ignore: cast_nullable_to_non_nullable
              as String,
      tel: null == tel
          ? _value.tel
          : tel // ignore: cast_nullable_to_non_nullable
              as String,
      mail: null == mail
          ? _value.mail
          : mail // ignore: cast_nullable_to_non_nullable
              as String,
      prim: null == prim
          ? _value.prim
          : prim // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_InfoModel extends _InfoModel {
  _$_InfoModel(
      {required this.id,
      required this.name,
      required this.adress,
      required this.tel,
      required this.mail,
      required this.prim})
      : super._();

  factory _$_InfoModel.fromJson(Map<String, dynamic> json) =>
      _$$_InfoModelFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String adress;
  @override
  final String tel;
  @override
  final String mail;
  @override
  final String prim;

  @override
  String toString() {
    return 'InfoModel(id: $id, name: $name, adress: $adress, tel: $tel, mail: $mail, prim: $prim)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InfoModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.adress, adress) || other.adress == adress) &&
            (identical(other.tel, tel) || other.tel == tel) &&
            (identical(other.mail, mail) || other.mail == mail) &&
            (identical(other.prim, prim) || other.prim == prim));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, adress, tel, mail, prim);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InfoModelCopyWith<_$_InfoModel> get copyWith =>
      __$$_InfoModelCopyWithImpl<_$_InfoModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_InfoModelToJson(
      this,
    );
  }
}

abstract class _InfoModel extends InfoModel {
  factory _InfoModel(
      {required final int id,
      required final String name,
      required final String adress,
      required final String tel,
      required final String mail,
      required final String prim}) = _$_InfoModel;
  _InfoModel._() : super._();

  factory _InfoModel.fromJson(Map<String, dynamic> json) =
      _$_InfoModel.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get adress;
  @override
  String get tel;
  @override
  String get mail;
  @override
  String get prim;
  @override
  @JsonKey(ignore: true)
  _$$_InfoModelCopyWith<_$_InfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}
