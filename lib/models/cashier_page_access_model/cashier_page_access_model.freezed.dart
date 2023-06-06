// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cashier_page_access_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CashierPageAccessModel _$CashierPageAccessModelFromJson(
    Map<String, dynamic> json) {
  return _CashierPageAccessModel.fromJson(json);
}

/// @nodoc
mixin _$CashierPageAccessModel {
  List<AccessPageAccessModel> get TablesScreen =>
      throw _privateConstructorUsedError;
  List<AccessPageAccessModel> get quick_check =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CashierPageAccessModelCopyWith<CashierPageAccessModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CashierPageAccessModelCopyWith<$Res> {
  factory $CashierPageAccessModelCopyWith(CashierPageAccessModel value,
          $Res Function(CashierPageAccessModel) then) =
      _$CashierPageAccessModelCopyWithImpl<$Res, CashierPageAccessModel>;
  @useResult
  $Res call(
      {List<AccessPageAccessModel> TablesScreen,
      List<AccessPageAccessModel> quick_check});
}

/// @nodoc
class _$CashierPageAccessModelCopyWithImpl<$Res,
        $Val extends CashierPageAccessModel>
    implements $CashierPageAccessModelCopyWith<$Res> {
  _$CashierPageAccessModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? TablesScreen = null,
    Object? quick_check = null,
  }) {
    return _then(_value.copyWith(
      TablesScreen: null == TablesScreen
          ? _value.TablesScreen
          : TablesScreen // ignore: cast_nullable_to_non_nullable
              as List<AccessPageAccessModel>,
      quick_check: null == quick_check
          ? _value.quick_check
          : quick_check // ignore: cast_nullable_to_non_nullable
              as List<AccessPageAccessModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CashierPageAccessModelCopyWith<$Res>
    implements $CashierPageAccessModelCopyWith<$Res> {
  factory _$$_CashierPageAccessModelCopyWith(_$_CashierPageAccessModel value,
          $Res Function(_$_CashierPageAccessModel) then) =
      __$$_CashierPageAccessModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<AccessPageAccessModel> TablesScreen,
      List<AccessPageAccessModel> quick_check});
}

/// @nodoc
class __$$_CashierPageAccessModelCopyWithImpl<$Res>
    extends _$CashierPageAccessModelCopyWithImpl<$Res,
        _$_CashierPageAccessModel>
    implements _$$_CashierPageAccessModelCopyWith<$Res> {
  __$$_CashierPageAccessModelCopyWithImpl(_$_CashierPageAccessModel _value,
      $Res Function(_$_CashierPageAccessModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? TablesScreen = null,
    Object? quick_check = null,
  }) {
    return _then(_$_CashierPageAccessModel(
      TablesScreen: null == TablesScreen
          ? _value._TablesScreen
          : TablesScreen // ignore: cast_nullable_to_non_nullable
              as List<AccessPageAccessModel>,
      quick_check: null == quick_check
          ? _value._quick_check
          : quick_check // ignore: cast_nullable_to_non_nullable
              as List<AccessPageAccessModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CashierPageAccessModel implements _CashierPageAccessModel {
  _$_CashierPageAccessModel(
      {final List<AccessPageAccessModel> TablesScreen =
          const <AccessPageAccessModel>[],
      final List<AccessPageAccessModel> quick_check =
          const <AccessPageAccessModel>[]})
      : _TablesScreen = TablesScreen,
        _quick_check = quick_check;

  factory _$_CashierPageAccessModel.fromJson(Map<String, dynamic> json) =>
      _$$_CashierPageAccessModelFromJson(json);

  final List<AccessPageAccessModel> _TablesScreen;
  @override
  @JsonKey()
  List<AccessPageAccessModel> get TablesScreen {
    if (_TablesScreen is EqualUnmodifiableListView) return _TablesScreen;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_TablesScreen);
  }

  final List<AccessPageAccessModel> _quick_check;
  @override
  @JsonKey()
  List<AccessPageAccessModel> get quick_check {
    if (_quick_check is EqualUnmodifiableListView) return _quick_check;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_quick_check);
  }

  @override
  String toString() {
    return 'CashierPageAccessModel(TablesScreen: $TablesScreen, quick_check: $quick_check)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CashierPageAccessModel &&
            const DeepCollectionEquality()
                .equals(other._TablesScreen, _TablesScreen) &&
            const DeepCollectionEquality()
                .equals(other._quick_check, _quick_check));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_TablesScreen),
      const DeepCollectionEquality().hash(_quick_check));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CashierPageAccessModelCopyWith<_$_CashierPageAccessModel> get copyWith =>
      __$$_CashierPageAccessModelCopyWithImpl<_$_CashierPageAccessModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CashierPageAccessModelToJson(
      this,
    );
  }
}

abstract class _CashierPageAccessModel implements CashierPageAccessModel {
  factory _CashierPageAccessModel(
          {final List<AccessPageAccessModel> TablesScreen,
          final List<AccessPageAccessModel> quick_check}) =
      _$_CashierPageAccessModel;

  factory _CashierPageAccessModel.fromJson(Map<String, dynamic> json) =
      _$_CashierPageAccessModel.fromJson;

  @override
  List<AccessPageAccessModel> get TablesScreen;
  @override
  List<AccessPageAccessModel> get quick_check;
  @override
  @JsonKey(ignore: true)
  _$$_CashierPageAccessModelCopyWith<_$_CashierPageAccessModel> get copyWith =>
      throw _privateConstructorUsedError;
}
