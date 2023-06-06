// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'access_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AccessModel _$$_AccessModelFromJson(Map<String, dynamic> json) =>
    _$_AccessModel(
      kassa: CashierPageAccessModel.fromJson(
          json['kassa'] as Map<String, dynamic>),
      mananger: ManagerPageAccessModel.fromJson(
          json['mananger'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_AccessModelToJson(_$_AccessModel instance) =>
    <String, dynamic>{
      'kassa': instance.kassa,
      'mananger': instance.mananger,
    };
