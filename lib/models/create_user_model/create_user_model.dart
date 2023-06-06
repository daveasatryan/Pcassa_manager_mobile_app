import 'package:freezed_annotation/freezed_annotation.dart';

import '../user_card_model/user_card_model.dart';
part 'create_user_model.freezed.dart';
part 'create_user_model.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class CreateUserModel with _$CreateUserModel {
  factory CreateUserModel({
    required int id,
    required String login,
    required String fio,
    required int pin,
    String? tipdostup,
    required String language,
    required int tip,
    String? paswword,
    @Default(<CardModel>[]) List<CardModel> card,
  }) = _CreateUserModel;

  factory CreateUserModel.fromJson(Map<String, dynamic> json) =>
      _$CreateUserModelFromJson(json);
}
