// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'manager_page_access_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ManagerPageAccessModel _$ManagerPageAccessModelFromJson(
    Map<String, dynamic> json) {
  return _ManagerPageAccessModel.fromJson(json);
}

/// @nodoc
mixin _$ManagerPageAccessModel {
  List<AccessPageAccessModel> get productgroupaccess =>
      throw _privateConstructorUsedError;
  List<AccessPageAccessModel> get settingsaccess =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ManagerPageAccessModelCopyWith<ManagerPageAccessModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ManagerPageAccessModelCopyWith<$Res> {
  factory $ManagerPageAccessModelCopyWith(ManagerPageAccessModel value,
          $Res Function(ManagerPageAccessModel) then) =
      _$ManagerPageAccessModelCopyWithImpl<$Res, ManagerPageAccessModel>;
  @useResult
  $Res call(
      {List<AccessPageAccessModel> productgroupaccess,
      List<AccessPageAccessModel> settingsaccess});
}

/// @nodoc
class _$ManagerPageAccessModelCopyWithImpl<$Res,
        $Val extends ManagerPageAccessModel>
    implements $ManagerPageAccessModelCopyWith<$Res> {
  _$ManagerPageAccessModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productgroupaccess = null,
    Object? settingsaccess = null,
  }) {
    return _then(_value.copyWith(
      productgroupaccess: null == productgroupaccess
          ? _value.productgroupaccess
          : productgroupaccess // ignore: cast_nullable_to_non_nullable
              as List<AccessPageAccessModel>,
      settingsaccess: null == settingsaccess
          ? _value.settingsaccess
          : settingsaccess // ignore: cast_nullable_to_non_nullable
              as List<AccessPageAccessModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ManagerPageAccessModelCopyWith<$Res>
    implements $ManagerPageAccessModelCopyWith<$Res> {
  factory _$$_ManagerPageAccessModelCopyWith(_$_ManagerPageAccessModel value,
          $Res Function(_$_ManagerPageAccessModel) then) =
      __$$_ManagerPageAccessModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<AccessPageAccessModel> productgroupaccess,
      List<AccessPageAccessModel> settingsaccess});
}

/// @nodoc
class __$$_ManagerPageAccessModelCopyWithImpl<$Res>
    extends _$ManagerPageAccessModelCopyWithImpl<$Res,
        _$_ManagerPageAccessModel>
    implements _$$_ManagerPageAccessModelCopyWith<$Res> {
  __$$_ManagerPageAccessModelCopyWithImpl(_$_ManagerPageAccessModel _value,
      $Res Function(_$_ManagerPageAccessModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productgroupaccess = null,
    Object? settingsaccess = null,
  }) {
    return _then(_$_ManagerPageAccessModel(
      productgroupaccess: null == productgroupaccess
          ? _value._productgroupaccess
          : productgroupaccess // ignore: cast_nullable_to_non_nullable
              as List<AccessPageAccessModel>,
      settingsaccess: null == settingsaccess
          ? _value._settingsaccess
          : settingsaccess // ignore: cast_nullable_to_non_nullable
              as List<AccessPageAccessModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ManagerPageAccessModel implements _ManagerPageAccessModel {
  _$_ManagerPageAccessModel(
      {final List<AccessPageAccessModel> productgroupaccess =
          const <AccessPageAccessModel>[],
      final List<AccessPageAccessModel> settingsaccess =
          const <AccessPageAccessModel>[]})
      : _productgroupaccess = productgroupaccess,
        _settingsaccess = settingsaccess;

  factory _$_ManagerPageAccessModel.fromJson(Map<String, dynamic> json) =>
      _$$_ManagerPageAccessModelFromJson(json);

  final List<AccessPageAccessModel> _productgroupaccess;
  @override
  @JsonKey()
  List<AccessPageAccessModel> get productgroupaccess {
    if (_productgroupaccess is EqualUnmodifiableListView)
      return _productgroupaccess;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_productgroupaccess);
  }

  final List<AccessPageAccessModel> _settingsaccess;
  @override
  @JsonKey()
  List<AccessPageAccessModel> get settingsaccess {
    if (_settingsaccess is EqualUnmodifiableListView) return _settingsaccess;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_settingsaccess);
  }

  @override
  String toString() {
    return 'ManagerPageAccessModel(productgroupaccess: $productgroupaccess, settingsaccess: $settingsaccess)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ManagerPageAccessModel &&
            const DeepCollectionEquality()
                .equals(other._productgroupaccess, _productgroupaccess) &&
            const DeepCollectionEquality()
                .equals(other._settingsaccess, _settingsaccess));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_productgroupaccess),
      const DeepCollectionEquality().hash(_settingsaccess));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ManagerPageAccessModelCopyWith<_$_ManagerPageAccessModel> get copyWith =>
      __$$_ManagerPageAccessModelCopyWithImpl<_$_ManagerPageAccessModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ManagerPageAccessModelToJson(
      this,
    );
  }
}

abstract class _ManagerPageAccessModel implements ManagerPageAccessModel {
  factory _ManagerPageAccessModel(
          {final List<AccessPageAccessModel> productgroupaccess,
          final List<AccessPageAccessModel> settingsaccess}) =
      _$_ManagerPageAccessModel;

  factory _ManagerPageAccessModel.fromJson(Map<String, dynamic> json) =
      _$_ManagerPageAccessModel.fromJson;

  @override
  List<AccessPageAccessModel> get productgroupaccess;
  @override
  List<AccessPageAccessModel> get settingsaccess;
  @override
  @JsonKey(ignore: true)
  _$$_ManagerPageAccessModelCopyWith<_$_ManagerPageAccessModel> get copyWith =>
      throw _privateConstructorUsedError;
}
