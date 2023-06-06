// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cash_order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CashOrderModel _$$_CashOrderModelFromJson(Map<String, dynamic> json) =>
    _$_CashOrderModel(
      id: json['id'] as int?,
      n_dok: json['n_dok'] as String?,
      data_d: json['data_d'] as String?,
      typ_d: json['typ_d'] as int?,
      summa: json['summa'] as int?,
      id_osn: json['id_osn'] as int?,
      t_osn: json['t_osn'] as int?,
      prim: json['prim'] as String?,
      kodpost: json['kodpost'] as int?,
      namepost: json['namepost'] as String?,
      val: json['val'] as String?,
      aktiv: json['aktiv'] as int?,
      kurs: (json['kurs'] as num?)?.toDouble(),
      summa_v: json['summa_v'] as int?,
      pr_kassa: (json['pr_kassa'] as num?)?.toDouble(),
      id_vidkas: json['id_vidkas'] as int?,
    );

Map<String, dynamic> _$$_CashOrderModelToJson(_$_CashOrderModel instance) =>
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
      'summa_v': instance.summa_v,
      'pr_kassa': instance.pr_kassa,
      'id_vidkas': instance.id_vidkas,
    };
