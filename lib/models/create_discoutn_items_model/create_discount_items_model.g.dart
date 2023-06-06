// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_discount_items_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DiscountItemsModel _$$_DiscountItemsModelFromJson(
        Map<String, dynamic> json) =>
    _$_DiscountItemsModel(
      id: json['id'] as int,
      name: json['name'] as String,
      tip: json['tip'] as String,
      val: json['val'] as int,
      status: json['status'] as int,
      rejim: json['rejim'] as String,
    );

Map<String, dynamic> _$$_DiscountItemsModelToJson(
        _$_DiscountItemsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'tip': instance.tip,
      'val': instance.val,
      'status': instance.status,
      'rejim': instance.rejim,
    };
