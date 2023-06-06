import 'package:freezed_annotation/freezed_annotation.dart';

import '../currency_item_model/currency_item_model.dart';

part 'currency_model.freezed.dart';
part 'currency_model.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class CurrencyModel with _$CurrencyModel {
  factory CurrencyModel({
    required String guid,
    required String caption,
    required List<CurrencyItemModel> items,
  }) = _CurrencyModel;

  factory CurrencyModel.fromJson(Map<String, dynamic> json) =>
      _$CurrencyModelFromJson(json);
}
