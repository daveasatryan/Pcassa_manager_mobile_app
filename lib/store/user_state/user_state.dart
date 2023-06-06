import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:pcassa_retail/requests_settings/repositories/services_repository/services_repository.dart';

import '../../models/create_user_model/create_user_model.dart';
import '../../models/user_card_model/user_card_model.dart';
import '../../requests_settings/repositories/authoriastion_repository/authorization_repository.dart';
import '../authorization_state/authorization_state.dart';
part 'user_state.g.dart';

class CreatedUsers = CreatedUsersBase with _$CreatedUsers;

abstract class CreatedUsersBase with Store {
  //Users List
  final authState = GetIt.I<AuthorizationState>();
  @observable
  ObservableList<CreateUserModel> usersInfo = ObservableList<CreateUserModel>();
  @observable
  ObservableList<String> usersFio = ObservableList<String>();

//Get User
  @action
  Future<void> getCreatedUsers() async {
    final result = await ServicesResponsitorie.getCreatedUsers();
    for (int i = 0; i < result.length; i++) {
      if (result[i].card.isEmpty) {
        result[i].card.add(CardModel(cod: "".tr(), shtrix: ""));
      }
    }
    usersInfo = result.asObservable();
  }

//Delete User
  @action
  Future<void> deleteUsers({required userId}) async {
    await ServicesResponsitorie.deleteUser(id: userId);
  }

  @action
  getFio() {
    usersFio.add("notSelected");
    for (int i = 0; i < usersInfo.length; i++) {
      usersFio.add(usersInfo[i].fio);
    }
  }

  //Save User
  @action
  Future<void> saveCreatedUser(
      {required String cod,
      required String fio,
      required String paswword,
      required String login,
      required int tip,
      required String tipdostupa,
      required String language,
      required int id,
      required int pin,
      required String shtrix}) async {
    final result = await ServicesResponsitorie.sendUpdateUserInfo(
        cod: cod,
        fio: fio,
        id: id,
        tip: tip,
        tipdostupa: tipdostupa,
        language: language,
        login: login,
        password: paswword,
        pin: pin,
        shtrix: shtrix);
    if (result.card.isEmpty) {
      result.card.add(CardModel(cod: "".tr(), shtrix: ""));
    }
    usersInfo.add(result);
  }

  changeUserLanguage(
      {required int id, required String tip, required String language}) async {
    final response = await AuthResponsitorie.changeUserLanguage(
        id: id, tip: tip, language: language);
    authState.currentUser = response;
  }
}
