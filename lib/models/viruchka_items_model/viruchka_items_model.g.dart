// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'viruchka_items_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ViruchkaItemModel _$$_ViruchkaItemModelFromJson(Map<String, dynamic> json) =>
    _$_ViruchkaItemModel(
      id: json['id'] as int?,
      quantity: json['quantity'] as int?,
      saleprice: json['saleprice'] as int?,
      realprice: json['realprice'] as int?,
      productcode: json['productcode'] as String?,
      productname: json['productname'] as String?,
      flag: json['flag'] as int?,
    );

Map<String, dynamic> _$$_ViruchkaItemModelToJson(
        _$_ViruchkaItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'quantity': instance.quantity,
      'saleprice': instance.saleprice,
      'realprice': instance.realprice,
      'productcode': instance.productcode,
      'productname': instance.productname,
      'flag': instance.flag,
    };
