// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_discount_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GetDiscountsModel _$$_GetDiscountsModelFromJson(Map<String, dynamic> json) =>
    _$_GetDiscountsModel(
      id: json['id'] as int,
      name: json['name'] as String,
      linkfoto: json['linkfoto'] as String?,
      items: (json['items'] as List<dynamic>)
          .map((e) => DiscountItemsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_GetDiscountsModelToJson(
        _$_GetDiscountsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'linkfoto': instance.linkfoto,
      'items': instance.items,
    };
