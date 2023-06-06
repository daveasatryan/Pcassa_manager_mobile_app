import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pcassa_retail/models/contragent_group_model/contragent_group_model.dart';
import 'package:pcassa_retail/models/contragent_items_model/contragent_items_model.dart';

import '../../requests_settings/repositories/services_repository/services_repository.dart';
part 'contragent_state.g.dart';

class ContragentState = ContragentStateBase with _$ContragentState;

abstract class ContragentStateBase with Store {
//Contragent Category List
  @observable
  ObservableList<ContragentGroupModel> contragentCategoryList =
      ObservableList<ContragentGroupModel>();

//Contragent Category List
  @observable
  ObservableList<String>contragentNames =
      ObservableList<String>();


//contragent Element List
  @observable
  ObservableList<ContragentItemsModel> contragentsElements =
      ObservableList<ContragentItemsModel>();

  //Contragent First Level List
  @observable
  ObservableList<ContragentGroupModel> contragentsFirstLevel =
      ObservableList<ContragentGroupModel>();

  //groupItems
  @observable
  ObservableList<ContragentItemsModel> groupContragents =
      ObservableList<ContragentItemsModel>();

//Get contragents

  @action
  // ignore: curly_braces_in_flow_control_structures
  getContragents({required BuildContext context}) async {
    final result = await ServicesResponsitorie.getContragents(context: context);
    contragentCategoryList = result.gruppakor.asObservable();
    contragentsElements = result.sprkor.asObservable();
  }

//Create First Level Part
  @action
  categoryFirstMade() {
    for (int i = 0; i < contragentCategoryList.length; i++) {
      if (contragentCategoryList[i].isroot == 0) {
        contragentsFirstLevel.add(contragentCategoryList[i]);
      }
    }
  }

  //Add New Group
  @action
  addContragentGroup(
      {required guid,
      required parentGuid,
      required caption,
      required isRoot,
      required BuildContext context}) async {
    final response = await ServicesResponsitorie.addContragentGroup(
        guid: guid, parentguid: parentGuid, caption: caption, isroot: isRoot);
    await getContragents(context: context);
    contragentsFirstLevel.clear();
    await categoryFirstMade();
  }

  //contragent post
  @action
  postContragent(
      {required ContragentItemsModel contragentItemModel,
      required BuildContext context}) async {
    final result = await ServicesResponsitorie.saveContragents(
        contragentItemModel: contragentItemModel, context: context);

    contragentCategoryList = result.gruppakor.asObservable();
    contragentsElements = result.sprkor.asObservable();
  }

  //Delete Group
  @action
  delGroup({required BuildContext context, required guid}) async {
    final response =
        await ServicesResponsitorie.delContragent(context: context, guid: guid);
    await getContragents(context: context);
    contragentsFirstLevel.clear();
    await categoryFirstMade();
  }

  //groupContragent
  groupingContragents(
      {required mainCategoryGuid, required, required mainCategoryName}) {
    for (int i = 0; i < contragentsElements.length; i++) {
      if (contragentsElements[i].gguid == mainCategoryGuid) {
        groupContragents.add(contragentsElements[i]);
      }
    }
  }

  @action
  getContragentNames(){
    contragentNames.add("notSelected");
    for (int i = 0; i < contragentsElements.length; i++) {
      contragentNames.add(contragentsElements[i].name!);
    } 
  }


//Change Group
  @action
  Future<void> changeGroupe(
      {required BuildContext context,
      required guid,
      required newguid,
      required oldguid,
      required isRoot}) async {
    final response = await ServicesResponsitorie.changeContragentCategories(
        guid: guid, newguid: newguid, oldguid: oldguid, isRoot: isRoot);
    clearGroupState();
    await getContragents(context: context);
  }

  //Clear Group State
  @action
  clearGroupState() {
    contragentsElements.clear();
    contragentsFirstLevel.clear();
    contragentCategoryList.clear();
  }
}
