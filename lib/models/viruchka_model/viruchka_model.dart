import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pcassa_retail/models/viruchka_items_model/viruchka_items_model.dart';

part 'viruchka_model.freezed.dart';

part 'viruchka_model.g.dart';

@freezed
class ViruchkaModel with _$ViruchkaModel {
  factory ViruchkaModel({
    int? group_id,
    int? orderid,
    int? saleprice,
    int? paidamount,
    int? paidamountcard,
    int? deptamount,
    String? chequenumber,
    String? waiter_name,
    String? created_at,
    String? paymentdate,
    List<ViruchkaItemModel>? items,
  }) = _ViruchkaModel;

  factory ViruchkaModel.fromJson(Map<String, dynamic> json) =>
      _$ViruchkaModelFromJson(json);
}
