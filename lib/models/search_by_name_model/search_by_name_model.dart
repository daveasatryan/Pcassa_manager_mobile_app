import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_by_name_model.freezed.dart';

part 'search_by_name_model.g.dart';

@freezed
class SearchByNameModel with _$SearchByNameModel {
  factory SearchByNameModel(
      { String? kod_tov,
       String? barcode,
       String? barcode_grupp,
       String? name,
       String? ed_izm,
       int? price_o_r,
       int? price_o_o,
       int? price_s,
       bool? excise}) = _SearchByNameModel;

  factory SearchByNameModel.fromJson(Map<String, dynamic> json) =>
      _$SearchByNameModelFromJson(json);
}
