// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CreateUserModel _$CreateUserModelFromJson(Map<String, dynamic> json) {
  return _CreateUserModel.fromJson(json);
}

/// @nodoc
mixin _$CreateUserModel {
  int get id => throw _privateConstructorUsedError;
  String get login => throw _privateConstructorUsedError;
  String get fio => throw _privateConstructorUsedError;
  int get pin => throw _privateConstructorUsedError;
  String? get tipdostup => throw _privateConstructorUsedError;
  String get language => throw _privateConstructorUsedError;
  int get tip => throw _privateConstructorUsedError;
  String? get paswword => throw _privateConstructorUsedError;
  List<CardModel> get card => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateUserModelCopyWith<CreateUserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateUserModelCopyWith<$Res> {
  factory $CreateUserModelCopyWith(
          CreateUserModel value, $Res Function(CreateUserModel) then) =
      _$CreateUserModelCopyWithImpl<$Res, CreateUserModel>;
  @useResult
  $Res call(
      {int id,
      String login,
      String fio,
      int pin,
      String? tipdostup,
      String language,
      int tip,
      String? paswword,
      List<CardModel> card});
}

/// @nodoc
class _$CreateUserModelCopyWithImpl<$Res, $Val extends CreateUserModel>
    implements $CreateUserModelCopyWith<$Res> {
  _$CreateUserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? login = null,
    Object? fio = null,
    Object? pin = null,
    Object? tipdostup = freezed,
    Object? language = null,
    Object? tip = null,
    Object? paswword = freezed,
    Object? card = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      login: null == login
          ? _value.login
          : login // ignore: cast_nullable_to_non_nullable
              as String,
      fio: null == fio
          ? _value.fio
          : fio // ignore: cast_nullable_to_non_nullable
              as String,
      pin: null == pin
          ? _value.pin
          : pin // ignore: cast_nullable_to_non_nullable
              as int,
      tipdostup: freezed == tipdostup
          ? _value.tipdostup
          : tipdostup // ignore: cast_nullable_to_non_nullable
              as String?,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      tip: null == tip
          ? _value.tip
          : tip // ignore: cast_nullable_to_non_nullable
              as int,
      paswword: freezed == paswword
          ? _value.paswword
          : paswword // ignore: cast_nullable_to_non_nullable
              as String?,
      card: null == card
          ? _value.card
          : card // ignore: cast_nullable_to_non_nullable
              as List<CardModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CreateUserModelCopyWith<$Res>
    implements $CreateUserModelCopyWith<$Res> {
  factory _$$_CreateUserModelCopyWith(
          _$_CreateUserModel value, $Res Function(_$_CreateUserModel) then) =
      __$$_CreateUserModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String login,
      String fio,
      int pin,
      String? tipdostup,
      String language,
      int tip,
      String? paswword,
      List<CardModel> card});
}

/// @nodoc
class __$$_CreateUserModelCopyWithImpl<$Res>
    extends _$CreateUserModelCopyWithImpl<$Res, _$_CreateUserModel>
    implements _$$_CreateUserModelCopyWith<$Res> {
  __$$_CreateUserModelCopyWithImpl(
      _$_CreateUserModel _value, $Res Function(_$_CreateUserModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? login = null,
    Object? fio = null,
    Object? pin = null,
    Object? tipdostup = freezed,
    Object? language = null,
    Object? tip = null,
    Object? paswword = freezed,
    Object? card = null,
  }) {
    return _then(_$_CreateUserModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      login: null == login
          ? _value.login
          : login // ignore: cast_nullable_to_non_nullable
              as String,
      fio: null == fio
          ? _value.fio
          : fio // ignore: cast_nullable_to_non_nullable
              as String,
      pin: null == pin
          ? _value.pin
          : pin // ignore: cast_nullable_to_non_nullable
              as int,
      tipdostup: freezed == tipdostup
          ? _value.tipdostup
          : tipdostup // ignore: cast_nullable_to_non_nullable
              as String?,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      tip: null == tip
          ? _value.tip
          : tip // ignore: cast_nullable_to_non_nullable
              as int,
      paswword: freezed == paswword
          ? _value.paswword
          : paswword // ignore: cast_nullable_to_non_nullable
              as String?,
      card: null == card
          ? _value.card
          : card // ignore: cast_nullable_to_non_nullable
              as List<CardModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CreateUserModel implements _CreateUserModel {
  _$_CreateUserModel(
      {required this.id,
      required this.login,
      required this.fio,
      required this.pin,
      this.tipdostup,
      required this.language,
      required this.tip,
      this.paswword,
      this.card = const <CardModel>[]});

  factory _$_CreateUserModel.fromJson(Map<String, dynamic> json) =>
      _$$_CreateUserModelFromJson(json);

  @override
  final int id;
  @override
  final String login;
  @override
  final String fio;
  @override
  final int pin;
  @override
  final String? tipdostup;
  @override
  final String language;
  @override
  final int tip;
  @override
  final String? paswword;
  @override
  @JsonKey()
  final List<CardModel> card;

  @override
  String toString() {
    return 'CreateUserModel(id: $id, login: $login, fio: $fio, pin: $pin, tipdostup: $tipdostup, language: $language, tip: $tip, paswword: $paswword, card: $card)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreateUserModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.login, login) || other.login == login) &&
            (identical(other.fio, fio) || other.fio == fio) &&
            (identical(other.pin, pin) || other.pin == pin) &&
            (identical(other.tipdostup, tipdostup) ||
                other.tipdostup == tipdostup) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.tip, tip) || other.tip == tip) &&
            (identical(other.paswword, paswword) ||
                other.paswword == paswword) &&
            const DeepCollectionEquality().equals(other.card, card));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, login, fio, pin, tipdostup,
      language, tip, paswword, const DeepCollectionEquality().hash(card));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreateUserModelCopyWith<_$_CreateUserModel> get copyWith =>
      __$$_CreateUserModelCopyWithImpl<_$_CreateUserModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CreateUserModelToJson(
      this,
    );
  }
}

abstract class _CreateUserModel implements CreateUserModel {
  factory _CreateUserModel(
      {required final int id,
      required final String login,
      required final String fio,
      required final int pin,
      final String? tipdostup,
      required final String language,
      required final int tip,
      final String? paswword,
      final List<CardModel> card}) = _$_CreateUserModel;

  factory _CreateUserModel.fromJson(Map<String, dynamic> json) =
      _$_CreateUserModel.fromJson;

  @override
  int get id;
  @override
  String get login;
  @override
  String get fio;
  @override
  int get pin;
  @override
  String? get tipdostup;
  @override
  String get language;
  @override
  int get tip;
  @override
  String? get paswword;
  @override
  List<CardModel> get card;
  @override
  @JsonKey(ignore: true)
  _$$_CreateUserModelCopyWith<_$_CreateUserModel> get copyWith =>
      throw _privateConstructorUsedError;
}
