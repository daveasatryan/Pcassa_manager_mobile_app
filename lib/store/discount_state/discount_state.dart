import 'package:mobx/mobx.dart';
import 'package:pcassa_retail/requests_settings/repositories/services_repository/services_repository.dart';

import '../../models/create_discount_model/create_discount_model.dart';
part 'discount_state.g.dart';

class CreatedDiscounts = CreatedDiscountsBase with _$CreatedDiscounts;

abstract class CreatedDiscountsBase with Store {
  @observable
  ObservableList<GetDiscountsModel> discountInfo =
      ObservableList<GetDiscountsModel>();

  //Get Discount
  @action
  getCreatedDiscounts() async {
    final result = await ServicesResponsitorie.getCreatedDiscount();
    discountInfo = result.asObservable();
  }

  //Save Discount
  @action
  saveDiscounts(
      {required id,
      required id_d,
      required name,
      required tip,
      required val,
      required status,
      required rejim}) async {
    final result = await ServicesResponsitorie.saveCreatedDiscount(
        id: id,
        id_d: id_d,
        name: name,
        rejim: rejim,
        status: status,
        tip: tip,
        val: val);
    discountInfo = result.asObservable();
  }

  //Delete Discount
  @action
  deleteDiscount({required id}) async {
    final result = await ServicesResponsitorie.deleteDiscount(id: id);
  }
}
