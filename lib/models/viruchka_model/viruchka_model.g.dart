// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'viruchka_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ViruchkaModel _$$_ViruchkaModelFromJson(Map<String, dynamic> json) =>
    _$_ViruchkaModel(
      group_id: json['group_id'] as int?,
      orderid: json['orderid'] as int?,
      saleprice: json['saleprice'] as int?,
      paidamount: json['paidamount'] as int?,
      paidamountcard: json['paidamountcard'] as int?,
      deptamount: json['deptamount'] as int?,
      chequenumber: json['chequenumber'] as String?,
      waiter_name: json['waiter_name'] as String?,
      created_at: json['created_at'] as String?,
      paymentdate: json['paymentdate'] as String?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => ViruchkaItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ViruchkaModelToJson(_$_ViruchkaModel instance) =>
    <String, dynamic>{
      'group_id': instance.group_id,
      'orderid': instance.orderid,
      'saleprice': instance.saleprice,
      'paidamount': instance.paidamount,
      'paidamountcard': instance.paidamountcard,
      'deptamount': instance.deptamount,
      'chequenumber': instance.chequenumber,
      'waiter_name': instance.waiter_name,
      'created_at': instance.created_at,
      'paymentdate': instance.paymentdate,
      'items': instance.items,
    };
