import 'package:freezed_annotation/freezed_annotation.dart';

part 'contragent_items_model.freezed.dart';

part 'contragent_items_model.g.dart';

@freezed
class ContragentItemsModel with _$ContragentItemsModel {
  factory ContragentItemsModel({
    String? guid,
    String? name,
    String? description,
    String? kod,
    String? yur_adres,
    String? gguid,
    String? post_adres,
    String? tel,
    String? full_name,
    String? inn,
    String? kpp,
    String? rshet,
    String? kshet,
    String? bik,
    String? bank_name,
    String? prim,
    String? contact_litso,
    String? kredit,
    bool? fixsum,
  }) = _ContragentItemsModel;

  factory ContragentItemsModel.fromJson(Map<String, dynamic> json) =>
      _$ContragentItemsModelFromJson(json);
}
