import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:pcassa_retail/models/naklinfo_items_model/naklinfo_items_model.dart';
import 'package:pcassa_retail/models/tovar_array_items/tovar_array_items.dart';
import 'package:pcassa_retail/screens/documents_screen/created_document_view.dart';
import '../../requests_settings/repositories/services_repository/services_repository.dart';

part 'nakl_info_state.g.dart';

//State for Autorisation
class NaklInfoState = NaklInfoStateBase with _$NaklInfoState;

abstract class NaklInfoStateBase with Store {

  @observable 
  bool savedDocument = false;
  @observable
  NaklInfoItemsModel? naklInfoItems;
  @observable
  ObservableList<TovarArrayItems> naklInfoTovars =
      ObservableList<TovarArrayItems>();

  //product post
  @action
  saveDocument(
      {required NaklInfoItemsModel naklinfo_items_model,
      required TovarArrayItems tovarArrayItems,
      required BuildContext context}) async {
    final result = await ServicesResponsitorie.saveDocument(
        naklinfo_items_model: naklinfo_items_model,
        tovarArrayItems: tovarArrayItems,
        context: context);

   
    naklInfoTovars = result.tovar.asObservable();
  }

  @action
  deleteProduct(
      {required int id,
      required int id_d}) async {
    final result = await ServicesResponsitorie.deleteProduct(
    id: id, id_d: id_d);
   
    naklInfoItems = result.naklinfo;
    
    naklInfoTovars = result.tovar.asObservable();
  }

  @action
  createDocument(
      {required NaklInfoItemsModel naklinfo_items_model,
      required BuildContext context}) async {
    final result = await ServicesResponsitorie.createDocument(
    naklinfo_items_model: naklinfo_items_model, context: context);
   
    naklInfoItems = result.naklinfo;
  }
}
