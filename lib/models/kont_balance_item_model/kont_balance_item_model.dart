import 'package:freezed_annotation/freezed_annotation.dart';

part 'kont_balance_item_model.freezed.dart';
part 'kont_balance_item_model.g.dart';

@freezed
class KontBalanceItemModel with _$KontBalanceItemModel {
  factory KontBalanceItemModel({
    String? tip,
    int? amount,
  }) = _KontBalanceItemModel;

  factory KontBalanceItemModel.fromJson(Map<String, dynamic> json) =>
      _$KontBalanceItemModelFromJson(json);
}
