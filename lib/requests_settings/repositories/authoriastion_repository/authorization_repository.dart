import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:pcassa_retail/constants/app_settings/app_settings.dart';
import 'package:pcassa_retail/models/add_license_model/add_license_model.dart';
import 'package:pcassa_retail/router/router.gr.dart';
import 'package:pcassa_retail/router/services.dart';
import 'package:pcassa_retail/screens/license_add_screen/license_add_screen.dart';
import 'package:pcassa_retail/store/license_state/license_state.dart';
import '../../../error_handler/error_handler.dart';
import '../../../models/info_model/info_model.dart';
import '../../../models/user_model/user_model.dart';
import '../../dio_options/dio_options.dart';
import '../../requests/requests.dart';

//There is all requests about Autorisation functional
class AuthResponsitorie {
  var licenseInfo = GetIt.I<LicenseState>();

//Get Info Request
  static Future<InfoModel> getInfo({required BuildContext context}) async {
    final response = await dio.get(
      Requests.info,
    );
    return InfoModel.fromJson(response.data);
  }

//Login Request
  static Future<UserModel> logIn(
      {required String login,
      required String password,
      required BuildContext context}) async {
    final response = await dio.post(
      Requests.login,
      options: Options(
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
      ),
      data: {
        "password": password,
        "login": login,
      },
    );
    return UserModel.fromJson(response.data);
  }

  static Future<UserModel> changeUserLanguage(
      {required int id, required String tip, required String language}) async {
    final response = await dio.post(
      Requests.changeLanguage,
      data: {"id": id, "tip": tip, "language": language},
    );
    return UserModel.fromJson(response.data);
  }

  static Future<AddLicenseModel> addLicense(
      {required int unique_code,
      required String device_code,
      required int product_id}) async {
    final response = await dioLicense.post(
      Requests.addLicense,
      data: {
        "unique_code": unique_code,
        "device_code": device_code,
        "product_id": product_id
      },
    );
    return AddLicenseModel.fromJson(response.data);
  }

  static Future checkLicense(
      {required BuildContext context,
      required int product_id,
      required String device_code,
      required String license_key}) async {
    print(AppSettings.licenseKey);
    final response = await dioLicense.post(
      Requests.checklicense,
      data: {
        "product_id": product_id,
        "device_code": device_code,
        "license_key": license_key
      },
    );
    if (response.data["state"] == 0) {
      router.replace(LicenseRoute());
    } else if (response.data["state"] == true) {
      loadingState.startLoading();

      //After Run app
      WidgetsBinding.instance.addPostFrameCallback(
        (_) => loadingState.afterFirstLayout(context: context),
      );
    } else if (response.data["state"] == false) {
      router.replace(NeedToPay());
      print("delfinFalse");
    }
  }
}
