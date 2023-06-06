import 'package:freezed_annotation/freezed_annotation.dart';

part 'cash_order_model.freezed.dart';

part 'cash_order_model.g.dart';

@freezed
class CashOrderModel with _$CashOrderModel {
  factory CashOrderModel({
    int? id,
    String? n_dok,
    String? data_d,
    int? typ_d,
    int? summa,
    int? id_osn,
    int? t_osn,
    String? prim,
    int? kodpost,
    String? namepost,
    String? val,
    int? aktiv,
    double? kurs,
    int? summa_v,
    double? pr_kassa,
    int? id_vidkas,
  }) = _CashOrderModel;

  factory CashOrderModel.fromJson(Map<String, dynamic> json) =>
      _$CashOrderModelFromJson(json);
}
