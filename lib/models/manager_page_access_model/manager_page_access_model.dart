import 'package:freezed_annotation/freezed_annotation.dart';

import '../access_pageaccess_model/access_pageaccess_model.dart';

part 'manager_page_access_model.freezed.dart';

part 'manager_page_access_model.g.dart';

@freezed
class ManagerPageAccessModel with _$ManagerPageAccessModel {
  factory ManagerPageAccessModel({
    @Default(<AccessPageAccessModel>[])
        List<AccessPageAccessModel> productgroupaccess,
    @Default(<AccessPageAccessModel>[])
        List<AccessPageAccessModel> settingsaccess,
  }) = _ManagerPageAccessModel;

  factory ManagerPageAccessModel.fromJson(Map<String, dynamic> json) =>
      _$ManagerPageAccessModelFromJson(json);
}
