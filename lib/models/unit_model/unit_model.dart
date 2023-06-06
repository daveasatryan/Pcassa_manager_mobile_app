import 'package:freezed_annotation/freezed_annotation.dart';

part 'unit_model.freezed.dart';

part 'unit_model.g.dart';

@freezed
class UnitModel with _$UnitModel {
  factory UnitModel({
   
    required String guid,
    required String name,
  }) = _UnitModel;

  factory UnitModel.fromJson(Map<String, dynamic> json) =>
      _$UnitModelFromJson(json);
}
