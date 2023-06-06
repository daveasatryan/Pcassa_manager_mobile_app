import 'package:freezed_annotation/freezed_annotation.dart';

part 'oborot_vedom_model.freezed.dart';

part 'oborot_vedom_model.g.dart';

@freezed
class OborotVedomModel with _$OborotVedomModel {
  factory OborotVedomModel(
      {String? kod_tov,
      String? barcode,
      String? name,
      String? ed_izm,
      int? quantity_nach,
      int? quantity_pr,
      int? quantity_rx,
      int? quantity_vp,
      int? quantity_vt,
      int? quantity_vtp,
      int? quantity_spis,
      int? quantity_inv,
      int? quantity_ost,
      String? skl1name}) = _OborotVedomModell;

  factory OborotVedomModel.fromJson(Map<String, dynamic> json) =>
      _$OborotVedomModelFromJson(json);
}
