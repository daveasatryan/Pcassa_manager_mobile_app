import 'package:mobx/mobx.dart';
import 'package:pcassa_retail/models/access_type_model/access_type_model.dart';

import '../../models/access_model/access_model.dart';
import '../../requests_settings/repositories/services_repository/services_repository.dart';

part 'access_state.g.dart';

//State for Autorisation
class AccessState = AccessStateBase with _$AccessState;

abstract class AccessStateBase with Store {
//Access type list
  @observable
  ObservableList<AccessTypeModel> accessTypesList =
      ObservableList<AccessTypeModel>();

  //Access configCategory list
  @observable
  AccessModel? configCategoty;

  //Get accesstypes
  getAcessTypes() async {
    final result = await ServicesResponsitorie.getAccessTypes();
    accessTypesList = result.asObservable();
  }

  //Delete accesstypes
  deleteAcessTypes({required int id}) async {
    final result = await ServicesResponsitorie.deleteAccessType(id: id);
    accessTypesList = result.asObservable();
  }

  //Post accesstypes
  postAcessTypes({required int id, required String name}) async {
    final result =
        await ServicesResponsitorie.postAccessType(id: id, name: name);
    accessTypesList = result.asObservable();
  }

  //getAccessNotes

  getAcessNotes({required int id}) async {
    final result = await ServicesResponsitorie.getAccessNotes(id: id);
    configCategoty = result;
  }

  //post accessNote
  postAccessNotes(
      {required String id_d,
      required String name_form,
      required String name_component,
      required String tip,
      required bool status}) async {
    final result = await ServicesResponsitorie.postAccessNotes(
        id_d: id_d,
        name_component: name_component,
        name_form: name_form,
        status: status,
        tip: tip);
  }
}
