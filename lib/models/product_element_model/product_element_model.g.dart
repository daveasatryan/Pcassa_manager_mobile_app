// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_element_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductElementModel _$$_ProductElementModelFromJson(
        Map<String, dynamic> json) =>
    _$_ProductElementModel(
      guid: json['guid'] as String,
      top: json['top'] as bool? ?? false,
      price_o_r: (json['price_o_r'] as num?)?.toDouble() ?? 0,
      price_o_o: (json['price_o_o'] as num?)?.toDouble() ?? 0,
      name: json['name'] as String?,
      gguid: json['gguid'] as String?,
      linkfoto: json['linkfoto'] as String?,
      kat_tov: json['kat_tov'] as String?,
      kod_tov: json['kod_tov'] as String?,
      description: json['description'] as String?,
      ed_izm: json['ed_izm'] as String?,
      barcode: json['barcode'] as String?,
      barcode_grupp: json['barcode_grupp'] as String?,
      priznak_sk: json['priznak_sk'] as int?,
      adg: json['adg'] as String?,
      kname: json['kname'] as String?,
      komplekt_id: json['komplekt_id'] as int?,
      status: json['status'] as bool?,
      excise: json['excise'] as bool?,
    );

Map<String, dynamic> _$$_ProductElementModelToJson(
        _$_ProductElementModel instance) =>
    <String, dynamic>{
      'guid': instance.guid,
      'top': instance.top,
      'price_o_r': instance.price_o_r,
      'price_o_o': instance.price_o_o,
      'name': instance.name,
      'gguid': instance.gguid,
      'linkfoto': instance.linkfoto,
      'kat_tov': instance.kat_tov,
      'kod_tov': instance.kod_tov,
      'description': instance.description,
      'ed_izm': instance.ed_izm,
      'barcode': instance.barcode,
      'barcode_grupp': instance.barcode_grupp,
      'priznak_sk': instance.priznak_sk,
      'adg': instance.adg,
      'kname': instance.kname,
      'komplekt_id': instance.komplekt_id,
      'status': instance.status,
      'excise': instance.excise,
    };
