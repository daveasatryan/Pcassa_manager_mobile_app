import 'package:mobx/mobx.dart';
import 'package:pcassa_retail/models/category_type_model/category_type_model.dart';

import '../../requests_settings/repositories/services_repository/services_repository.dart';
part 'category_state.g.dart';

class CategoryState = CategoryStateBase with _$CategoryState;

abstract class CategoryStateBase with Store {
 //Product category List
  @observable
  ObservableList<CategorytypeModel> categoryTypeList =
      ObservableList<CategorytypeModel>();

//Get category
@action
getCategory()async{
   final result = await ServicesResponsitorie.getCategoryType();
    categoryTypeList = result.asObservable();
}

//Post category
@action
postCategory({required guid, required name})async{
   final result = await ServicesResponsitorie.postCategoryType(name: name, guid: guid);
    categoryTypeList = result.asObservable();
}

//Delete category
@action
deleteCategory({required guid})async{
   final result = await ServicesResponsitorie.delCategoryType( guid: guid);
    categoryTypeList = result.asObservable();
}
}
