
import 'package:freezed_annotation/freezed_annotation.dart';

part 'act_realisation_model.freezed.dart';

part 'act_realisation_model.g.dart';

@freezed
class ActRealisationModel with _$ActRealisationModel {
  factory ActRealisationModel(
      {
        String? kod_tov,
      String? barcode,
      String? name,
      String? ed_izm,
      int? summa_o,
      int? summa_p,
      int? nacenka,
      int? nacenka_tokos,
      String? skl1name
      }) = _ActRealisationModel;

  factory ActRealisationModel.fromJson(Map<String, dynamic> json) =>
      _$ActRealisationModelFromJson(json);
}
