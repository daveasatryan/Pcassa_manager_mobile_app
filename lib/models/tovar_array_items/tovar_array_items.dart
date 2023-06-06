import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tovar_array_items.freezed.dart';
part 'tovar_array_items.g.dart';

@unfreezed
class TovarArrayItems with _$TovarArrayItems {
  factory TovarArrayItems({
    required int id,
    required int id_d,
    required int typ_d,
    required String kod_tov,
    required String name,
    required double kol,
    required String ed_izm,
    double? cena_p,
    double? cena_o,
    double? summa_p,
    double? summa_o,
    String? barcode,
    double? price,
    double? summa_price,
    int? skidka,
    String? tip_skidki,
    double? pr_ras,
    double? cena_v,
    double? summa_v,
    int? idd_rn,
    int? rn,
    String? spis,
    String? data_pr,
    int? kd,
    String? data_sr,
    int? nds,
    double? cena_nds,
    double? summa_nds,
    double? cena_bez_nds,
    double? summa_bez_nds,
    double? cena_nds_prixoda,
    double? summa_nds_prixoda,
   
  }) = _TovarArrayItems;

  factory TovarArrayItems.fromJson(Map<String, dynamic> json) =>
      _$TovarArrayItemsFromJson(json);
}
