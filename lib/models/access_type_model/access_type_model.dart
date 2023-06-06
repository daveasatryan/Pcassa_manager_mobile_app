import 'package:freezed_annotation/freezed_annotation.dart';

part 'access_type_model.freezed.dart';

part 'access_type_model.g.dart';

@freezed
class AccessTypeModel with _$AccessTypeModel {
  factory AccessTypeModel({
   
    required int id,
    required String name,
  }) = _AccessTypeModel;

  factory AccessTypeModel.fromJson(Map<String, dynamic> json) =>
      _$AccessTypeModelFromJson(json);
}
