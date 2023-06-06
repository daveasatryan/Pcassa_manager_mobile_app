import 'package:freezed_annotation/freezed_annotation.dart';

part 'viruchka_items_model.freezed.dart';

part 'viruchka_items_model.g.dart';

@freezed
class ViruchkaItemModel with _$ViruchkaItemModel {
  factory ViruchkaItemModel({
    int? id,
    int? quantity,
    int? saleprice,
    int? realprice,
    String? productcode,
    String? productname,
    int? flag,
  }) = _ViruchkaItemModel;

  factory ViruchkaItemModel.fromJson(Map<String, dynamic> json) =>
      _$ViruchkaItemModelFromJson(json);
}
