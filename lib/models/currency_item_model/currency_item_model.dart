// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'currency_item_model.g.dart';
part 'currency_item_model.freezed.dart';

@freezed
class CurrencyItemModel with _$CurrencyItemModel {
  factory CurrencyItemModel({
    required int cod,
    required String gguid,
    required String name,
    required String short_name,
    required int status,
    required int b_valyuta,
    required double metod_round,
    required int tip,
    required int tip_oplati,
    required int spisanie,
    @Default("null") String? linkfoto,
  }) = _CurrencyItemModel;

  factory CurrencyItemModel.fromJson(Map<String, dynamic> json) =>
      _$CurrencyItemModelFromJson(json);
}
