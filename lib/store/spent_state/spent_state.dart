import 'package:mobx/mobx.dart';
import 'package:pcassa_retail/models/spent_model/spent_model.dart';

import '../../requests_settings/repositories/services_repository/services_repository.dart';
part 'spent_state.g.dart';

class SpentState = SpentStateBase with _$SpentState;

abstract class SpentStateBase with Store {
  //Product unit List
  @observable
  ObservableList<SpentModel> spentList = ObservableList<SpentModel>();
  @observable
  ObservableList<String> spentListNames = ObservableList<String>();

//Get spent
  @action
  getSpent() async {
    final result = await ServicesResponsitorie.getSpent();
    spentList = result.asObservable();
  }

  @action
  getSpentNames() {
    spentListNames.add("notSelected");
    for (var i = 0; i < spentList.length; i++) {
      spentListNames.add(spentList[i].name);
    }
  }

//Post spent
  @action
  postSpent({required int id, required String name}) async {
    final result = await ServicesResponsitorie.postSpent(name: name, id: id);
    spentList = result.asObservable();
  }

//Delete spent
  @action
  delSpent({required id}) async {
    final result = await ServicesResponsitorie.delSpent(id: id);
    spentList = result.asObservable();
  }
}
