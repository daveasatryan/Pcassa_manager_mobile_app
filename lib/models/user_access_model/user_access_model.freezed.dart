// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_access_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserAccessModel _$UserAccessModelFromJson(Map<String, dynamic> json) {
  return _UserAccessModel.fromJson(json);
}

/// @nodoc
mixin _$UserAccessModel {
  List<String?> get settingsaccess => throw _privateConstructorUsedError;
  List<String?> get productgroupaccess => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserAccessModelCopyWith<UserAccessModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserAccessModelCopyWith<$Res> {
  factory $UserAccessModelCopyWith(
          UserAccessModel value, $Res Function(UserAccessModel) then) =
      _$UserAccessModelCopyWithImpl<$Res, UserAccessModel>;
  @useResult
  $Res call({List<String?> settingsaccess, List<String?> productgroupaccess});
}

/// @nodoc
class _$UserAccessModelCopyWithImpl<$Res, $Val extends UserAccessModel>
    implements $UserAccessModelCopyWith<$Res> {
  _$UserAccessModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? settingsaccess = null,
    Object? productgroupaccess = null,
  }) {
    return _then(_value.copyWith(
      settingsaccess: null == settingsaccess
          ? _value.settingsaccess
          : settingsaccess // ignore: cast_nullable_to_non_nullable
              as List<String?>,
      productgroupaccess: null == productgroupaccess
          ? _value.productgroupaccess
          : productgroupaccess // ignore: cast_nullable_to_non_nullable
              as List<String?>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserAccessModelCopyWith<$Res>
    implements $UserAccessModelCopyWith<$Res> {
  factory _$$_UserAccessModelCopyWith(
          _$_UserAccessModel value, $Res Function(_$_UserAccessModel) then) =
      __$$_UserAccessModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String?> settingsaccess, List<String?> productgroupaccess});
}

/// @nodoc
class __$$_UserAccessModelCopyWithImpl<$Res>
    extends _$UserAccessModelCopyWithImpl<$Res, _$_UserAccessModel>
    implements _$$_UserAccessModelCopyWith<$Res> {
  __$$_UserAccessModelCopyWithImpl(
      _$_UserAccessModel _value, $Res Function(_$_UserAccessModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? settingsaccess = null,
    Object? productgroupaccess = null,
  }) {
    return _then(_$_UserAccessModel(
      settingsaccess: null == settingsaccess
          ? _value._settingsaccess
          : settingsaccess // ignore: cast_nullable_to_non_nullable
              as List<String?>,
      productgroupaccess: null == productgroupaccess
          ? _value._productgroupaccess
          : productgroupaccess // ignore: cast_nullable_to_non_nullable
              as List<String?>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserAccessModel implements _UserAccessModel {
  _$_UserAccessModel(
      {final List<String?> settingsaccess = const [],
      final List<String?> productgroupaccess = const []})
      : _settingsaccess = settingsaccess,
        _productgroupaccess = productgroupaccess;

  factory _$_UserAccessModel.fromJson(Map<String, dynamic> json) =>
      _$$_UserAccessModelFromJson(json);

  final List<String?> _settingsaccess;
  @override
  @JsonKey()
  List<String?> get settingsaccess {
    if (_settingsaccess is EqualUnmodifiableListView) return _settingsaccess;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_settingsaccess);
  }

  final List<String?> _productgroupaccess;
  @override
  @JsonKey()
  List<String?> get productgroupaccess {
    if (_productgroupaccess is EqualUnmodifiableListView)
      return _productgroupaccess;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_productgroupaccess);
  }

  @override
  String toString() {
    return 'UserAccessModel(settingsaccess: $settingsaccess, productgroupaccess: $productgroupaccess)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserAccessModel &&
            const DeepCollectionEquality()
                .equals(other._settingsaccess, _settingsaccess) &&
            const DeepCollectionEquality()
                .equals(other._productgroupaccess, _productgroupaccess));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_settingsaccess),
      const DeepCollectionEquality().hash(_productgroupaccess));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserAccessModelCopyWith<_$_UserAccessModel> get copyWith =>
      __$$_UserAccessModelCopyWithImpl<_$_UserAccessModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserAccessModelToJson(
      this,
    );
  }
}

abstract class _UserAccessModel implements UserAccessModel {
  factory _UserAccessModel(
      {final List<String?> settingsaccess,
      final List<String?> productgroupaccess}) = _$_UserAccessModel;

  factory _UserAccessModel.fromJson(Map<String, dynamic> json) =
      _$_UserAccessModel.fromJson;

  @override
  List<String?> get settingsaccess;
  @override
  List<String?> get productgroupaccess;
  @override
  @JsonKey(ignore: true)
  _$$_UserAccessModelCopyWith<_$_UserAccessModel> get copyWith =>
      throw _privateConstructorUsedError;
}
