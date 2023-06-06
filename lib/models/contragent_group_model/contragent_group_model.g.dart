// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contragent_group_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ContragentGroupModel _$$_ContragentGroupModelFromJson(
        Map<String, dynamic> json) =>
    _$_ContragentGroupModel(
      guid: json['guid'] as String,
      isroot: json['isroot'] as int,
      haschildren: json['haschildren'] as int,
      parentguid: json['parentguid'] as String,
      caption: json['caption'] as String,
    );

Map<String, dynamic> _$$_ContragentGroupModelToJson(
        _$_ContragentGroupModel instance) =>
    <String, dynamic>{
      'guid': instance.guid,
      'isroot': instance.isroot,
      'haschildren': instance.haschildren,
      'parentguid': instance.parentguid,
      'caption': instance.caption,
    };
