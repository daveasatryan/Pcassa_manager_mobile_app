// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      id: json['id'] as int,
      login: json['login'] as String,
      fio: json['fio'] as String,
      language: json['language'] as String,
      dostup: UserAccessModel.fromJson(json['dostup'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'login': instance.login,
      'fio': instance.fio,
      'language': instance.language,
      'dostup': instance.dostup,
    };
