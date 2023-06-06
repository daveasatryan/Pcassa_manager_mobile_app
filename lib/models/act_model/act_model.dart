import 'package:freezed_annotation/freezed_annotation.dart';

part 'act_model.freezed.dart';

part 'act_model.g.dart';

@freezed
class ActModel with _$ActModel {
  factory ActModel(
      {int? id,
      String? n_dok,
      String? data_d,
      int? typ_d,
      double? summa,
      int? id_osn,
      int? t_osn,
      String? prim,
      int? kodpost,
      String? namepost,
      String? val,
      int? aktiv,
      double? kurs,
      double? summa_val,
      int? kodzatrat,
      String? namezatrat,
      String? srok_oplati}) = _ActModel;

  factory ActModel.fromJson(Map<String, dynamic> json) =>
      _$ActModelFromJson(json);
}
