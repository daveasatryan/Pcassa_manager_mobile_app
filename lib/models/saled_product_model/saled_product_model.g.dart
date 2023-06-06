// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saled_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SaledProductModel _$$_SaledProductModelFromJson(Map<String, dynamic> json) =>
    _$_SaledProductModel(
      summa: json['summa'] as int?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => SaledItemsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_SaledProductModelToJson(
        _$_SaledProductModel instance) =>
    <String, dynamic>{
      'summa': instance.summa,
      'items': instance.items,
    };
