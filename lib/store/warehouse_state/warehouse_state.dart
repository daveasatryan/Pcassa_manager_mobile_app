import 'package:mobx/mobx.dart';
import 'package:pcassa_retail/models/warehouse_model/warehosue_model.dart';

import '../../requests_settings/repositories/services_repository/services_repository.dart';
part 'warehouse_state.g.dart';

class WarehouseState = WarehouseStateBase with _$WarehouseState;

abstract class WarehouseStateBase with Store {
  //Product unit List
  @observable
  ObservableList<WarehouseModel> warehouseList =
      ObservableList<WarehouseModel>();
        @observable
  ObservableList<String> warehouseNames =
      ObservableList<String>();

//Get spent
  @action
  getWarehouse() async {
    final result = await ServicesResponsitorie.getWarehouse();
    warehouseList = result.asObservable();
  }

//Post spent
  @action
  postWarehouse({required int cod, required String name}) async {
    final result =
        await ServicesResponsitorie.postWarehouse(name: name, cod: cod);
    warehouseList = result.asObservable();
  }

@action

  getWarehouseNames(){
    warehouseNames.add("notSelected");
    for(int i =0;i<warehouseList.length;i++){
       if(warehouseList.isNotEmpty){
        warehouseNames.add(warehouseList[i].name);
       }
    }
  }
//Delete spent
  @action
  delWarehouse({required int cod}) async {
    final result = await ServicesResponsitorie.delWarehouse(cod: cod);
    warehouseList = result.asObservable();
  }
}
