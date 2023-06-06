import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:pcassa_retail/models/act_realisation_model/act_realisation_model.dart';
import 'package:pcassa_retail/models/oborot_vedom_model/oborot_vedom_model.dart';
import 'package:pcassa_retail/models/remainder_model/remainder_model.dart';

import '../../requests_settings/repositories/services_repository/services_repository.dart';

part 'oborot_vedom_state.g.dart';

//State for Autorisation
class OborotVedomState = OborotVedomStateBase with _$OborotVedomState;

abstract class OborotVedomStateBase with Store {
  @observable
  List<OborotVedomModel> oborotVedomList = [];

  //Get accesstypes
  getOborotVedom(
      {order_by = "",
      data_e = "",
            data_s = "",
      category_name = "",
      name = "",
      sklname = "",
      page = 1}) async {
    final result = await ServicesResponsitorie.getOborotVedomost(
        order_by: order_by,
        data_e: data_e,
        data_s: data_s,
        category_name: category_name,
        name: name,
        sklname: sklname,
        page: page);
    if (page == 1) {
      oborotVedomList = result;
    } else if (page > 1) {
      oborotVedomList.addAll(result);
    }
    //print(result);

    //print(remainderList);
    //remainderList = remainderList.sublist(0,15);
  }
}
