// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CurrencyModel _$$_CurrencyModelFromJson(Map<String, dynamic> json) =>
    _$_CurrencyModel(
      guid: json['guid'] as String,
      caption: json['caption'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) => CurrencyItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_CurrencyModelToJson(_$_CurrencyModel instance) =>
    <String, dynamic>{
      'guid': instance.guid,
      'caption': instance.caption,
      'items': instance.items,
    };
