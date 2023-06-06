import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:pcassa_retail/models/remainder_model/remainder_model.dart';

import '../../requests_settings/repositories/services_repository/services_repository.dart';

part 'remainder_items_state.g.dart';

//State for Autorisation
class RemainderItemsState = RemainderItemsStateBase with _$RemainderItemsState;

abstract class RemainderItemsStateBase with Store {
  @observable
  List<RemainderItemsModel> remainderList = [];

  //Get accesstypes
  // getProductByName(
  //     {required BuildContext context, required String productName}) async {
  //   final result = await ServicesResponsitorie.getProductByName(
  //       context: context, productName: productName);
  //   searchResult = result.asObservable();
  // }

  //Get accesstypes
  getRemainder(
      {order_by = "",
      data_e = "",
      category_name = "",
      name = "",
      sklname = "",
      page=1}) async {
    final result = await ServicesResponsitorie.getRemainder(
        order_by: order_by,
        data_e: data_e,
        category_name: category_name,
        name: name,
        sklname: sklname,
        page: page);
    if(page==1){
      remainderList = result;
    }
    else if(page>1){
      remainderList.addAll(result);
    }
    //print(result);
    
    //print(remainderList);
    //remainderList = remainderList.sublist(0,15);
  }
}
