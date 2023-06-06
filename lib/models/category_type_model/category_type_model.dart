import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_type_model.freezed.dart';

part 'category_type_model.g.dart';

@freezed
class CategorytypeModel with _$CategorytypeModel {
  factory CategorytypeModel({
   
    required String guid,
    required String name,
  }) = _CategorytypeModel;

  factory CategorytypeModel.fromJson(Map<String, dynamic> json) =>
      _$CategorytypeModelFromJson(json);
}
