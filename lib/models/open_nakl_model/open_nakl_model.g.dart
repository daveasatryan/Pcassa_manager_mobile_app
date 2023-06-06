// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'open_nakl_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OpenNaklModel _$$_OpenNaklModelFromJson(Map<String, dynamic> json) =>
    _$_OpenNaklModel(
      naklinfo:
          NaklInfoItemsModel.fromJson(json['naklinfo'] as Map<String, dynamic>),
      tovar: (json['tovar'] as List<dynamic>)
          .map((e) => TovarArrayItems.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_OpenNaklModelToJson(_$_OpenNaklModel instance) =>
    <String, dynamic>{
      'naklinfo': instance.naklinfo,
      'tovar': instance.tovar,
    };
