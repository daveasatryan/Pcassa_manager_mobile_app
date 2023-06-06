// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'act_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ActModel _$$_ActModelFromJson(Map<String, dynamic> json) => _$_ActModel(
      id: json['id'] as int?,
      n_dok: json['n_dok'] as String?,
      data_d: json['data_d'] as String?,
      typ_d: json['typ_d'] as int?,
      summa: (json['summa'] as num?)?.toDouble(),
      id_osn: json['id_osn'] as int?,
      t_osn: json['t_osn'] as int?,
      prim: json['prim'] as String?,
      kodpost: json['kodpost'] as int?,
      namepost: json['namepost'] as String?,
      val: json['val'] as String?,
      aktiv: json['aktiv'] as int?,
      kurs: (json['kurs'] as num?)?.toDouble(),
      summa_val: (json['summa_val'] as num?)?.toDouble(),
      kodzatrat: json['kodzatrat'] as int?,
      namezatrat: json['namezatrat'] as String?,
      srok_oplati: json['srok_oplati'] as String?,
    );

Map<String, dynamic> _$$_ActModelToJson(_$_ActModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'n_dok': instance.n_dok,
      'data_d': instance.data_d,
      'typ_d': instance.typ_d,
      'summa': instance.summa,
      'id_osn': instance.id_osn,
      't_osn': instance.t_osn,
      'prim': instance.prim,
      'kodpost': instance.kodpost,
      'namepost': instance.namepost,
      'val': instance.val,
      'aktiv': instance.aktiv,
      'kurs': instance.kurs,
      'summa_val': instance.summa_val,
      'kodzatrat': instance.kodzatrat,
      'namezatrat': instance.namezatrat,
      'srok_oplati': instance.srok_oplati,
    };
