import 'package:mobx/mobx.dart';
import 'package:pcassa_retail/models/currency_item_model/currency_item_model.dart';
import 'package:pcassa_retail/requests_settings/repositories/services_repository/services_repository.dart';

import '../../models/currency_model/currency_model.dart';
part 'currency_state.g.dart';

class CreatedCurrencys = CreatedCurrencysBase with _$CreatedCurrencys;

abstract class CreatedCurrencysBase with Store {
  @observable
  ObservableList<CurrencyModel> currencyInfo = ObservableList<CurrencyModel>();
  @observable
  ObservableList<String> currencyShortNames = ObservableList<String>();

  //Get Currency
  @action
  Future<void> getCreatedCurencys() async {
    final result = await ServicesResponsitorie.getCreatedCurrenyc();
    currencyInfo = result.asObservable();
  }

  @action
  Future<void> updateCurencys(
      {required cod,
      required gguid,
      required name,
      required short_name,
      required tip,
      required tip_oplati,
      required b_valyuta,
      required status,
      required spisanie,
      required method_round}) async {
    final result = await ServicesResponsitorie.saveCurrencys(
      b_valyuta: b_valyuta,
      cod: cod,
      gguid: gguid,
      metod_round: method_round,
      name: name,
      short_name: short_name,
      spisanie: spisanie,
      status: status,
      tip: tip,
      tip_oplati: tip_oplati,
    );
    currencyInfo = result.asObservable();
  }

  //Currency delete
  @action
  Future<void> deleteCurrency({required cod}) async {
    final result = await ServicesResponsitorie.deleteCurrencys(code: cod);
  }

  @action
  getShortNames() {
    currencyShortNames.add("notSelected");

    for (int i = 0; i < currencyInfo.length; i++) {
      if (currencyInfo[i].items.isNotEmpty) {
        for (int j = 0; j < currencyInfo[i].items.length; j++) {
          currencyShortNames.add(currencyInfo[i].items[j].short_name);
        }
      }
    }
  }
}
