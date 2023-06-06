// ignore_for_file: file_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_discount_items_model.freezed.dart';

part 'create_discount_items_model.g.dart';

@freezed
class DiscountItemsModel with _$DiscountItemsModel {
 
  factory DiscountItemsModel({
    required int id,
    required String name,
    required String tip,
    required int val,
    required int status,
    required String rejim,
  }) = _DiscountItemsModel;





  factory DiscountItemsModel.fromJson(Map<String, dynamic> json) =>
      _$DiscountItemsModelFromJson(json);
}
