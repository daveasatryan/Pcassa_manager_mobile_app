import 'package:freezed_annotation/freezed_annotation.dart';

part 'naklinfo_items_model.freezed.dart';
part 'naklinfo_items_model.g.dart';

@unfreezed
class NaklInfoItemsModel with _$NaklInfoItemsModel {
  factory NaklInfoItemsModel(
      {int? id,
      int? typ_d,
      String? n_dok,
      String? data_d,
      int? kodpost,
      String? namepost,
      int? skl1,
      int? skl2,
      String? skl1name,
      String? skl2name,
      String? srok_oplati,
      String? prim,
      int? aktiv,
      String? val,
      int? skidka,
      String? tip_skidki,
      String? contact_litso,
      double? kurs,
      double? pr_ras}) = _NaklInfoItemsModel;

  factory NaklInfoItemsModel.fromJson(Map<String, dynamic> json) =>
      _$NaklInfoItemsModelFromJson(json);
}
