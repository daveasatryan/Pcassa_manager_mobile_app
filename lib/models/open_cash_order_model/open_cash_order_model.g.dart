// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'open_cash_order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OpenCashOrderModel _$$_OpenCashOrderModelFromJson(
        Map<String, dynamic> json) =>
    _$_OpenCashOrderModel(
      id: json['id'] as int?,
      typ_d: json['typ_d'] as int?,
      tip_name: json['tip_name'] as String?,
      n_dok: json['n_dok'] as String?,
      data_d: json['data_d'] as String?,
      kontname: json['kontname'] as String?,
      kodpost: json['kodpost'] as int?,
      prim: json['prim'] as String?,
      id_vidkas: json['id_vidkas'] as int?,
      kassname: json['kassname'] as String?,
      summa: json['summa'] as int?,
    );

Map<String, dynamic> _$$_OpenCashOrderModelToJson(
        _$_OpenCashOrderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'typ_d': instance.typ_d,
      'tip_name': instance.tip_name,
      'n_dok': instance.n_dok,
      'data_d': instance.data_d,
      'kontname': instance.kontname,
      'kodpost': instance.kodpost,
      'prim': instance.prim,
      'id_vidkas': instance.id_vidkas,
      'kassname': instance.kassname,
      'summa': instance.summa,
    };
