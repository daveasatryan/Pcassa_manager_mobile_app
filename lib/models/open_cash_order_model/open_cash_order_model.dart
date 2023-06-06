import 'package:freezed_annotation/freezed_annotation.dart';

part 'open_cash_order_model.freezed.dart';

part 'open_cash_order_model.g.dart';

@freezed
class OpenCashOrderModel with _$OpenCashOrderModel {
  factory OpenCashOrderModel({
    int? id,
    int? typ_d,
    String? tip_name,
    String? n_dok,
    String? data_d,
    String? kontname,
    int? kodpost,
    String? prim,
    int? id_vidkas,
    String? kassname,
    int? summa,
   
  }) = _OpenCashOrderModel;

  factory OpenCashOrderModel.fromJson(Map<String, dynamic> json) =>
      _$OpenCashOrderModelFromJson(json);
}
