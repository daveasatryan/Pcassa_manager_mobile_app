// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SearchModel _$$_SearchModelFromJson(Map<String, dynamic> json) =>
    _$_SearchModel(
      searchModelItems: (json['searchModelItems'] as List<dynamic>?)
              ?.map(
                  (e) => SearchByNameModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <SearchByNameModel>[],
    );

Map<String, dynamic> _$$_SearchModelToJson(_$_SearchModel instance) =>
    <String, dynamic>{
      'searchModelItems': instance.searchModelItems,
    };
