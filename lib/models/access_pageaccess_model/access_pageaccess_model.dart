import 'package:freezed_annotation/freezed_annotation.dart';

part 'access_pageaccess_model.freezed.dart';

part 'access_pageaccess_model.g.dart';

@unfreezed
class AccessPageAccessModel with _$AccessPageAccessModel {
  factory AccessPageAccessModel({
    String? name,
    bool? status,

  
  }) = _AccessPageAccessModel;

  factory AccessPageAccessModel.fromJson(Map<String, dynamic> json) =>
      _$AccessPageAccessModelFromJson(json);

      
}
