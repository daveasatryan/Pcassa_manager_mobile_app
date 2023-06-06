// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SearchModel _$SearchModelFromJson(Map<String, dynamic> json) {
  return _SearchModel.fromJson(json);
}

/// @nodoc
mixin _$SearchModel {
  List<SearchByNameModel> get searchModelItems =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchModelCopyWith<SearchModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchModelCopyWith<$Res> {
  factory $SearchModelCopyWith(
          SearchModel value, $Res Function(SearchModel) then) =
      _$SearchModelCopyWithImpl<$Res, SearchModel>;
  @useResult
  $Res call({List<SearchByNameModel> searchModelItems});
}

/// @nodoc
class _$SearchModelCopyWithImpl<$Res, $Val extends SearchModel>
    implements $SearchModelCopyWith<$Res> {
  _$SearchModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchModelItems = null,
  }) {
    return _then(_value.copyWith(
      searchModelItems: null == searchModelItems
          ? _value.searchModelItems
          : searchModelItems // ignore: cast_nullable_to_non_nullable
              as List<SearchByNameModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SearchModelCopyWith<$Res>
    implements $SearchModelCopyWith<$Res> {
  factory _$$_SearchModelCopyWith(
          _$_SearchModel value, $Res Function(_$_SearchModel) then) =
      __$$_SearchModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<SearchByNameModel> searchModelItems});
}

/// @nodoc
class __$$_SearchModelCopyWithImpl<$Res>
    extends _$SearchModelCopyWithImpl<$Res, _$_SearchModel>
    implements _$$_SearchModelCopyWith<$Res> {
  __$$_SearchModelCopyWithImpl(
      _$_SearchModel _value, $Res Function(_$_SearchModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchModelItems = null,
  }) {
    return _then(_$_SearchModel(
      searchModelItems: null == searchModelItems
          ? _value._searchModelItems
          : searchModelItems // ignore: cast_nullable_to_non_nullable
              as List<SearchByNameModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SearchModel implements _SearchModel {
  _$_SearchModel(
      {final List<SearchByNameModel> searchModelItems =
          const <SearchByNameModel>[]})
      : _searchModelItems = searchModelItems;

  factory _$_SearchModel.fromJson(Map<String, dynamic> json) =>
      _$$_SearchModelFromJson(json);

  final List<SearchByNameModel> _searchModelItems;
  @override
  @JsonKey()
  List<SearchByNameModel> get searchModelItems {
    if (_searchModelItems is EqualUnmodifiableListView)
      return _searchModelItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchModelItems);
  }

  @override
  String toString() {
    return 'SearchModel(searchModelItems: $searchModelItems)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchModel &&
            const DeepCollectionEquality()
                .equals(other._searchModelItems, _searchModelItems));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_searchModelItems));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SearchModelCopyWith<_$_SearchModel> get copyWith =>
      __$$_SearchModelCopyWithImpl<_$_SearchModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SearchModelToJson(
      this,
    );
  }
}

abstract class _SearchModel implements SearchModel {
  factory _SearchModel({final List<SearchByNameModel> searchModelItems}) =
      _$_SearchModel;

  factory _SearchModel.fromJson(Map<String, dynamic> json) =
      _$_SearchModel.fromJson;

  @override
  List<SearchByNameModel> get searchModelItems;
  @override
  @JsonKey(ignore: true)
  _$$_SearchModelCopyWith<_$_SearchModel> get copyWith =>
      throw _privateConstructorUsedError;
}
