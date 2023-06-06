import 'package:mobx/mobx.dart';
import 'package:pcassa_retail/models/station_type_model/station_type_model.dart';
import 'package:pcassa_retail/models/unit_model/unit_model.dart';

import '../../requests_settings/repositories/services_repository/services_repository.dart';
part 'station_type_state.g.dart';

class StationTypeState = StationTypeStateBase with _$StationTypeState;

abstract class StationTypeStateBase with Store {
  //Product unit List
  @observable
  ObservableList<StationTypeModel> stationTypeList =
      ObservableList<StationTypeModel>();
        @observable
  ObservableList<String> stationTypeNameList =
      ObservableList<String>();


//Get units
@action
getStationType()async{
   final result = await ServicesResponsitorie.getStationType();
    stationTypeList = result.asObservable();
}

//Post units
@action
postStationType({required int id, required String name, required String? prim, required String? rshet})async{
   final result = await ServicesResponsitorie.addStationType(id: id, prim:prim, name: name, rshet: rshet);
    stationTypeList = result.asObservable();
}

@action
getNames(){
  stationTypeNameList.add("notSelected");
  for(int i = 0; i<stationTypeList.length;i++){
    stationTypeNameList.add(stationTypeList[i].name.toString());
  }
}
//Delete units
@action
deleteStationType({required int id})async{
   final result = await ServicesResponsitorie.delStationType(id: id);
    stationTypeList = result.asObservable();
}
}
