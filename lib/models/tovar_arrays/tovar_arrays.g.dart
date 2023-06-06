// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tovar_arrays.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TovarArray _$$_TovarArrayFromJson(Map<String, dynamic> json) =>
    _$_TovarArray(
      tovarArrays: (json['tovarArrays'] as List<dynamic>?)
              ?.map((e) => TovarArrayItems.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_TovarArrayToJson(_$_TovarArray instance) =>
    <String, dynamic>{
      'tovarArrays': instance.tovarArrays,
    };
