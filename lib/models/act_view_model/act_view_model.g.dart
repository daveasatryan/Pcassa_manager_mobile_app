// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'act_view_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ActViewModel _$$_ActViewModelFromJson(Map<String, dynamic> json) =>
    _$_ActViewModel(
      id: json['id'] as int?,
      typ_d: json['typ_d'] as int?,
      n_dok: json['n_dok'] as String?,
      data_d: json['data_d'] as String?,
      kodpost: json['kodpost'] as int?,
      kontname: json['kontname'] as String?,
      srok_oplati: json['srok_oplati'] as String?,
      kod_zat: json['kod_zat'] as int?,
      name: json['name'] as String?,
      prim: json['prim'] as String?,
    );

Map<String, dynamic> _$$_ActViewModelToJson(_$_ActViewModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'typ_d': instance.typ_d,
      'n_dok': instance.n_dok,
      'data_d': instance.data_d,
      'kodpost': instance.kodpost,
      'kontname': instance.kontname,
      'srok_oplati': instance.srok_oplati,
      'kod_zat': instance.kod_zat,
      'name': instance.name,
      'prim': instance.prim,
    };
