
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pcassa_retail/models/remainder_model/remainder_model.dart';

part 'remainder_item_model.freezed.dart';

part 'remainder_item_model.g.dart';

@freezed
class RemainderItemListModel with _$RemainderItemListModel {
  factory RemainderItemListModel(
      {
        required List<RemainderItemsModel> items,
      }) = _RemainderItemListModel;

  factory RemainderItemListModel.fromJson(Map<String, dynamic> json) =>
      _$RemainderItemListModelFromJson(json);
}
