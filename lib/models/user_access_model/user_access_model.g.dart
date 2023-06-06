// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_access_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserAccessModel _$$_UserAccessModelFromJson(Map<String, dynamic> json) =>
    _$_UserAccessModel(
      settingsaccess: (json['settingsaccess'] as List<dynamic>?)
              ?.map((e) => e as String?)
              .toList() ??
          const [],
      productgroupaccess: (json['productgroupaccess'] as List<dynamic>?)
              ?.map((e) => e as String?)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_UserAccessModelToJson(_$_UserAccessModel instance) =>
    <String, dynamic>{
      'settingsaccess': instance.settingsaccess,
      'productgroupaccess': instance.productgroupaccess,
    };
