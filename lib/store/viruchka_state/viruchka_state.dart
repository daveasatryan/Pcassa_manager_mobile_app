import 'package:mobx/mobx.dart';
import 'package:pcassa_retail/models/viruchka_model/viruchka_model.dart';
import 'package:pcassa_retail/requests_settings/repositories/services_repository/services_repository.dart';
part 'viruchka_state.g.dart';

class ViruchkaState = ViruchkaStateBase with _$ViruchkaState;

abstract class ViruchkaStateBase with Store {
  @observable
  ObservableList<ViruchkaModel> listOfViruchka =
      ObservableList<ViruchkaModel>();
  @observable
  int debt = 0;
  @observable
  int cash = 0;
  @observable
  int noCash = 0;
  @observable
  int summary = 0;

  //Get units
  @action
  getViruchka({
    required String chequenumber,
    required String data_e,
    required String order_by,
    required String n_smena,
    required String data_s,
    required String waiter_name,
  }) async {
    final result = await ServicesResponsitorie.getViruchka(
        chequenumber: chequenumber,
        data_e: data_e,
        order_by: order_by,
        n_smena: n_smena,
        data_s: data_s,
        waiter_name: waiter_name);
    listOfViruchka = result.asObservable();
  }

  @action
  makeSummary() {
    debt = 0;

    cash = 0;

    noCash = 0;

    summary = 0;
    for (int i = 0; i < listOfViruchka.length; i++) {
      summary = summary + listOfViruchka[i].saleprice!;
      debt = debt + listOfViruchka[i].deptamount!;
      noCash = noCash + listOfViruchka[i].paidamountcard!;
      cash = cash + listOfViruchka[i].paidamount!;
    }
  }
}
