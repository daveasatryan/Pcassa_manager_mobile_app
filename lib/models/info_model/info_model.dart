import 'package:freezed_annotation/freezed_annotation.dart';



part 'info_model.freezed.dart';
part 'info_model.g.dart';

@freezed
class InfoModel with _$InfoModel {
  factory InfoModel({
    required int id,
    required String name,
    required String adress,
    required String tel,
    required String mail,
    required String prim,
  }) = _InfoModel;

  InfoModel._();

  factory InfoModel.fromJson(Map<String, dynamic> json) =>
      _$InfoModelFromJson(json);


}
