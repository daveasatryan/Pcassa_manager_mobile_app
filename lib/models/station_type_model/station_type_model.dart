import 'package:freezed_annotation/freezed_annotation.dart';

part 'station_type_model.freezed.dart';

part 'station_type_model.g.dart';

@freezed
class StationTypeModel with _$StationTypeModel {
  factory StationTypeModel({
    required int? id,
    required String? name,
    required String? rshet,
    required String? prim
  }) = _StationTypeModel;

  factory StationTypeModel.fromJson(Map<String, dynamic> json) =>
      _$StationTypeModelFromJson(json);
}
