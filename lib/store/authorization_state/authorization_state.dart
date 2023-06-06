import 'package:mobx/mobx.dart';
import 'package:pcassa_retail/router/router.gr.dart';
import 'package:pcassa_retail/router/router.gr.dart';
import '../../models/info_model/info_model.dart';
import '../../models/user_model/user_model.dart';
import '../../router/services.dart';
import '../../storage/storage.dart';

part 'authorization_state.g.dart';

//State for Autorisation
class AuthorizationState = AuthorizationStateBase with _$AuthorizationState;

abstract class AuthorizationStateBase with Store {
  //Info Model, is a model of information about retail request
  @observable
  InfoModel? info;

  //User Model, is a model of information about valid user request
  @observable
  UserModel? currentUser;

  @observable
  UserModel? language;

//LogOut Function (clear storage)
  @action
  void logOut() {
   //StorageUtil.clearStorage();
    currentUser = null;
    router.replace(const LoginRoute());
  }
}