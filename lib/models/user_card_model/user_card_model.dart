import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_card_model.freezed.dart';

part 'user_card_model.g.dart';

@freezed
class CardModel with _$CardModel {
  factory CardModel({
    required String cod,
     String? shtrix,
  }) = _CardModel;

  factory CardModel.fromJson(Map<String, dynamic> json) =>
      _$CardModelFromJson(json);
}
