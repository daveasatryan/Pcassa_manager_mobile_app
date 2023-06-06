import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pcassa_retail/models/search_by_name_model/search_by_name_model.dart';

part 'search_model.freezed.dart';

part 'search_model.g.dart';

@freezed
class SearchModel with _$SearchModel {
  factory SearchModel({
    @Default(<SearchByNameModel>[]) List<SearchByNameModel> searchModelItems,
  }) = _SearchModel;

  factory SearchModel.fromJson(Map<String, dynamic> json) =>
      _$SearchModelFromJson(json);
}
