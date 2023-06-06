// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manager_page_access_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ManagerPageAccessModel _$$_ManagerPageAccessModelFromJson(
        Map<String, dynamic> json) =>
    _$_ManagerPageAccessModel(
      productgroupaccess: (json['productgroupaccess'] as List<dynamic>?)
              ?.map((e) =>
                  AccessPageAccessModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <AccessPageAccessModel>[],
      settingsaccess: (json['settingsaccess'] as List<dynamic>?)
              ?.map((e) =>
                  AccessPageAccessModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <AccessPageAccessModel>[],
    );

Map<String, dynamic> _$$_ManagerPageAccessModelToJson(
        _$_ManagerPageAccessModel instance) =>
    <String, dynamic>{
      'productgroupaccess': instance.productgroupaccess,
      'settingsaccess': instance.settingsaccess,
    };
