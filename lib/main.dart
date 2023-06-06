import 'dart:ui';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:get_it/get_it.dart';
import 'package:pcassa_retail/store/access_type_state/access_state.dart';
import 'package:pcassa_retail/store/act_realisation_state/act_realisation_state.dart';
import 'package:pcassa_retail/store/act_state/act_state.dart';
import 'package:pcassa_retail/store/act_view_state/act_view_state.dart';
import 'package:pcassa_retail/store/cash_order_state/cash_order_state.dart';
import 'package:pcassa_retail/store/category_state/category_state.dart';
import 'package:pcassa_retail/store/contragent_state/contragent_state.dart';
import 'package:pcassa_retail/store/currency_state/currency_state.dart';
import 'package:pcassa_retail/store/discount_state/discount_state.dart';
import 'package:pcassa_retail/store/kont_balance_state/kont_balance_state.dart';
import 'package:pcassa_retail/store/license_state/license_state.dart';
import 'package:pcassa_retail/store/login_state/login_state.dart';
import 'package:pcassa_retail/store/nakl_info_state/nakl_info_state.dart';
import 'package:pcassa_retail/store/oborot_vedom_state/oborot_vedom_state.dart';
import 'package:pcassa_retail/store/product_state/product_state.dart';
import 'package:pcassa_retail/store/remainder_items_state/remainder_items_state.dart';
import 'package:pcassa_retail/store/spent_state/spent_state.dart';
import 'package:pcassa_retail/store/station_type_state/station_type_state.dart';
import 'package:pcassa_retail/store/unit_state/unit_state.dart';
import 'package:pcassa_retail/store/user_state/user_state.dart';
import 'package:pcassa_retail/store/viruchka_state/viruchka_state.dart';
import 'package:pcassa_retail/store/warehouse_state/warehouse_state.dart';
import 'package:secure_shared_preferences/secure_shared_preferences.dart';
import '../constants/app_assets/app_assets.dart';
import '../constants/app_settings/app_settings.dart';
import '../requests_settings/dio_options/dio_options.dart';
import '../router/services.dart';
import '../store/authorization_state/authorization_state.dart';
import 'store/document_view_state/document_view_state.dart';
import 'store/get_saled_products_state/get_saled_products_state.dart';
import 'store/search_state/search_state.dart';

//Main Function
//com.ekey.pcassa_retail_manager
//Harut
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

//App Locale

  Locale deviceLocale = window.locale; // or html.window.locale

  final supportedLanguages = [
    deviceLocale,
    const Locale("hy"),
    const Locale("ru"),
    const Locale("en"),
  ];

  //App Settings
  AppSettings.licenseServer = 'http://192.168.0.107:8000';

  SecureSharedPref.getInstance().then((value) {
    value.getString("baseUrl", isEncrypted: false).then((value) {
      dio = Dio(
        BaseOptions(
          baseUrl: value.toString(),
          connectTimeout: 10000,
          receiveTimeout: 100000,
          contentType: Headers.jsonContentType,
        ),
      );
    });
  });
  //Request Settings

  dioLicense = Dio(
    BaseOptions(
      baseUrl: AppSettings.licenseServer,
      connectTimeout: 10000,
      receiveTimeout: 100000,
      contentType: Headers.jsonContentType,
    ),
  );

  //Store Registration

  GetIt.I.registerSingleton(AuthorizationState());
  GetIt.I.registerSingleton(UnitState());
  GetIt.I.registerSingleton(CategoryState());
  GetIt.I.registerSingleton(AccessState());
  GetIt.I.registerSingleton(LoginState());
  GetIt.I.registerSingleton(SpentState());
  GetIt.I.registerSingleton(WarehouseState());
  GetIt.I.registerSingleton(StationTypeState());
  GetIt.I.registerSingleton(CreatedUsers());
  GetIt.I.registerSingleton(CreatedDiscounts());
  GetIt.I.registerSingleton(CreatedCurrencys());
  GetIt.I.registerSingleton(CreatedProducts());
  GetIt.I.registerSingleton(ContragentState());
  GetIt.I.registerSingleton(SearchState());
  GetIt.I.registerSingleton(NaklInfoState());
  GetIt.I.registerSingleton(DocumentViewState());
  GetIt.I.registerSingleton(CashOrderState());
  GetIt.I.registerSingleton(ActState());
  GetIt.I.registerSingleton(ActViewState());
  GetIt.I.registerSingleton(RemainderItemsState());
  GetIt.I.registerSingleton(ActRealisationState());
  GetIt.I.registerSingleton(ViruchkaState());
  GetIt.I.registerSingleton(SaledProductsState());
  GetIt.I.registerSingleton(KontBalanceState());
  GetIt.I.registerSingleton(OborotVedomState());
  GetIt.I.registerSingleton(LicenseState());
  //Run App

  runApp(
    EasyLocalization(
        supportedLocales: supportedLanguages,
        useOnlyLangCode: true,
        startLocale: deviceLocale,
        useFallbackTranslations: true,
        path: Assets.languages,
        child: Phoenix(child: const MobileRetailManager())),
  );
}

//StateLessWidget MobileManager
class MobileRetailManager extends StatelessWidget {
  const MobileRetailManager({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: APP_NAME,
      debugShowCheckedModeBanner: false,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      localizationsDelegates: context.localizationDelegates,
      routerDelegate: router.delegate(),
      routeInformationParser: router.defaultRouteParser(),
    );
  }
}
