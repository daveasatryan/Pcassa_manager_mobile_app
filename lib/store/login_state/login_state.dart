import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:pcassa_retail/models/user_model/user_model.dart';
import 'package:pcassa_retail/requests_settings/repositories/authoriastion_repository/authorization_repository.dart';
import '../../error_handler/error_handler.dart';
import '../authorization_state/authorization_state.dart';

part 'login_state.g.dart';

class LoginState = LoginStateBase with _$LoginState;

abstract class LoginStateBase with Store {
  final authState = GetIt.I<AuthorizationState>();

  @observable
  String login = "";

  @observable
  String password = "";

//LogIn Function
  autorisationCheck({required BuildContext context}) async {
    final response = await AuthResponsitorie.logIn(
        login: login, password: password, context: context);
    authState.currentUser = response;
  }
}
