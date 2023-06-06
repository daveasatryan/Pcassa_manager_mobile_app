import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_access_model.freezed.dart';

part 'user_access_model.g.dart';

@freezed
class UserAccessModel with _$UserAccessModel {
  factory UserAccessModel({
    @Default([]) List<String?> settingsaccess,
    @Default([]) List<String?> productgroupaccess,
  }) = _UserAccessModel;

  factory UserAccessModel.fromJson(Map<String, dynamic> json) =>
      _$UserAccessModelFromJson(json);
}
