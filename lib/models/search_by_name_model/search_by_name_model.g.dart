// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_by_name_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SearchByNameModel _$$_SearchByNameModelFromJson(Map<String, dynamic> json) =>
    _$_SearchByNameModel(
      kod_tov: json['kod_tov'] as String?,
      barcode: json['barcode'] as String?,
      barcode_grupp: json['barcode_grupp'] as String?,
      name: json['name'] as String?,
      ed_izm: json['ed_izm'] as String?,
      price_o_r: json['price_o_r'] as int?,
      price_o_o: json['price_o_o'] as int?,
      price_s: json['price_s'] as int?,
      excise: json['excise'] as bool?,
    );

Map<String, dynamic> _$$_SearchByNameModelToJson(
        _$_SearchByNameModel instance) =>
    <String, dynamic>{
      'kod_tov': instance.kod_tov,
      'barcode': instance.barcode,
      'barcode_grupp': instance.barcode_grupp,
      'name': instance.name,
      'ed_izm': instance.ed_izm,
      'price_o_r': instance.price_o_r,
      'price_o_o': instance.price_o_o,
      'price_s': instance.price_s,
      'excise': instance.excise,
    };
