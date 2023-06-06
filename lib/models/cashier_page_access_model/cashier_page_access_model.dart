import 'package:freezed_annotation/freezed_annotation.dart';

import '../access_pageaccess_model/access_pageaccess_model.dart';

part 'cashier_page_access_model.freezed.dart';

part 'cashier_page_access_model.g.dart';

@freezed
class CashierPageAccessModel with _$CashierPageAccessModel {
  factory CashierPageAccessModel({
    @Default(<AccessPageAccessModel>[])
        List<AccessPageAccessModel> TablesScreen,
    @Default(<AccessPageAccessModel>[]) List<AccessPageAccessModel> quick_check,
  }) = _CashierPageAccessModel;

  factory CashierPageAccessModel.fromJson(Map<String, dynamic> json) =>
      _$CashierPageAccessModelFromJson(json);
}
