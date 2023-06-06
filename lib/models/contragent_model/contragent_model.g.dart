// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contragent_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ContragentModel _$$_ContragentModelFromJson(Map<String, dynamic> json) =>
    _$_ContragentModel(
      gruppakor: (json['gruppakor'] as List<dynamic>)
          .map((e) => ContragentGroupModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      sprkor: (json['sprkor'] as List<dynamic>)
          .map((e) => ContragentItemsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ContragentModelToJson(_$_ContragentModel instance) =>
    <String, dynamic>{
      'gruppakor': instance.gruppakor,
      'sprkor': instance.sprkor,
    };
