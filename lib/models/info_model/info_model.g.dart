// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_InfoModel _$$_InfoModelFromJson(Map<String, dynamic> json) => _$_InfoModel(
      id: json['id'] as int,
      name: json['name'] as String,
      adress: json['adress'] as String,
      tel: json['tel'] as String,
      mail: json['mail'] as String,
      prim: json['prim'] as String,
    );

Map<String, dynamic> _$$_InfoModelToJson(_$_InfoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'adress': instance.adress,
      'tel': instance.tel,
      'mail': instance.mail,
      'prim': instance.prim,
    };
