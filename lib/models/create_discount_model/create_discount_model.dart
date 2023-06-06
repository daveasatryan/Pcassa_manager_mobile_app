import 'package:freezed_annotation/freezed_annotation.dart';

import '../create_discoutn_items_model/create_discount_items_model.dart';

part 'create_discount_model.freezed.dart';
part 'create_discount_model.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class GetDiscountsModel with _$GetDiscountsModel {
  factory GetDiscountsModel({
    required int id,
    required String name,
    String? linkfoto,
    required List<DiscountItemsModel> items,
  }) = _GetDiscountsModel;

  factory GetDiscountsModel.fromJson(Map<String, dynamic> json) =>
      _$GetDiscountsModelFromJson(json);
}
