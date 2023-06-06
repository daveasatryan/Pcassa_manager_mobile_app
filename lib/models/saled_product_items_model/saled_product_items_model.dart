import 'package:freezed_annotation/freezed_annotation.dart';

part 'saled_product_items_model.freezed.dart';
part 'saled_product_items_model.g.dart';

@freezed
class SaledItemsModel with _$SaledItemsModel {
  factory SaledItemsModel({
    int? quantity,
    int? amount,
    int? saleprice,
    String? kod_tov,
    String? barcode,
    String? name,
    String? edizm,
  }) = _SaledItemsModel;

  factory SaledItemsModel.fromJson(Map<String, dynamic> json) =>
      _$SaledItemsModelFromJson(json);
}
