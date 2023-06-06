// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kont_balance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_KontBalanceModel _$$_KontBalanceModelFromJson(Map<String, dynamic> json) =>
    _$_KontBalanceModel(
      sumitems: json['sumitems'] as int?,
      nachost: json['nachost'] as int?,
      items: (json['items'] as List<dynamic>?)
              ?.map((e) =>
                  KontBalanceItemModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      endost: json['endost'] as int?,
    );

Map<String, dynamic> _$$_KontBalanceModelToJson(_$_KontBalanceModel instance) =>
    <String, dynamic>{
      'sumitems': instance.sumitems,
      'nachost': instance.nachost,
      'items': instance.items,
      'endost': instance.endost,
    };
