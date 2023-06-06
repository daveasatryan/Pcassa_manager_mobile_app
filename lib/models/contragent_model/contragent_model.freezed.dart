// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contragent_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ContragentModel _$ContragentModelFromJson(Map<String, dynamic> json) {
  return _ContragentModel.fromJson(json);
}

/// @nodoc
mixin _$ContragentModel {
  List<ContragentGroupModel> get gruppakor =>
      throw _privateConstructorUsedError;
  List<ContragentItemsModel> get sprkor => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContragentModelCopyWith<ContragentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContragentModelCopyWith<$Res> {
  factory $ContragentModelCopyWith(
          ContragentModel value, $Res Function(ContragentModel) then) =
      _$ContragentModelCopyWithImpl<$Res, ContragentModel>;
  @useResult
  $Res call(
      {List<ContragentGroupModel> gruppakor,
      List<ContragentItemsModel> sprkor});
}

/// @nodoc
class _$ContragentModelCopyWithImpl<$Res, $Val extends ContragentModel>
    implements $ContragentModelCopyWith<$Res> {
  _$ContragentModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gruppakor = null,
    Object? sprkor = null,
  }) {
    return _then(_value.copyWith(
      gruppakor: null == gruppakor
          ? _value.gruppakor
          : gruppakor // ignore: cast_nullable_to_non_nullable
              as List<ContragentGroupModel>,
      sprkor: null == sprkor
          ? _value.sprkor
          : sprkor // ignore: cast_nullable_to_non_nullable
              as List<ContragentItemsModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ContragentModelCopyWith<$Res>
    implements $ContragentModelCopyWith<$Res> {
  factory _$$_ContragentModelCopyWith(
          _$_ContragentModel value, $Res Function(_$_ContragentModel) then) =
      __$$_ContragentModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ContragentGroupModel> gruppakor,
      List<ContragentItemsModel> sprkor});
}

/// @nodoc
class __$$_ContragentModelCopyWithImpl<$Res>
    extends _$ContragentModelCopyWithImpl<$Res, _$_ContragentModel>
    implements _$$_ContragentModelCopyWith<$Res> {
  __$$_ContragentModelCopyWithImpl(
      _$_ContragentModel _value, $Res Function(_$_ContragentModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gruppakor = null,
    Object? sprkor = null,
  }) {
    return _then(_$_ContragentModel(
      gruppakor: null == gruppakor
          ? _value._gruppakor
          : gruppakor // ignore: cast_nullable_to_non_nullable
              as List<ContragentGroupModel>,
      sprkor: null == sprkor
          ? _value._sprkor
          : sprkor // ignore: cast_nullable_to_non_nullable
              as List<ContragentItemsModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ContragentModel implements _ContragentModel {
  _$_ContragentModel(
      {required final List<ContragentGroupModel> gruppakor,
      required final List<ContragentItemsModel> sprkor})
      : _gruppakor = gruppakor,
        _sprkor = sprkor;

  factory _$_ContragentModel.fromJson(Map<String, dynamic> json) =>
      _$$_ContragentModelFromJson(json);

  final List<ContragentGroupModel> _gruppakor;
  @override
  List<ContragentGroupModel> get gruppakor {
    if (_gruppakor is EqualUnmodifiableListView) return _gruppakor;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_gruppakor);
  }

  final List<ContragentItemsModel> _sprkor;
  @override
  List<ContragentItemsModel> get sprkor {
    if (_sprkor is EqualUnmodifiableListView) return _sprkor;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sprkor);
  }

  @override
  String toString() {
    return 'ContragentModel(gruppakor: $gruppakor, sprkor: $sprkor)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ContragentModel &&
            const DeepCollectionEquality()
                .equals(other._gruppakor, _gruppakor) &&
            const DeepCollectionEquality().equals(other._sprkor, _sprkor));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_gruppakor),
      const DeepCollectionEquality().hash(_sprkor));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ContragentModelCopyWith<_$_ContragentModel> get copyWith =>
      __$$_ContragentModelCopyWithImpl<_$_ContragentModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ContragentModelToJson(
      this,
    );
  }
}

abstract class _ContragentModel implements ContragentModel {
  factory _ContragentModel(
      {required final List<ContragentGroupModel> gruppakor,
      required final List<ContragentItemsModel> sprkor}) = _$_ContragentModel;

  factory _ContragentModel.fromJson(Map<String, dynamic> json) =
      _$_ContragentModel.fromJson;

  @override
  List<ContragentGroupModel> get gruppakor;
  @override
  List<ContragentItemsModel> get sprkor;
  @override
  @JsonKey(ignore: true)
  _$$_ContragentModelCopyWith<_$_ContragentModel> get copyWith =>
      throw _privateConstructorUsedError;
}
