import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:pcassa_retail/constants/app_settings/app_settings.dart';
import 'package:pcassa_retail/error_handler/error_handler.dart';
import 'package:pcassa_retail/requests_settings/repositories/authoriastion_repository/authorization_repository.dart';
import 'package:pcassa_retail/store/authorization_state/authorization_state.dart';
import 'package:pcassa_retail/store/license_state/license_state.dart';

import '../../router/router.gr.dart';
import '../../router/services.dart';

part 'loading_state.g.dart';

class LoadingState = LoadingStateBase with _$LoadingState;

//Access to AuthorizationState
  final authState = GetIt.I<AuthorizationState>();
  //Access to LoadingState
  final loadingState = LoadingState();
  
  
  var licenseInfo = GetIt.I<LicenseState>();
abstract class LoadingStateBase with Store {

  //Loading Status Defination
  
  @observable
  bool isLoading = false;

  @action
  void startLoading() {
    isLoading = true;
  }

  @action
  void stopLoading() {
    isLoading = false;
  }

//Functionality after app is running
  @action
    Future<void> afterFirstLayout({required BuildContext context}) async {
    try {
      
      final result = await AuthResponsitorie.getInfo(context: context);
      authState.info = result;
      await Future.delayed(const Duration(seconds:2));
      await router.replace(
        const LoginRoute(),
      );
    } catch(e){
      if(e is DioError){
 await ErrorHandler.errorModal(
        context: context,
        errorCode: e.response,
      );
      }
    }
      finally {
      loadingState.stopLoading();
    }
  }
}
