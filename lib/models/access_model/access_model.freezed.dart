// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'access_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AccessModel _$AccessModelFromJson(Map<String, dynamic> json) {
  return _AccessModel.fromJson(json);
}

/// @nodoc
mixin _$AccessModel {
  CashierPageAccessModel get kassa => throw _privateConstructorUsedError;
  ManagerPageAccessModel get mananger => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AccessModelCopyWith<AccessModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccessModelCopyWith<$Res> {
  factory $AccessModelCopyWith(
          AccessModel value, $Res Function(AccessModel) then) =
      _$AccessModelCopyWithImpl<$Res, AccessModel>;
  @useResult
  $Res call({CashierPageAccessModel kassa, ManagerPageAccessModel mananger});

  $CashierPageAccessModelCopyWith<$Res> get kassa;
  $ManagerPageAccessModelCopyWith<$Res> get mananger;
}

/// @nodoc
class _$AccessModelCopyWithImpl<$Res, $Val extends AccessModel>
    implements $AccessModelCopyWith<$Res> {
  _$AccessModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kassa = null,
    Object? mananger = null,
  }) {
    return _then(_value.copyWith(
      kassa: null == kassa
          ? _value.kassa
          : kassa // ignore: cast_nullable_to_non_nullable
              as CashierPageAccessModel,
      mananger: null == mananger
          ? _value.mananger
          : mananger // ignore: cast_nullable_to_non_nullable
              as ManagerPageAccessModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CashierPageAccessModelCopyWith<$Res> get kassa {
    return $CashierPageAccessModelCopyWith<$Res>(_value.kassa, (value) {
      return _then(_value.copyWith(kassa: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ManagerPageAccessModelCopyWith<$Res> get mananger {
    return $ManagerPageAccessModelCopyWith<$Res>(_value.mananger, (value) {
      return _then(_value.copyWith(mananger: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AccessModelCopyWith<$Res>
    implements $AccessModelCopyWith<$Res> {
  factory _$$_AccessModelCopyWith(
          _$_AccessModel value, $Res Function(_$_AccessModel) then) =
      __$$_AccessModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({CashierPageAccessModel kassa, ManagerPageAccessModel mananger});

  @override
  $CashierPageAccessModelCopyWith<$Res> get kassa;
  @override
  $ManagerPageAccessModelCopyWith<$Res> get mananger;
}

/// @nodoc
class __$$_AccessModelCopyWithImpl<$Res>
    extends _$AccessModelCopyWithImpl<$Res, _$_AccessModel>
    implements _$$_AccessModelCopyWith<$Res> {
  __$$_AccessModelCopyWithImpl(
      _$_AccessModel _value, $Res Function(_$_AccessModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kassa = null,
    Object? mananger = null,
  }) {
    return _then(_$_AccessModel(
      kassa: null == kassa
          ? _value.kassa
          : kassa // ignore: cast_nullable_to_non_nullable
              as CashierPageAccessModel,
      mananger: null == mananger
          ? _value.mananger
          : mananger // ignore: cast_nullable_to_non_nullable
              as ManagerPageAccessModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AccessModel implements _AccessModel {
  _$_AccessModel({required this.kassa, required this.mananger});

  factory _$_AccessModel.fromJson(Map<String, dynamic> json) =>
      _$$_AccessModelFromJson(json);

  @override
  final CashierPageAccessModel kassa;
  @override
  final ManagerPageAccessModel mananger;

  @override
  String toString() {
    return 'AccessModel(kassa: $kassa, mananger: $mananger)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AccessModel &&
            (identical(other.kassa, kassa) || other.kassa == kassa) &&
            (identical(other.mananger, mananger) ||
                other.mananger == mananger));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, kassa, mananger);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AccessModelCopyWith<_$_AccessModel> get copyWith =>
      __$$_AccessModelCopyWithImpl<_$_AccessModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AccessModelToJson(
      this,
    );
  }
}

abstract class _AccessModel implements AccessModel {
  factory _AccessModel(
      {required final CashierPageAccessModel kassa,
      required final ManagerPageAccessModel mananger}) = _$_AccessModel;

  factory _AccessModel.fromJson(Map<String, dynamic> json) =
      _$_AccessModel.fromJson;

  @override
  CashierPageAccessModel get kassa;
  @override
  ManagerPageAccessModel get mananger;
  @override
  @JsonKey(ignore: true)
  _$$_AccessModelCopyWith<_$_AccessModel> get copyWith =>
      throw _privateConstructorUsedError;
}
