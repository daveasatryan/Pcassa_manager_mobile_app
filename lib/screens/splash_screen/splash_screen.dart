import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:pcassa_retail/constants/app_settings/app_settings.dart';
import 'package:pcassa_retail/constants/app_themes/app_lottie_animations/app_loading_animation/app_loading_animation.dart';
import 'package:pcassa_retail/error_handler/error_handler.dart';
import 'package:pcassa_retail/requests_settings/dio_options/dio_options.dart';
import 'package:pcassa_retail/requests_settings/repositories/authoriastion_repository/authorization_repository.dart';
import 'package:pcassa_retail/store/license_state/license_state.dart';
import 'package:secure_shared_preferences/secure_shared_preferences.dart';
import '../../constants/app_themes/app_colors/app_colors.dart';
import '../../store/authorization_state/authorization_state.dart';
import '../../store/loading_state/loading_state.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final loadingState = LoadingState();
  final authState = GetIt.I<AuthorizationState>();

  var licenseInfo = GetIt.I<LicenseState>();
Future<String?> _getId() async {
  var deviceInfo = DeviceInfoPlugin();
  if (Platform.isIOS) { // import 'dart:io'
    var iosDeviceInfo = await deviceInfo.iosInfo;
    return iosDeviceInfo.identifierForVendor; // Unique ID on iOS
  } else {
    var androidDeviceInfo = await deviceInfo.androidInfo;
    return androidDeviceInfo.id; // Unique ID on Android
  }
}
  @override
  void initState() {
    super.initState();
  _getId().then((id) {
  String? deviceId = id;
  print(deviceId);
  setState(() {
    AppSettings.deviceId=deviceId.toString();
  });
});

    SecureSharedPref.getInstance().then((value) {
      value.getString("licenseKey", isEncrypted: false).then((value) {
        setState(() {
          AppSettings.licenseKey = value.toString();
        });
      });
    });
     
    Future.delayed(Duration(seconds: 3), () async{
      print(AppSettings.licenseKey);
      try{
        await AuthResponsitorie.checkLicense(
          context: context,
          device_code: AppSettings.deviceId,
          license_key: AppSettings.licenseKey,
          product_id: 4);
      } on DioError catch (e) {
           ErrorHandler.errorModal(
            context: context,
            errorCode: e.response,
          );
        }
    });

     

 
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      backgroundColor: AppColors.appWhite,
      body: LoadingWidget(),
    );
  }
}
