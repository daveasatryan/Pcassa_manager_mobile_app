import 'package:mobx/mobx.dart';
import 'package:pcassa_retail/models/saled_product_items_model/saled_product_items_model.dart';
import 'package:pcassa_retail/requests_settings/repositories/services_repository/services_repository.dart';

part 'get_saled_products_state.g.dart';

//State for Autorisation
class SaledProductsState = SaledProductsStateBase with _$SaledProductsState;

abstract class SaledProductsStateBase with Store {
  @observable
  ObservableList<SaledItemsModel> saledItemsList =
      ObservableList<SaledItemsModel>();
  @observable
  int? summa;

  @action
  getSaledProducts({
    required String category_name,
    required String data_s,
    required String data_e,
    required String name,
    required String order_by,
  }) async {
    final result = await ServicesResponsitorie.getSaledProducts(
      category_name: category_name,
      data_e: data_e,
      data_s: data_s,
      name: name,
      order_by: order_by,
    );

    saledItemsList = result.items!.asObservable();
    summa = result.summa;
  }
}
