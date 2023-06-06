import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pcassa_retail/models/kont_balance_item_model/kont_balance_item_model.dart';

part 'kont_balance_model.freezed.dart';
part 'kont_balance_model.g.dart';

@freezed
class KontBalanceModel with _$KontBalanceModel {
  factory KontBalanceModel({
    int? sumitems,
    int? nachost,
    @Default([]) List<KontBalanceItemModel> items,
    int? endost,
  }) = _KontBalanceModel;

  factory KontBalanceModel.fromJson(Map<String, dynamic> json) =>
      _$KontBalanceModelFromJson(json);
}
