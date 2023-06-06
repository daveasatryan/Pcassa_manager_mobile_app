// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CreateUserModel _$$_CreateUserModelFromJson(Map<String, dynamic> json) =>
    _$_CreateUserModel(
      id: json['id'] as int,
      login: json['login'] as String,
      fio: json['fio'] as String,
      pin: json['pin'] as int,
      tipdostup: json['tipdostup'] as String?,
      language: json['language'] as String,
      tip: json['tip'] as int,
      paswword: json['paswword'] as String?,
      card: (json['card'] as List<dynamic>?)
              ?.map((e) => CardModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <CardModel>[],
    );

Map<String, dynamic> _$$_CreateUserModelToJson(_$_CreateUserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'login': instance.login,
      'fio': instance.fio,
      'pin': instance.pin,
      'tipdostup': instance.tipdostup,
      'language': instance.language,
      'tip': instance.tip,
      'paswword': instance.paswword,
      'card': instance.card,
    };
