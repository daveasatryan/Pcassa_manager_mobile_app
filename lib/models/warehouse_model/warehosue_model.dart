import 'package:freezed_annotation/freezed_annotation.dart';

part 'warehosue_model.freezed.dart';

part 'warehosue_model.g.dart';

@freezed
class WarehouseModel with _$WarehouseModel {
  factory WarehouseModel({
    required int cod,
    required String name,
  }) = _WarehouseModel;

  factory WarehouseModel.fromJson(Map<String, dynamic> json) =>
      _$WarehouseModelFromJson(json);
}
