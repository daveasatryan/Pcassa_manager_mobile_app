import 'package:mobx/mobx.dart';
import 'package:pcassa_retail/models/cashorders/cash_order_model.dart';
import 'package:pcassa_retail/models/open_cash_order_model/open_cash_order_model.dart';
import 'package:pcassa_retail/requests_settings/repositories/services_repository/services_repository.dart';


part 'cash_order_state.g.dart';

class CashOrderState = CashOrderStateBase with _$CashOrderState;

abstract class CashOrderStateBase with Store {
  @observable
  CashOrderModel? resultCashOrderModel;
  @observable
  ObservableList<OpenCashOrderModel> resultCashOrder =
      ObservableList<OpenCashOrderModel>();

  //Get Cash orders
  @action
  Future<void> createCahsOrderDocument(
      {required CashOrderModel cashOrderModel}) async {
    final result = await ServicesResponsitorie.createCahsOrderDocument(
        cashOrderModel: cashOrderModel);
    resultCashOrderModel = result;
  }

  @action
  getCashOrdersByFilter({
    String? n_dok,
    String? data_s,
    String? data_e,
    String? tip_name,
    String? kontname,
    String? kassname,
  }) async {
    final result = await ServicesResponsitorie.getRkoPkoByFilter(
      n_dok: n_dok,
      data_s: data_s,
      data_e: data_e,
      tip_name: tip_name,
      kontname: kontname,
      kassname: kassname,
    );
    resultCashOrder.clear();
    for (int i = 0; i < result.length; i++) {
      resultCashOrder.add(result[i]);
    }
  }

  @action
  delteCashOrdersByFilter({
    int? id,
    String? n_dok,
    String? data_s,
    String? data_e,
    String? tip_name,
    String? kontname,
    String? kassname,
  }) async {
    final result = await ServicesResponsitorie.deleteRkoPko(
      id: id,
      n_dok: n_dok,
      data_s: data_s,
      data_e: data_e,
      tip_name: tip_name,
      kontname: kontname,
      kassname: kassname,
    );
    resultCashOrder.clear();
    resultCashOrder = result.asObservable();
  }

  @action
  openDocument({required int id}) async {
    final result = await ServicesResponsitorie.openRkoPko(id: id);
    resultCashOrderModel = result;
  }
}
