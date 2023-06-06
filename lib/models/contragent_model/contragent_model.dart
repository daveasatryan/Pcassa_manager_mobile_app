// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pcassa_retail/models/contragent_group_model/contragent_group_model.dart';
import 'package:pcassa_retail/models/contragent_items_model/contragent_items_model.dart';

part 'contragent_model.freezed.dart';

part 'contragent_model.g.dart';

@freezed
class ContragentModel with _$ContragentModel {
  factory ContragentModel({
    required List<ContragentGroupModel> gruppakor,
    required List<ContragentItemsModel> sprkor,
  }) = _ContragentModel;

  factory ContragentModel.fromJson(Map<String, dynamic> json) =>
      _$ContragentModelFromJson(json);
}
