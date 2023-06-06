// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductModel _$$_ProductModelFromJson(Map<String, dynamic> json) =>
    _$_ProductModel(
      category: (json['category'] as List<dynamic>)
          .map((e) => ProductCategoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      menu: (json['menu'] as List<dynamic>)
          .map((e) => ProductElementModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ProductModelToJson(_$_ProductModel instance) =>
    <String, dynamic>{
      'category': instance.category,
      'menu': instance.menu,
    };
