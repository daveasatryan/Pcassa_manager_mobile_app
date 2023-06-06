import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pcassa_retail/constants/app_assets/app_assets.dart';
import 'package:pcassa_retail/constants/app_settings/app_settings.dart';
import 'package:pcassa_retail/constants/app_themes/app_colors/app_colors.dart';
import 'package:pcassa_retail/constants/paddings_constants/padding_constants.dart';
import 'package:pcassa_retail/store/license_state/license_state.dart';
import 'package:pcassa_retail/store/loading_state/loading_state.dart';
import 'package:restart_app/restart_app.dart';

class LicenseScreen extends StatefulWidget {
  LicenseScreen({Key? key}) : super(key: key);
  static var uniqueCodeContraller = TextEditingController();
  @override
  State<LicenseScreen> createState() => _LicenseScreenState();
}

var licenseState = GetIt.I<LicenseState>();
final loadingState = LoadingState();
bool isLoading = false;

class _LicenseScreenState extends State<LicenseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.height / 28.1),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(Assets.logo,
                  height: MediaQuery.of(context).size.height / 7,
                  width: MediaQuery.of(context).size.height / 3.51),
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.height / 84.4),
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromRGBO(143, 148, 251, .2),
                          blurRadius: MediaQuery.of(context).size.height / 84.4,
                          offset: Offset(0, 10))
                    ]),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(loginPagePadding),
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(color: AppColors.appLightBlack))),
                      child: TextField(
                        textInputAction: TextInputAction.next,
                        controller: LicenseScreen.uniqueCodeContraller,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "uniqueCode".tr(),
                            hintStyle: TextStyle(color: Colors.grey[400])),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 28.1),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 16.88,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      MediaQuery.of(context).size.height / 84.4),
                  color: AppColors.appPurple,
                ),
                child: ElevatedButton(
                  onPressed: () async {
                    await licenseState.addLicense(
                        device_code: AppSettings.deviceId,
                        unique_code:
                            int.parse(LicenseScreen.uniqueCodeContraller.text),
                        product_id: 4);
                    await licenseState.setLicense();
                    await Restart.restartApp();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    // shape: RoundedRectangleBorder(borderRadius: borderRadius),
                  ),
                  child: isLoading
                      ? const CircularProgressIndicator(
                          color: AppColors.appWhite,
                        )
                      : Text("select".tr()),
                ),
              ),
            ]),
      ),
    );
  }
}
