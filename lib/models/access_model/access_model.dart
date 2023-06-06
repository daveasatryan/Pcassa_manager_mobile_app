import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pcassa_retail/models/cashier_page_access_model/cashier_page_access_model.dart';

import '../manager_page_access_model/manager_page_access_model.dart';

part 'access_model.freezed.dart';

part 'access_model.g.dart';

@freezed
class AccessModel with _$AccessModel {
  factory AccessModel({
    required CashierPageAccessModel kassa,
    required ManagerPageAccessModel mananger,
  }) = _AccessModel;

  factory AccessModel.fromJson(Map<String, dynamic> json) =>
      _$AccessModelFromJson(json);
}
