import 'package:mobx/mobx.dart';
import 'package:pcassa_retail/models/kont_balance_item_model/kont_balance_item_model.dart';
import 'package:pcassa_retail/models/kont_balance_model/kont_balance_model.dart';
import 'package:pcassa_retail/requests_settings/repositories/services_repository/services_repository.dart';

part 'kont_balance_state.g.dart';

//State for Autorisation
class KontBalanceState = KontBalanceStateBase with _$KontBalanceState;

abstract class KontBalanceStateBase with Store {
  @observable
  ObservableList<KontBalanceItemModel> kontDocsList =
      ObservableList<KontBalanceItemModel>();
  @observable
  int? endostatok;
  @observable
  int? nachostatok;
  @observable
  int? summaitems;

  @action
  getContragentReports({
    required String name,
    required String data_s,
    required String data_e,
  }) async {
    final result = await ServicesResponsitorie.getContragentBalance(
      data_e: data_s,
      data_s: data_e,
      name: name,
    );
    kontDocsList = result.items.asObservable();
    nachostatok = result.nachost;
    endostatok = result.endost;
    summaitems = result.sumitems;
  }
}
