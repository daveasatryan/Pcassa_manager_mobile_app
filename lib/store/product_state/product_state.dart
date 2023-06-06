// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:pcassa_retail/models/product_category_model/product_category_model.dart';
import 'package:pcassa_retail/models/product_element_model/product_element_model.dart';
import 'package:pcassa_retail/requests_settings/repositories/services_repository/services_repository.dart';
//import 'package:pcassa_retail/router/router.gr.dart';
import 'package:pcassa_retail/router/services.dart';

import '../../error_handler/error_handler.dart';

part 'product_state.g.dart';

class CreatedProducts = CreatedProductsBase with _$CreatedProducts;

abstract class CreatedProductsBase with Store {
//Product Category List
  @observable
  ObservableList<ProductCategoryModel> productsCategoryList =
      ObservableList<ProductCategoryModel>();

//Product Element List
  @observable
  ObservableList<ProductElementModel> productsElements =
      ObservableList<ProductElementModel>();

  //Categories First Level List
  @observable
  ObservableList<ProductCategoryModel> categoriesFirstLevel =
      ObservableList<ProductCategoryModel>();

  //groupElement
  @observable
  ObservableList<ProductElementModel> groupElement =
      ObservableList<ProductElementModel>();

        //groupElementNames
  @observable
  ObservableList<String> groupElementNames =
      ObservableList<String>();
@observable
String searchName="";
@observable
 var nameSearchContraller = TextEditingController();
//Get Products
  @action
  // ignore: curly_braces_in_flow_control_structures
  getProducts({required BuildContext context}) async {
    final result = await ServicesResponsitorie.getProducts(context: context);

    productsCategoryList = result.category.asObservable();
    productsElements = result.menu.asObservable();
  }

  //product post
  @action
  postProducts(
      {required ProductElementModel productElementModel,
      required BuildContext context}) async {
    final result = await ServicesResponsitorie.saveProducts(
        productElementModel: productElementModel, context: context);

    productsCategoryList = result.category.asObservable();
    productsElements = result.menu.asObservable();
  }

//Create First Level Part
  @action
  categoryFirstMade() {
    for (int i = 0; i < productsCategoryList.length; i++) {
      if (productsCategoryList[i].isroot == 0) {
        categoriesFirstLevel.add(productsCategoryList[i]);
      }
    }
  }

//Add New Group
  @action
  addGroup(
      {required guid,
      required parentGuid,
      required caption,
      required isRoot,
      required BuildContext context}) async {
    final response = await ServicesResponsitorie.addGroup(
        guid: guid, parentguid: parentGuid, caption: caption, isroot: isRoot);
    await getProducts(context: context);
    categoriesFirstLevel.clear();
    await categoryFirstMade();
    print(categoriesFirstLevel);
  }

  //Delete Group
  @action
  delGroup({required BuildContext context, required guid}) async {
    final response =
        await ServicesResponsitorie.delGroup(context: context, guid: guid);
    await getProducts(context: context);
    categoriesFirstLevel.clear();
    await categoryFirstMade();
  }

//Change Group
  @action
  Future<void> changeGroupe({
    required BuildContext context,
    required guid,
    required newguid,
    required oldguid,
    required isRoot,
  }) async {
    final response = await ServicesResponsitorie.changeCategories(
        guid: guid, newguid: newguid, oldguid: oldguid, isRoot: isRoot);
    clearGroupState();
    await getProducts(context: context);
  }

//get product
  groupingProduct(
      {required mainCategoryGuid, required, required mainCategoryName}) {
    for (int i = 0; i < productsElements.length; i++) {
      if (productsElements[i].gguid == mainCategoryGuid) {
        groupElement.add(productsElements[i]);
        groupElementNames.add(productsElements[i].name!);
      }
    }
  }

  //Clear Group State
  @action
  clearGroupState() {
    productsElements.clear();
    categoriesFirstLevel.clear();
    productsCategoryList.clear();
  }
}
