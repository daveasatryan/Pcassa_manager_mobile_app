// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remainder_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RemainderItemsModel _$$_RemainderItemsModelFromJson(
        Map<String, dynamic> json) =>
    _$_RemainderItemsModel(
      kod_tov: json['kod_tov'] as String,
      barcode: json['barcode'] as String,
      name: json['name'] as String,
      ed_izm: json['ed_izm'] as String,
      quantity: json['quantity'] as int,
      price_o_r: json['price_o_r'] as int,
      price_s: json['price_s'] as int,
      sklname: json['sklname'] as String,
    );

Map<String, dynamic> _$$_RemainderItemsModelToJson(
        _$_RemainderItemsModel instance) =>
    <String, dynamic>{
      'kod_tov': instance.kod_tov,
      'barcode': instance.barcode,
      'name': instance.name,
      'ed_izm': instance.ed_izm,
      'quantity': instance.quantity,
      'price_o_r': instance.price_o_r,
      'price_s': instance.price_s,
      'sklname': instance.sklname,
    };
