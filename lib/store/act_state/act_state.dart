import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:pcassa_retail/models/access_type_model/access_type_model.dart';
import 'package:pcassa_retail/models/act_model/act_model.dart';
import 'package:pcassa_retail/models/search_by_name_model/search_by_name_model.dart';
import '../../requests_settings/repositories/services_repository/services_repository.dart';

part 'act_state.g.dart';

//State for Autorisation
class ActState = ActStateBase with _$ActState;

abstract class ActStateBase with Store {
  @observable
 ActModel? actInfoForCreate ;

  
  getActMainInfo({required ActModel actInfo_}) async {
    final result = await ServicesResponsitorie.getActMainInfo(actinfo: actInfo_);
    actInfoForCreate = result;
  }


}
