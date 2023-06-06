// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tovar_array_items.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TovarArrayItems _$$_TovarArrayItemsFromJson(Map<String, dynamic> json) =>
    _$_TovarArrayItems(
      id: json['id'] as int,
      id_d: json['id_d'] as int,
      typ_d: json['typ_d'] as int,
      kod_tov: json['kod_tov'] as String,
      name: json['name'] as String,
      kol: (json['kol'] as num).toDouble(),
      ed_izm: json['ed_izm'] as String,
      cena_p: (json['cena_p'] as num?)?.toDouble(),
      cena_o: (json['cena_o'] as num?)?.toDouble(),
      summa_p: (json['summa_p'] as num?)?.toDouble(),
      summa_o: (json['summa_o'] as num?)?.toDouble(),
      barcode: json['barcode'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      summa_price: (json['summa_price'] as num?)?.toDouble(),
      skidka: json['skidka'] as int?,
      tip_skidki: json['tip_skidki'] as String?,
      pr_ras: (json['pr_ras'] as num?)?.toDouble(),
      cena_v: (json['cena_v'] as num?)?.toDouble(),
      summa_v: (json['summa_v'] as num?)?.toDouble(),
      idd_rn: json['idd_rn'] as int?,
      rn: json['rn'] as int?,
      spis: json['spis'] as String?,
      data_pr: json['data_pr'] as String?,
      kd: json['kd'] as int?,
      data_sr: json['data_sr'] as String?,
      nds: json['nds'] as int?,
      cena_nds: (json['cena_nds'] as num?)?.toDouble(),
      summa_nds: (json['summa_nds'] as num?)?.toDouble(),
      cena_bez_nds: (json['cena_bez_nds'] as num?)?.toDouble(),
      summa_bez_nds: (json['summa_bez_nds'] as num?)?.toDouble(),
      cena_nds_prixoda: (json['cena_nds_prixoda'] as num?)?.toDouble(),
      summa_nds_prixoda: (json['summa_nds_prixoda'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_TovarArrayItemsToJson(_$_TovarArrayItems instance) =>
    <String, dynamic>{
      'id': instance.id,
      'id_d': instance.id_d,
      'typ_d': instance.typ_d,
      'kod_tov': instance.kod_tov,
      'name': instance.name,
      'kol': instance.kol,
      'ed_izm': instance.ed_izm,
      'cena_p': instance.cena_p,
      'cena_o': instance.cena_o,
      'summa_p': instance.summa_p,
      'summa_o': instance.summa_o,
      'barcode': instance.barcode,
      'price': instance.price,
      'summa_price': instance.summa_price,
      'skidka': instance.skidka,
      'tip_skidki': instance.tip_skidki,
      'pr_ras': instance.pr_ras,
      'cena_v': instance.cena_v,
      'summa_v': instance.summa_v,
      'idd_rn': instance.idd_rn,
      'rn': instance.rn,
      'spis': instance.spis,
      'data_pr': instance.data_pr,
      'kd': instance.kd,
      'data_sr': instance.data_sr,
      'nds': instance.nds,
      'cena_nds': instance.cena_nds,
      'summa_nds': instance.summa_nds,
      'cena_bez_nds': instance.cena_bez_nds,
      'summa_bez_nds': instance.summa_bez_nds,
      'cena_nds_prixoda': instance.cena_nds_prixoda,
      'summa_nds_prixoda': instance.summa_nds_prixoda,
    };
