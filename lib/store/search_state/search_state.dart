import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:pcassa_retail/models/access_type_model/access_type_model.dart';
import 'package:pcassa_retail/models/search_by_name_model/search_by_name_model.dart';
import '../../requests_settings/repositories/services_repository/services_repository.dart';

part 'search_state.g.dart';

//State for Autorisation
class SearchState = SearchStateBase with _$SearchState;

abstract class SearchStateBase with Store {
  @observable
  ObservableList<SearchByNameModel> searchResult =
      ObservableList<SearchByNameModel>();
        @observable
SearchByNameModel? searchResultByScan ;

  //Get accesstypes
  getProductByName(
      {required BuildContext context, required String productName}) async {
    final result = await ServicesResponsitorie.getProductByName(
        context: context, productName: productName);
    searchResult = result.asObservable();
  }

    //Get accesstypes
  getProductBybarcode(
      {required BuildContext context, required String barcode}) async {
    final result = await ServicesResponsitorie.getProductByBarcode(
        context: context, barcode: barcode);
    searchResultByScan = result;
  }
}
