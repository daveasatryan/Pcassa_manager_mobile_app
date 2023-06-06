// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductCategoryModel _$$_ProductCategoryModelFromJson(
        Map<String, dynamic> json) =>
    _$_ProductCategoryModel(
      guid: json['guid'] as String,
      isroot: json['isroot'] as int,
      haschildren: json['haschildren'] as int,
      parentguid: json['parentguid'] as String,
      caption: json['caption'] as String,
    );

Map<String, dynamic> _$$_ProductCategoryModelToJson(
        _$_ProductCategoryModel instance) =>
    <String, dynamic>{
      'guid': instance.guid,
      'isroot': instance.isroot,
      'haschildren': instance.haschildren,
      'parentguid': instance.parentguid,
      'caption': instance.caption,
    };
