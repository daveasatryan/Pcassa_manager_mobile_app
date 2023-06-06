import 'package:mobx/mobx.dart';
import 'package:pcassa_retail/models/unit_model/unit_model.dart';

import '../../requests_settings/repositories/services_repository/services_repository.dart';
part 'unit_state.g.dart';

class UnitState = UnitStateBase with _$UnitState;

abstract class UnitStateBase with Store {
  //Product unit List
  @observable
  ObservableList<UnitModel> unitList =
      ObservableList<UnitModel>();

//Get units
@action
getUnit()async{
   final result = await ServicesResponsitorie.getUnit();
    unitList = result.asObservable();
   
}

//Post units
@action
postUnit({required guid, required name})async{
   final result = await ServicesResponsitorie.postUnit(name: name, guid: guid);
    unitList = result.asObservable();
}

//Delete units
@action
deleteUnit({required guid})async{
   final result = await ServicesResponsitorie.delUnit( guid: guid);
    unitList = result.asObservable();
}
}
