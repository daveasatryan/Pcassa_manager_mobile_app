// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CurrencyItemModel _$$_CurrencyItemModelFromJson(Map<String, dynamic> json) =>
    _$_CurrencyItemModel(
      cod: json['cod'] as int,
      gguid: json['gguid'] as String,
      name: json['name'] as String,
      short_name: json['short_name'] as String,
      status: json['status'] as int,
      b_valyuta: json['b_valyuta'] as int,
      metod_round: (json['metod_round'] as num).toDouble(),
      tip: json['tip'] as int,
      tip_oplati: json['tip_oplati'] as int,
      spisanie: json['spisanie'] as int,
      linkfoto: json['linkfoto'] as String? ?? "null",
    );

Map<String, dynamic> _$$_CurrencyItemModelToJson(
        _$_CurrencyItemModel instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'gguid': instance.gguid,
      'name': instance.name,
      'short_name': instance.short_name,
      'status': instance.status,
      'b_valyuta': instance.b_valyuta,
      'metod_round': instance.metod_round,
      'tip': instance.tip,
      'tip_oplati': instance.tip_oplati,
      'spisanie': instance.spisanie,
      'linkfoto': instance.linkfoto,
    };
