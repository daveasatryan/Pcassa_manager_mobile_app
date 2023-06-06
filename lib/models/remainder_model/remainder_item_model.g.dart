// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remainder_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RemainderItemListModel _$$_RemainderItemListModelFromJson(
        Map<String, dynamic> json) =>
    _$_RemainderItemListModel(
      items: (json['items'] as List<dynamic>)
          .map((e) => RemainderItemsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_RemainderItemListModelToJson(
        _$_RemainderItemListModel instance) =>
    <String, dynamic>{
      'items': instance.items,
    };
