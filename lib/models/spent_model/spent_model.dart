import 'package:freezed_annotation/freezed_annotation.dart';

part 'spent_model.freezed.dart';

part 'spent_model.g.dart';

@freezed
class SpentModel with _$SpentModel {
  factory SpentModel({
   
    required int id,
    required String name,
  }) = _SpentModel;

  factory SpentModel.fromJson(Map<String, dynamic> json) =>
      _$SpentModelFromJson(json);
}
