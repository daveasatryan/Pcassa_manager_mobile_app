//There is all requests about Autorisation functional
// ignore_for_file: unused_local_variable

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:pcassa_retail/error_handler/error_handler.dart';
import 'package:pcassa_retail/models/access_model/access_model.dart';
import 'package:pcassa_retail/models/act_model/act_model.dart';
import 'package:pcassa_retail/models/act_realisation_model/act_realisation_model.dart';
import 'package:pcassa_retail/models/act_view_model/act_view_model.dart';
import 'package:pcassa_retail/models/cashorders/cash_order_model.dart';
import 'package:pcassa_retail/models/category_type_model/category_type_model.dart';
import 'package:pcassa_retail/models/contragent_items_model/contragent_items_model.dart';
import 'package:pcassa_retail/models/kont_balance_model/kont_balance_model.dart';
import 'package:pcassa_retail/models/nakladnoy_view_model/nakladnoy_view_model.dart';
import 'package:pcassa_retail/models/naklinfo_items_model/naklinfo_items_model.dart';
import 'package:pcassa_retail/models/oborot_vedom_model/oborot_vedom_model.dart';
import 'package:pcassa_retail/models/open_cash_order_model/open_cash_order_model.dart';
import 'package:pcassa_retail/models/open_nakl_model/open_nakl_model.dart';
import 'package:pcassa_retail/models/product_element_model/product_element_model.dart';
import 'package:pcassa_retail/models/product_model/product_model.dart';
import 'package:pcassa_retail/models/remainder_model/remainder_model.dart';
import 'package:pcassa_retail/models/saled_product_model/saled_product_model.dart';
import 'package:pcassa_retail/models/search_by_name_model/search_by_name_model.dart';
import 'package:pcassa_retail/models/spent_model/spent_model.dart';
import 'package:pcassa_retail/models/tovar_array_items/tovar_array_items.dart';
import 'package:pcassa_retail/models/viruchka_model/viruchka_model.dart';
import 'package:pcassa_retail/models/warehouse_model/warehosue_model.dart';
import '../../../models/access_type_model/access_type_model.dart';
import '../../../models/contragent_model/contragent_model.dart';
import '../../../models/create_discount_model/create_discount_model.dart';
import '../../../models/create_user_model/create_user_model.dart';
import '../../../models/currency_model/currency_model.dart';
import '../../../models/station_type_model/station_type_model.dart';
import '../../../models/unit_model/unit_model.dart';
import '../../dio_options/dio_options.dart';
import '../../requests/requests.dart';

class ServicesResponsitorie {
  //Get Products Request
  static Future<ProductModel> getProducts(
      {required BuildContext context}) async {
    final resposne = await dio.get(
      Requests.products,
    );

    return ProductModel.fromJson(resposne.data);
  }

  //Post Products Request
  static Future<ProductModel> saveProducts(
      {required ProductElementModel productElementModel,
      required BuildContext context}) async {
    final response = await dio.post(Requests.products, data: {
      "guid": productElementModel.guid,
      "name": productElementModel.name,
      "description": productElementModel.description,
      "ed_izm": productElementModel.ed_izm,
      "gguid": productElementModel.gguid,
      "kat_tov": productElementModel.kat_tov,
      "kod_tov": productElementModel.kod_tov,
      "barcode": productElementModel.barcode,
      "barcode_grupp": productElementModel.barcode_grupp,
      "price_o_r": productElementModel.price_o_r,
      "price_o_o": productElementModel.price_o_o,
      "kname": productElementModel.kname,
      "adg": productElementModel.adg,
      "priznak_sk": productElementModel.priznak_sk,
      "komplekt_id": productElementModel.komplekt_id,
      "linkfoto": null,
      "top": productElementModel.top,
      "status": productElementModel.status,
      "excise": productElementModel.excise
    });

    return ProductModel.fromJson(response.data);
  }

  //change category  Request
  static Future changeCategories(
      {required String guid,
      required String oldguid,
      required int isRoot,
      required String newguid}) async {
    final response = await dio.post(Requests.changeGroupe, data: {
      "guid": guid,
      "oldguid": oldguid,
      "newguid": newguid,
      'isroot': isRoot
    });
  }

  //add group category  Request
  static Future addGroup(
      {required String guid,
      required String parentguid,
      required String caption,
      required int isroot}) async {
    final response = await dio.post(Requests.createGroup, data: {
      'guid': guid,
      "parentguid": parentguid,
      "caption": caption,
      'isroot': isroot
    });
  }

  //delete group category  Request
  static Future delGroup({
    required BuildContext context,
    required String guid,
  }) async {
    final response = await dio.delete(Requests.createGroup, data: {
      'guid': guid,
    });
    if (response.data["status"] == "notdelete") {
      await ErrorHandler.errorModal(
          context: context, errorCode: "errors.notDelete");
    }
  }

//getUnit
  static Future<List<UnitModel>> getUnit() async {
    final response = await dio.get(
      Requests.unit,
    );

    return response.data
        .map<UnitModel>((json) => UnitModel.fromJson(json))
        .toList();
  }

//postUnit
  static Future<List<UnitModel>> postUnit(
      {required guid, required name}) async {
    final response = await dio.post(Requests.unit, data: {
      "guid": guid,
      "name": name,
    });

    return response.data
        .map<UnitModel>((json) => UnitModel.fromJson(json))
        .toList();
  }

//delUnit
  static Future<List<UnitModel>> delUnit({required guid}) async {
    final response = await dio.delete(Requests.unit, data: {
      "guid": guid,
    });

    return response.data
        .map<UnitModel>((json) => UnitModel.fromJson(json))
        .toList();
  }

//getCategoryType
  static Future<List<CategorytypeModel>> getCategoryType() async {
    final response = await dio.get(
      Requests.categoryProduct,
    );

    return response.data
        .map<CategorytypeModel>((json) => CategorytypeModel.fromJson(json))
        .toList();
  }

//postUnit
  static Future<List<CategorytypeModel>> postCategoryType(
      {required guid, required name}) async {
    final response = await dio.post(Requests.categoryProduct, data: {
      "guid": guid,
      "name": name,
    });

    return response.data
        .map<CategorytypeModel>((json) => CategorytypeModel.fromJson(json))
        .toList();
  }

//delCategoryType
  static Future<List<CategorytypeModel>> delCategoryType(
      {required guid}) async {
    final response = await dio.delete(Requests.categoryProduct, data: {
      "guid": guid,
    });

    return response.data
        .map<CategorytypeModel>((json) => CategorytypeModel.fromJson(json))
        .toList();
  }

  //Get created users Request
  static Future<List<CreateUserModel>> getCreatedUsers() async {
    final response = await dio.get(
      Requests.users,
    );

    return response.data
        .map<CreateUserModel>((json) => CreateUserModel.fromJson(json))
        .toList();
  }

  //Delete created users Request
  static deleteUser({required int id}) async {
    final response = await dio.delete(Requests.users, data: {'id': id});
  }

  //Save User
  //Update created users Request
  static Future<CreateUserModel> sendUpdateUserInfo({
    required int id,
    required String login,
    required String password,
    required String fio,
    required int pin,
    required int tip,
    required String cod,
    required String shtrix,
    required String tipdostupa,
    required String language,
  }) async {
    final res = await dio.post(Requests.users, data: {
      'id': id,
      'login': login,
      'fio': fio,
      'pin': pin,
      'language': language,
      'tipdostup': tipdostupa,
      'tip': tip,
      'paswword': password,
      'card': [
        {'cod': cod, 'shtrix': shtrix}
      ]
    });

    return CreateUserModel.fromJson(res.data);
  }

  //Get created discount Request
  static Future<List<GetDiscountsModel>> getCreatedDiscount() async {
    final response = await dio.get(
      Requests.getDiscounts,
    );

    return response.data
        .map<GetDiscountsModel>((json) => GetDiscountsModel.fromJson(json))
        .toList();
  }

  //Save created discount Request
  static Future<List<GetDiscountsModel>> saveCreatedDiscount(
      {required id,
      required id_d,
      required name,
      required tip,
      required val,
      required status,
      required rejim}) async {
    final response = await dio.post(Requests.postDiscounts, data: {
      'id': id,
      'id_d': id_d,
      'name': name,
      'tip': tip,
      'val': val,
      "status": status,
      'rejim': rejim
    });

    return response.data
        .map<GetDiscountsModel>((json) => GetDiscountsModel.fromJson(json))
        .toList();
  }

  //Delete created discount Request
  static deleteDiscount({required int id}) async {
    try {
      final response =
          await dio.delete(Requests.postDiscounts, data: {'id': id});
      return response.data.toString();
    } on DioError {
      print('ok');
    }
  }

  //Get  currencys Request
  static Future<List<CurrencyModel>> getCreatedCurrenyc() async {
    final res = await dio.get(
      Requests.currencys,
    );

    return res.data
        .map<CurrencyModel>((json) => CurrencyModel.fromJson(json))
        .toList();
  }

  //Save and Update Currency request
  static Future<List<CurrencyModel>> saveCurrencys({
    required int cod,
    required String gguid,
    required String name,
    required String short_name,
    required int tip,
    required int tip_oplati,
    required int b_valyuta,
    required int status,
    required int spisanie,
    required double metod_round,
  }) async {
    final res = await dio.post(Requests.currencys, data: {
      'cod': cod,
      'gguid': gguid,
      'name': name,
      'short_name': short_name,
      'tip': tip,
      'tip_oplati': tip_oplati,
      'b_valyuta': b_valyuta,
      'status': status,
      'spisanie': spisanie,
      'metod_round': metod_round,
    });

    return res.data
        .map<CurrencyModel>((json) => CurrencyModel.fromJson(json))
        .toList();
  }

  //Delete Currency Request
  static Future deleteCurrencys({required int code}) async {
    final response = await dio.delete(Requests.currencys, data: {'cod': code});
  }

  //Get  access type request
  static Future<List<AccessTypeModel>> getAccessTypes() async {
    final response = await dio.get(
      Requests.accessType,
    );

    return response.data
        .map<AccessTypeModel>((json) => AccessTypeModel.fromJson(json))
        .toList();
  }

  //Delete access type Request
  static Future<List<AccessTypeModel>> deleteAccessType(
      {required int id}) async {
    final response = await dio.delete(Requests.accessType, data: {'id': id});

    return response.data
        .map<AccessTypeModel>((json) => AccessTypeModel.fromJson(json))
        .toList();
  }

  //postUnit
  static Future<List<AccessTypeModel>> postAccessType(
      {required int id, required String name}) async {
    final response = await dio.post(Requests.accessType, data: {
      "id": id,
      "name": name,
    });

    return response.data
        .map<AccessTypeModel>((json) => AccessTypeModel.fromJson(json))
        .toList();
  }

  //Get AccessNotes
  //Update created users Request
  static Future<AccessModel> getAccessNotes({
    required int id,
  }) async {
    final res = await dio.post(Requests.accessNote, data: {
      'id': id,
    });
    print(res.data);
    return AccessModel.fromJson(res.data);
  }

//post AccessNote
  static Future postAccessNotes(
      {required String id_d,
      required String name_form,
      required String name_component,
      required String tip,
      required bool status}) async {
    final res = await dio.post(Requests.postAccessNote, data: {
      'id_d': id_d,
      'name_form': name_form,
      'name_component': name_component,
      'tip': tip,
      'status': status
    });
    print(res.data);
  }

  //getSpent
  static Future<List<SpentModel>> getSpent() async {
    final response = await dio.get(
      Requests.spent,
    );

    return response.data
        .map<SpentModel>((json) => SpentModel.fromJson(json))
        .toList();
  }

//postSpent
  static Future<List<SpentModel>> postSpent(
      {required int id, required String name}) async {
    final response = await dio.post(Requests.spent, data: {
      "id": id,
      "name": name,
    });

    return response.data
        .map<SpentModel>((json) => SpentModel.fromJson(json))
        .toList();
  }

//delSpent
  static Future<List<SpentModel>> delSpent({required id}) async {
    final response = await dio.delete(Requests.spent, data: {
      "id": id,
    });

    return response.data
        .map<SpentModel>((json) => SpentModel.fromJson(json))
        .toList();
  }

  //getwarehouse
  static Future<List<WarehouseModel>> getWarehouse() async {
    final response = await dio.get(
      Requests.warehouse,
    );

    return response.data
        .map<WarehouseModel>((json) => WarehouseModel.fromJson(json))
        .toList();
  }

//postwarehouse
  static Future<List<WarehouseModel>> postWarehouse(
      {required int cod, required String name}) async {
    final response = await dio.post(Requests.warehouse, data: {
      "cod": cod,
      "name": name,
    });

    return response.data
        .map<WarehouseModel>((json) => WarehouseModel.fromJson(json))
        .toList();
  }

//delwarehouse
  static Future<List<WarehouseModel>> delWarehouse({required int cod}) async {
    final response = await dio.delete(Requests.warehouse, data: {
      "cod": cod,
    });

    return response.data
        .map<WarehouseModel>((json) => WarehouseModel.fromJson(json))
        .toList();
  }

  //START STATIONTYPE REQUESTS
  static Future<List<StationTypeModel>> getStationType() async {
    final response = await dio.get(
      Requests.stationType,
    );
    return response.data
        .map<StationTypeModel>((json) => StationTypeModel.fromJson(json))
        .toList();
  }

  static Future<List<StationTypeModel>> delStationType(
      {required int id}) async {
    final response = await dio.delete(Requests.stationType, data: {"id": id});
    print(id);
    return response.data
        .map<StationTypeModel>((json) => StationTypeModel.fromJson(json))
        .toList();
  }

  static Future<List<StationTypeModel>> addStationType(
      {required int id,
      required String name,
      required String? prim,
      required String? rshet}) async {
    final response = await dio.post(Requests.stationType,
        data: {"id": id, "rshet": rshet, "prim": prim, "name": name});
    return response.data
        .map<StationTypeModel>((json) => StationTypeModel.fromJson(json))
        .toList();
  }

  //END STATIONTYPE REQUESTS

  //GetContragents
  static Future<ContragentModel> getContragents(
      {required BuildContext context}) async {
    final resposne = await dio.get(
      Requests.getContragents,
    );

    return ContragentModel.fromJson(resposne.data);
  }

  //change category  Request
  static Future changeContragentCategories(
      {required String guid,
      required String oldguid,
      required int isRoot,
      required String newguid}) async {
    final response = await dio.post(Requests.contragentsGroupChange, data: {
      "guid": guid,
      "oldguid": oldguid,
      "newguid": newguid,
      "isroot": isRoot
    });
  }

  //add group category  Request
  static Future addContragentGroup(
      {required String guid,
      required String parentguid,
      required String caption,
      required int isroot}) async {
    final response = await dio.post(Requests.contragentsGroupDeleteAndPost,
        data: {
          'guid': guid,
          "parentguid": parentguid,
          "caption": caption,
          'isroot': isroot
        });
  }

  //delete group category  Request
  static Future delContragent({
    required BuildContext context,
    required String guid,
  }) async {
    final response =
        await dio.delete(Requests.contragentsGroupDeleteAndPost, data: {
      'guid': guid,
    });
    if (response.data["status"] == "notdelete") {
      await ErrorHandler.errorModal(
          context: context, errorCode: "errors.notDelete");
    }
  }

  //Post contragents Request
  static Future<ContragentModel> saveContragents(
      {required ContragentItemsModel contragentItemModel,
      required BuildContext context}) async {
    final response = await dio.post(Requests.getContragents, data: {
      "guid": contragentItemModel.guid,
      "name": contragentItemModel.name,
      "description": contragentItemModel.description,
      "kod": contragentItemModel.kod,
      "yur_adres": contragentItemModel.yur_adres,
      "gguid": contragentItemModel.gguid,
      "post_adres": contragentItemModel.post_adres,
      "tel": contragentItemModel.tel,
      "full_name": contragentItemModel.full_name,
      "inn": contragentItemModel.inn,
      "kpp": contragentItemModel.kpp,
      "rshet": contragentItemModel.rshet,
      "kshet": contragentItemModel.kshet,
      "bik": contragentItemModel.bik,
      "bank_name": contragentItemModel.bank_name,
      "prim": contragentItemModel.prim,
      "contact_litso": contragentItemModel.contact_litso,
      "kredit": contragentItemModel.kredit,
      "fixsum": contragentItemModel.fixsum,
    });

    return ContragentModel.fromJson(response.data);
  }

  //productSearchByName
  static Future<List<SearchByNameModel>> getProductByName(
      {required BuildContext context, required String productName}) async {
    final response = await dio.get(
      "${Requests.searchProductByName}$productName",
    );

    return response.data
        .map<SearchByNameModel>((json) => SearchByNameModel.fromJson(json))
        .toList();
  }

  static Future<SearchByNameModel> getProductByBarcode(
      {required BuildContext context, required String barcode}) async {
    final response = await dio.post(Requests.searchProductByBarcode, data: {
      "barcode": barcode,
    });
    return SearchByNameModel.fromJson(response.data);
  }

  static Future getRemainder(
      {order_by = "",
      data_e = "",
      category_name = "",
      name = "",
      sklname = "",
      page = 1}) async {
    final response = await dio.post(Requests.ostatok + page.toString(), data: {
      "order_by": order_by,
      "data_e": data_e,
      "category_name": category_name,
      "name": name,
      "sklname": sklname
    });
    return response.data
        .map<RemainderItemsModel>((json) => RemainderItemsModel.fromJson(json))
        .toList();
  }

  static Future<List<ActRealisationModel>> getActRealisation(
      {order_by = "",
      data_s = "",
      data_e = "",
      category_name = "",
      name = "",
      sklname = "",
      page = 1}) async {
    final response =
        await dio.post(Requests.aktRealization + page.toString(), data: {
      "order_by": order_by,
      "data_s": data_s,
      "data_e": data_e,
      "category_name": category_name,
      "name": name,
      "skl1name": sklname
    });
    return response.data
        .map<ActRealisationModel>((json) => ActRealisationModel.fromJson(json))
        .toList();
  }

  //Post Nakladnoy Request
  static Future<OpenNaklModel> saveDocument({
    required NaklInfoItemsModel naklinfo_items_model,
    required TovarArrayItems tovarArrayItems,
    required BuildContext context,
  }) async {
    final response = await dio.post(Requests.openNakl, data: {
      "naklinfo": {
        "id": naklinfo_items_model.id,
        "typ_d": naklinfo_items_model.typ_d,
        "n_dok": naklinfo_items_model.n_dok,
        "data_d": naklinfo_items_model.data_d,
        "kodpost": naklinfo_items_model.kodpost,
        "namepost": naklinfo_items_model.namepost,
        "skl1": naklinfo_items_model.skl1,
        "skl2": naklinfo_items_model.skl2,
        "skl1name": naklinfo_items_model.skl1name,
        "skl2name": naklinfo_items_model.skl2name,
        "srok_oplati": naklinfo_items_model.srok_oplati,
        "prim": naklinfo_items_model.prim,
        "aktiv": naklinfo_items_model.aktiv,
        "val": naklinfo_items_model.val,
        "skidka": naklinfo_items_model.skidka,
        "tip_skidki": naklinfo_items_model.tip_skidki,
        "contact_litso": naklinfo_items_model.contact_litso,
        "kurs": naklinfo_items_model.kurs,
        "pr_ras": naklinfo_items_model.pr_ras,
      },
      "tovar": [
        {
          "id": tovarArrayItems.id,
          "id_d": tovarArrayItems.id_d,
          "typ_d": tovarArrayItems.typ_d,
          "kod_tov": tovarArrayItems.kod_tov,
          "name": tovarArrayItems.name,
          "kol": tovarArrayItems.kol,
          "ed_izm": tovarArrayItems.ed_izm,
          "cena_p": tovarArrayItems.cena_p,
          "cena_o": tovarArrayItems.cena_o,
          "summa_p": tovarArrayItems.summa_p,
          "summa_o": tovarArrayItems.summa_o,
          "barcode": tovarArrayItems.barcode,
          "price": tovarArrayItems.price,
          "summa_price": tovarArrayItems.summa_price,
          "skidka": tovarArrayItems.skidka,
          "tip_skidki": tovarArrayItems.tip_skidki,
          "pr_ras": tovarArrayItems.pr_ras,
          "cena_v": tovarArrayItems.cena_v,
          "summa_v": tovarArrayItems.summa_v,
          "idd_rn": tovarArrayItems.idd_rn,
          "rn": tovarArrayItems.rn,
          "spis": tovarArrayItems.spis,
          "data_pr": tovarArrayItems.data_pr,
          "kd": tovarArrayItems.kd,
          "data_sr": tovarArrayItems.data_sr,
          "nds": tovarArrayItems.nds,
          "cena_nds": tovarArrayItems.cena_nds,
          "summa_nds": tovarArrayItems.summa_nds,
          "cena_bez_nds": tovarArrayItems.cena_bez_nds,
          "summa_bez_nds": tovarArrayItems.summa_bez_nds,
          "cena_nds_prixoda": tovarArrayItems.cena_nds_prixoda,
          "summa_nds_prixoda": tovarArrayItems.summa_nds_prixoda
        }
      ]
    });

    return OpenNaklModel.fromJson(response.data);
  }

  static Future<OpenNaklModel> createDocument({
    required NaklInfoItemsModel naklinfo_items_model,
    required BuildContext context,
  }) async {
    final response = await dio.post(Requests.openNakl, data: {
      "naklinfo": {
        "id": naklinfo_items_model.id,
        "typ_d": naklinfo_items_model.typ_d,
        "n_dok": naklinfo_items_model.n_dok,
        "data_d": naklinfo_items_model.data_d,
        "kodpost": naklinfo_items_model.kodpost,
        "namepost": naklinfo_items_model.namepost,
        "skl1": naklinfo_items_model.skl1,
        "skl2": naklinfo_items_model.skl2,
        "skl1name": naklinfo_items_model.skl1name,
        "skl2name": naklinfo_items_model.skl2name,
        "srok_oplati": naklinfo_items_model.srok_oplati,
        "prim": naklinfo_items_model.prim,
        "aktiv": naklinfo_items_model.aktiv,
        "val": naklinfo_items_model.val,
        "skidka": naklinfo_items_model.skidka,
        "tip_skidki": naklinfo_items_model.tip_skidki,
        "contact_litso": naklinfo_items_model.contact_litso,
        "kurs": naklinfo_items_model.kurs,
        "pr_ras": naklinfo_items_model.pr_ras,
      },
      "tovar": []
    });

    return OpenNaklModel.fromJson(response.data);
  }

  //getDocuments
  static Future<List<NaklViewModel>> getDocuments(
      {String? n_dok,
      String? data_s,
      String? data_e,
      String? tip_name,
      String? kontname,
      String? skl1name,
      String? skl2name,
      int? aktiv}) async {
    final response = await dio.post(Requests.naklorder, data: {
      "n_dok": n_dok == null ? "" : n_dok,
      "data_s": data_s == null ? "" : data_s,
      "data_e": data_e == null ? "" : data_e,
      "tip_name": tip_name == null ? "" : tip_name,
      "kontname": kontname == null ? "" : kontname,
      "skl1name": skl1name == null ? "" : skl1name,
      "skl2name": skl2name == null ? "" : skl2name,
      "aktiv": aktiv == null ? 1 : aktiv
    });

    return response.data
        .map<NaklViewModel>((json) => NaklViewModel.fromJson(json))
        .toList();
  }

  static Future<List<ActViewModel>> getActView(
      {String? n_dok = "",
      String? data_s = "",
      String? data_e = "",
      String? kontname = "",
      String? zatratname = ""}) async {
    final response = await dio.post(Requests.aktopen, data: {
      "n_dok": n_dok,
      "data_s": data_s,
      "data_e": data_e,
      "kontname": kontname,
      "zatratname": zatratname
    });

    return response.data
        .map<ActViewModel>((json) => ActViewModel.fromJson(json))
        .toList();
  }

  static Future<List<ActViewModel>> delActView(
      {required int id,
      required String n_dok,
      required String data_s,
      required String data_e,
      required String kontname,
      required String zatratname}) async {
    final response = await dio.post(Requests.aktdelete, data: {
      "id": id,
      "n_dok": n_dok,
      "data_s": data_s,
      "data_e": data_e,
      "kontname": kontname,
      "zatratname": zatratname
    });

    return response.data
        .map<ActViewModel>((json) => ActViewModel.fromJson(json))
        .toList();
  }

  static Future<ActModel> searchActView({
    required int id,
  }) async {
    final response = await dio.post(Requests.openaktorder, data: {
      "id": id,
    });

    return ActModel.fromJson(response.data);
  }

  static Future<OpenNaklModel> openDocument({
    required int id,
  }) async {
    final response = await dio.post(Requests.openDocument, data: {
      "id": id,
    });
    print(response.data);
    return OpenNaklModel.fromJson(response.data);
  }

  //getActMainInfo
  static Future getActMainInfo({required ActModel actinfo}) async {
    print(actinfo);
    final response = await dio.post(Requests.openakt, data: actinfo);
    return ActModel.fromJson(response.data);
  }

  //getDocuments
  static Future<List<NaklViewModel>> deleteDocuments(
      {int? id,
      String? n_dok,
      String? data_s,
      String? data_e,
      String? tip_name,
      String? kontname,
      String? skl1name,
      String? skl2name,
      int? aktiv}) async {
    final response = await dio.post(Requests.deleteDocument, data: {
      "id": id,
      "n_dok": n_dok == null ? "" : n_dok,
      "data_s": data_s == null ? "" : data_s,
      "data_e": data_e == null ? "" : data_e,
      "tip_name": tip_name == null ? "" : tip_name,
      "kontname": kontname == null ? "" : kontname,
      "skl1name": skl1name == null ? "" : skl1name,
      "skl2name": skl2name == null ? "" : skl2name,
      "aktiv": aktiv == null ? 1 : aktiv
    });

    return response.data
        .map<NaklViewModel>((json) => NaklViewModel.fromJson(json))
        .toList();
  }

  static Future<OpenNaklModel> deleteProduct({
    required int id,
    required int id_d,
  }) async {
    final response = await dio.post(Requests.deleteProduct, data: {
      "id": id,
      "id_d": id_d,
    });

    return OpenNaklModel.fromJson(response.data);
  }

  //Post Products Request
  static Future<CashOrderModel> createCahsOrderDocument({
    required CashOrderModel cashOrderModel,
  }) async {
    final response = await dio.post(Requests.cahsOrderCreate, data: {
      "id": cashOrderModel.id,
      "n_dok": cashOrderModel.n_dok,
      "data_d": cashOrderModel.data_d,
      "typ_d": cashOrderModel.typ_d,
      "summa": cashOrderModel.summa,
      "id_osn": cashOrderModel.id_osn,
      "t_osn": cashOrderModel.t_osn,
      "kodpost": cashOrderModel.kodpost,
      "namepost": cashOrderModel.namepost,
      "prim": cashOrderModel.prim,
      "aktiv": cashOrderModel.aktiv,
      "val": cashOrderModel.val,
      "kurs": cashOrderModel.kurs,
      "pr_kassa": cashOrderModel.pr_kassa,
      "summa_v": cashOrderModel.summa_v,
      "id_vidkas": cashOrderModel.id_vidkas,
    });

    return CashOrderModel.fromJson(response.data);
  }

  //getRkoPko
  static Future<List<OpenCashOrderModel>> getRkoPkoByFilter({
    String? n_dok,
    String? data_s,
    String? data_e,
    String? tip_name,
    String? kontname,
    String? kassname,
  }) async {
    final response = await dio.post(Requests.getRkoPkoList, data: {
      "n_dok": n_dok == null ? "" : n_dok,
      "data_s": data_s == null ? "" : data_s,
      "data_e": data_e == null ? "" : data_e,
      "tip_name": tip_name == null ? "" : tip_name,
      "kontname": kontname == null ? "" : kontname,
      "kassname": kassname == null ? "" : kassname,
    });

    return response.data
        .map<OpenCashOrderModel>((json) => OpenCashOrderModel.fromJson(json))
        .toList();
  }

  //getRkoPko
  static Future<List<OpenCashOrderModel>> deleteRkoPko({
    int? id,
    String? n_dok,
    String? data_s,
    String? data_e,
    String? tip_name,
    String? kontname,
    String? kassname,
  }) async {
    final response = await dio.post(Requests.deleteRkoPkoList, data: {
      "id": id,
      "n_dok": n_dok == null ? "" : n_dok,
      "data_s": data_s == null ? "" : data_s,
      "data_e": data_e == null ? "" : data_e,
      "tip_name": tip_name == null ? "" : tip_name,
      "kontname": kontname == null ? "" : kontname,
      "kassname": kassname == null ? "" : kassname,
    });

    return response.data
        .map<OpenCashOrderModel>((json) => OpenCashOrderModel.fromJson(json))
        .toList();
  }

  static Future<CashOrderModel> openRkoPko({
    required int id,
  }) async {
    final response = await dio.post(Requests.openRkoPko, data: {
      "id": id,
    });

    return CashOrderModel.fromJson(response.data);
  }

  //viruchka
  //Get created discount Request
  static Future<List<ViruchkaModel>> getViruchka(
      {required String waiter_name,
      required String order_by,
      required String data_s,
      required String data_e,
      required String chequenumber,
      required String n_smena}) async {
    final response = await dio.post(Requests.getViruchka, data: {
      "waiter_name": waiter_name,
      "order_by": order_by == null ? "" : order_by,
      "data_s": data_s == null ? "" : data_s,
      "data_e": data_e == null ? "" : data_e,
      "chequenumber": chequenumber == null ? "" : chequenumber,
      "n_smena": n_smena == null ? "" : n_smena,
    });

    return response.data
        .map<ViruchkaModel>((json) => ViruchkaModel.fromJson(json))
        .toList();
  }

  static Future<SaledProductModel> getSaledProducts({
    required String order_by,
    required String? data_s,
    required String? data_e,
    required String? category_name,
    required String? name,
  }) async {
    final response = await dio.post(Requests.saledProductMan, data: {
      "order_by": order_by == null ? "" : order_by,
      "data_s": data_s == null ? "" : data_s,
      "data_e": data_e == null ? "" : data_e,
      "category_name": category_name == null ? "" : category_name,
      "name": name == null ? "" : name,
    });

    return SaledProductModel.fromJson(response.data);
  }

  static Future<KontBalanceModel> getContragentBalance({
    required String name,
    required String? data_s,
    required String? data_e,
  }) async {
    final response = await dio.post(Requests.getContragentReport, data: {
      "name": name == null ? "" : name,
      "data_s": data_s == null ? "" : data_s,
      "data_e": data_e == null ? "" : data_e,
    });

    return KontBalanceModel.fromJson(response.data);
  }


    static Future<List<OborotVedomModel>> getOborotVedomost(
      {order_by = "",
      data_s = "",
      data_e = "",
      category_name = "",
      name = "",
      sklname = "",
      page = 1}) async {
    final response =
        await dio.post(Requests.getOborotVedom + page.toString(), data: {
      "order_by": order_by,
      "data_s": data_s,
      "data_e": data_e,
      "category_name": category_name,
      "name": name,
      "skl1name": sklname
    });
    return response.data
        .map<OborotVedomModel>((json) => OborotVedomModel.fromJson(json))
        .toList();
  }
}
