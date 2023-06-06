import 'package:freezed_annotation/freezed_annotation.dart';

part 'contragent_group_model.freezed.dart';

part 'contragent_group_model.g.dart';

@freezed
class ContragentGroupModel with _$ContragentGroupModel {
  factory ContragentGroupModel({
    required String guid,
    required int isroot,
    required int haschildren,
    required String parentguid,
    required String caption,
  }) = _ContragentGroupModel;
  const ContragentGroupModel._();
  factory ContragentGroupModel.fromJson(Map<String, dynamic> json) =>
      _$ContragentGroupModelFromJson(json);
}
