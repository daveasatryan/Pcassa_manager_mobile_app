// ignore_for_file: file_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'remainder_model.freezed.dart';

part 'remainder_model.g.dart';

@freezed
class RemainderItemsModel with _$RemainderItemsModel {
  factory RemainderItemsModel(
      {required String kod_tov,
      required String barcode,
      required String name,
      required String ed_izm,
      required int quantity,
      required int price_o_r,
      required int price_s,
      required String sklname}) = _RemainderItemsModel;

  factory RemainderItemsModel.fromJson(Map<String, dynamic> json) =>
      _$RemainderItemsModelFromJson(json);
}
