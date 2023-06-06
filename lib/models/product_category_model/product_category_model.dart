import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_category_model.freezed.dart';

part 'product_category_model.g.dart';

@freezed
class ProductCategoryModel with _$ProductCategoryModel {
  factory ProductCategoryModel({
    required String guid,
    required int isroot,
    required int haschildren,
    required String parentguid,
    required String caption,
  }) = _ProductCategoryModel;
  const ProductCategoryModel._();
  factory ProductCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$ProductCategoryModelFromJson(json);
}
