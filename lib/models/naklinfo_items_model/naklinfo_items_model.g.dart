// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'naklinfo_items_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NaklInfoItemsModel _$$_NaklInfoItemsModelFromJson(
        Map<String, dynamic> json) =>
    _$_NaklInfoItemsModel(
      id: json['id'] as int?,
      typ_d: json['typ_d'] as int?,
      n_dok: json['n_dok'] as String?,
      data_d: json['data_d'] as String?,
      kodpost: json['kodpost'] as int?,
      namepost: json['namepost'] as String?,
      skl1: json['skl1'] as int?,
      skl2: json['skl2'] as int?,
      skl1name: json['skl1name'] as String?,
      skl2name: json['skl2name'] as String?,
      srok_oplati: json['srok_oplati'] as String?,
      prim: json['prim'] as String?,
      aktiv: json['aktiv'] as int?,
      val: json['val'] as String?,
      skidka: json['skidka'] as int?,
      tip_skidki: json['tip_skidki'] as String?,
      contact_litso: json['contact_litso'] as String?,
      kurs: (json['kurs'] as num?)?.toDouble(),
      pr_ras: (json['pr_ras'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_NaklInfoItemsModelToJson(
        _$_NaklInfoItemsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'typ_d': instance.typ_d,
      'n_dok': instance.n_dok,
      'data_d': instance.data_d,
      'kodpost': instance.kodpost,
      'namepost': instance.namepost,
      'skl1': instance.skl1,
      'skl2': instance.skl2,
      'skl1name': instance.skl1name,
      'skl2name': instance.skl2name,
      'srok_oplati': instance.srok_oplati,
      'prim': instance.prim,
      'aktiv': instance.aktiv,
      'val': instance.val,
      'skidka': instance.skidka,
      'tip_skidki': instance.tip_skidki,
      'contact_litso': instance.contact_litso,
      'kurs': instance.kurs,
      'pr_ras': instance.pr_ras,
    };
