import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pcassa_retail/models/saled_product_items_model/saled_product_items_model.dart';

part 'saled_product_model.freezed.dart';

part 'saled_product_model.g.dart';

@freezed
class SaledProductModel with _$SaledProductModel {
  factory SaledProductModel({
    int? summa,
    List<SaledItemsModel>? items,
  }) = _SaledProductModel;

  factory SaledProductModel.fromJson(Map<String, dynamic> json) =>
      _$SaledProductModelFromJson(json);
}
