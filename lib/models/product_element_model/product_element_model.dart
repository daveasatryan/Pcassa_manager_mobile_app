import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_element_model.freezed.dart';

part 'product_element_model.g.dart';

@freezed
class ProductElementModel with _$ProductElementModel {
  factory ProductElementModel({
    required String guid,
    @Default(false) bool top,
    @Default(0) double price_o_r,
    @Default(0) double price_o_o,
    String? name,
    String? gguid,
    String? linkfoto,
    String? kat_tov,
    String? kod_tov,
    String? description,
    String? ed_izm,
    String? barcode,
    String? barcode_grupp,
    int? priznak_sk,
    String? adg,
    String? kname,
    int? komplekt_id,
    bool? status,
     bool? excise,
  }) = _ProductElementModel;

  factory ProductElementModel.fromJson(Map<String, dynamic> json) =>
      _$ProductElementModelFromJson(json);
}
