import 'package:freezed_annotation/freezed_annotation.dart';

import '../product_category_model/product_category_model.dart';
import '../product_element_model/product_element_model.dart';

part 'product_model.freezed.dart';

part 'product_model.g.dart';

@freezed
class ProductModel with _$ProductModel {
  factory ProductModel({
    required List<ProductCategoryModel> category,
    required List<ProductElementModel> menu,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}
