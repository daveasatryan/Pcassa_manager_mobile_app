// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saled_product_items_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SaledItemsModel _$$_SaledItemsModelFromJson(Map<String, dynamic> json) =>
    _$_SaledItemsModel(
      quantity: json['quantity'] as int?,
      amount: json['amount'] as int?,
      saleprice: json['saleprice'] as int?,
      kod_tov: json['kod_tov'] as String?,
      barcode: json['barcode'] as String?,
      name: json['name'] as String?,
      edizm: json['edizm'] as String?,
    );

Map<String, dynamic> _$$_SaledItemsModelToJson(_$_SaledItemsModel instance) =>
    <String, dynamic>{
      'quantity': instance.quantity,
      'amount': instance.amount,
      'saleprice': instance.saleprice,
      'kod_tov': instance.kod_tov,
      'barcode': instance.barcode,
      'name': instance.name,
      'edizm': instance.edizm,
    };
