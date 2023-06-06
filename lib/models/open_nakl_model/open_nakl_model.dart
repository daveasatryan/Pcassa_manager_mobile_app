import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pcassa_retail/models/naklinfo_items_model/naklinfo_items_model.dart';
import 'package:pcassa_retail/models/tovar_arrays/tovar_arrays.dart';

import '../tovar_array_items/tovar_array_items.dart';

part 'open_nakl_model.freezed.dart';

part 'open_nakl_model.g.dart';

@freezed
class OpenNaklModel with _$OpenNaklModel {
  factory OpenNaklModel({
    required NaklInfoItemsModel naklinfo,
    required List<TovarArrayItems> tovar,
  }) = _OpenNaklModel;

  factory OpenNaklModel.fromJson(Map<String, dynamic> json) =>
      _$OpenNaklModelFromJson(json);
}
