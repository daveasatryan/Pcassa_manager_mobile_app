import 'package:freezed_annotation/freezed_annotation.dart';

import '../user_access_model/user_access_model.dart';

part 'user_model.freezed.dart';

part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  factory UserModel({
    required int id,
    required String login,
    required String fio,
    required String language,
    required UserAccessModel dostup,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
