// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i35;
import 'package:flutter/material.dart' as _i36;

import '../enums/main_screen_navigation_enum/documents_screen_enum.dart'
    as _i38;
import '../enums/main_screen_navigation_enum/main_screen_navigations.dart'
    as _i37;
import '../screens/access_screen/access_screen.dart' as _i16;
import '../screens/access_screen/access_type_config_screen/access_type_config_screen.dart'
    as _i17;
import '../screens/act_realisation_screen/act_realisation_screen.dart' as _i28;
import '../screens/act_screen/created_act_view.dart' as _i4;
import '../screens/act_screen/inner_of_act_screen.dart' as _i3;
import '../screens/category_screen/category_screen.dart' as _i15;
import '../screens/contragents_screen/contragents_elements_screen/contragents_elements_screen.dart'
    as _i22;
import '../screens/contragents_screen/contragents_screen.dart' as _i21;
import '../screens/currencys_screen/currency_navigation_widget/currency_navigation_widget.dart'
    as _i9;
import '../screens/currencys_screen/currency_screen_widgets/currencys_screen.dart'
    as _i8;
import '../screens/discounts_screen/discount_navigation_widget/discount_navigation_widget.dart'
    as _i10;
import '../screens/discounts_screen/discounts_screen.dart' as _i7;
import '../screens/documents_screen/created_document_view.dart' as _i24;
import '../screens/documents_screen/documents_screen.dart' as _i23;
import '../screens/documents_screen/rko_pko/document_type_draw.dart' as _i25;
import '../screens/documents_screen/rko_pko/documents_list.dart' as _i26;
import '../screens/kontragent_balance_screen/kontragent_balance_screen.dart'
    as _i31;
import '../screens/license_add_screen/license_add_screen.dart' as _i33;
import '../screens/license_add_screen/need_to_pay.dart' as _i34;
import '../screens/login_screen/login_screen.dart' as _i2;
import '../screens/main_screen/main_screen.dart' as _i5;
import '../screens/oborot_vedom_screen/oborot_vedom_screen.dart' as _i32;
import '../screens/product_unit_screen/product_unit_screen.dart' as _i14;
import '../screens/products_screen/product_elements_screen/products_elements_sreen.dart'
    as _i12;
import '../screens/products_screen/products_group_screen/products_group_screen.dart'
    as _i11;
import '../screens/remainder_screen/remainder_screen.dart' as _i27;
import '../screens/saled_products_screen/saled_products_screen.dart' as _i30;
import '../screens/settings_screen/settings_screen.dart' as _i13;
import '../screens/spent_screen/spent_screen.dart' as _i18;
import '../screens/splash_screen/splash_screen.dart' as _i1;
import '../screens/stationtype_screen/stationtype_screen.dart' as _i20;
import '../screens/users_screen/users_screen.dart' as _i6;
import '../screens/viruchka_screen/viruchka_screen.dart' as _i29;
import '../screens/warehouse_screen/warehouse_screen.dart' as _i19;

class Router extends _i35.RootStackRouter {
  Router([_i36.GlobalKey<_i36.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i35.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i35.CustomPage<void>(
        routeData: routeData,
        child: const _i1.SplashScreen(),
        transitionsBuilder: _i35.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    LoginRoute.name: (routeData) {
      return _i35.CustomPage<void>(
        routeData: routeData,
        child: const _i2.LoginScreen(),
        transitionsBuilder: _i35.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    InnerContentOfActRoute.name: (routeData) {
      return _i35.CustomPage<void>(
        routeData: routeData,
        child: const _i3.InnerContentOfAct(),
        transitionsBuilder: _i35.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    CreatedActViewRoute.name: (routeData) {
      return _i35.CustomPage<void>(
        routeData: routeData,
        child: const _i4.CreatedActView(),
        transitionsBuilder: _i35.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    MainRoute.name: (routeData) {
      return _i35.CustomPage<void>(
        routeData: routeData,
        child: const _i5.MainScreen(),
        transitionsBuilder: _i35.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    UsersRoute.name: (routeData) {
      final args = routeData.argsAs<UsersRouteArgs>();
      return _i35.CustomPage<void>(
        routeData: routeData,
        child: _i6.UsersScreen(
          key: args.key,
          quickMenuPagesType: args.quickMenuPagesType,
        ),
        transitionsBuilder: _i35.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    DiscountsRoute.name: (routeData) {
      final args = routeData.argsAs<DiscountsRouteArgs>();
      return _i35.CustomPage<void>(
        routeData: routeData,
        child: _i7.DiscountsScreen(
          key: args.key,
          quickMenuPagesType: args.quickMenuPagesType,
          idd: args.idd,
        ),
        transitionsBuilder: _i35.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    CurrencysRoute.name: (routeData) {
      final args = routeData.argsAs<CurrencysRouteArgs>();
      return _i35.CustomPage<void>(
        routeData: routeData,
        child: _i8.CurrencysScreen(
          key: args.key,
          currencyPageTypeCaption: args.currencyPageTypeCaption,
          currencyPageTypeGuid: args.currencyPageTypeGuid,
        ),
        transitionsBuilder: _i35.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    CurrencyNavigationPage.name: (routeData) {
      final args = routeData.argsAs<CurrencyNavigationPageArgs>();
      return _i35.CustomPage<void>(
        routeData: routeData,
        child: _i9.CurrencyNavigationPage(
          key: args.key,
          quickMenuPagesType: args.quickMenuPagesType,
        ),
        transitionsBuilder: _i35.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    DiscountNavigationPage.name: (routeData) {
      final args = routeData.argsAs<DiscountNavigationPageArgs>();
      return _i35.CustomPage<void>(
        routeData: routeData,
        child: _i10.DiscountNavigationPage(
          key: args.key,
          quickMenuPagesType: args.quickMenuPagesType,
        ),
        transitionsBuilder: _i35.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ProductsGroupRoute.name: (routeData) {
      return _i35.CustomPage<void>(
        routeData: routeData,
        child: const _i11.ProductsGroupScreen(),
        transitionsBuilder: _i35.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    Products.name: (routeData) {
      final args = routeData.argsAs<ProductsArgs>();
      return _i35.CustomPage<void>(
        routeData: routeData,
        child: _i12.Products(
          key: args.key,
          mainCategoryName: args.mainCategoryName,
          isRoot: args.isRoot,
          mainCategoryGuid: args.mainCategoryGuid,
        ),
        transitionsBuilder: _i35.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    SettingsRoute.name: (routeData) {
      return _i35.CustomPage<void>(
        routeData: routeData,
        child: const _i13.SettingsScreen(),
        transitionsBuilder: _i35.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    UnitRoute.name: (routeData) {
      return _i35.CustomPage<void>(
        routeData: routeData,
        child: const _i14.UnitScreen(),
        transitionsBuilder: _i35.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    CategoryRoute.name: (routeData) {
      return _i35.CustomPage<void>(
        routeData: routeData,
        child: const _i15.CategoryScreen(),
        transitionsBuilder: _i35.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    AccessRoute.name: (routeData) {
      return _i35.CustomPage<void>(
        routeData: routeData,
        child: const _i16.AccessScreen(),
        transitionsBuilder: _i35.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    AccessTypeConfigRoute.name: (routeData) {
      final args = routeData.argsAs<AccessTypeConfigRouteArgs>();
      return _i35.CustomPage<void>(
        routeData: routeData,
        child: _i17.AccessTypeConfigScreen(
          key: args.key,
          id: args.id,
        ),
        transitionsBuilder: _i35.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    SpentRoute.name: (routeData) {
      return _i35.CustomPage<void>(
        routeData: routeData,
        child: const _i18.SpentScreen(),
        transitionsBuilder: _i35.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    WarehouseRoute.name: (routeData) {
      return _i35.CustomPage<void>(
        routeData: routeData,
        child: const _i19.WarehouseScreen(),
        transitionsBuilder: _i35.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    StationTypeRoute.name: (routeData) {
      return _i35.CustomPage<void>(
        routeData: routeData,
        child: const _i20.StationTypeScreen(),
        transitionsBuilder: _i35.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    Contragents.name: (routeData) {
      return _i35.CustomPage<void>(
        routeData: routeData,
        child: const _i21.Contragents(),
        transitionsBuilder: _i35.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ContragentElementRoute.name: (routeData) {
      final args = routeData.argsAs<ContragentElementRouteArgs>();
      return _i35.CustomPage<void>(
        routeData: routeData,
        child: _i22.ContragentElementScreen(
          key: args.key,
          mainCategoryName: args.mainCategoryName,
          isRoot: args.isRoot,
          mainCategoryGuid: args.mainCategoryGuid,
        ),
        transitionsBuilder: _i35.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    DocumentRoute.name: (routeData) {
      final args = routeData.argsAs<DocumentRouteArgs>();
      return _i35.CustomPage<void>(
        routeData: routeData,
        child: _i23.DocumentScreen(
          key: args.key,
          documentsScreenType: args.documentsScreenType,
        ),
        transitionsBuilder: _i35.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    CreatedDocumentView.name: (routeData) {
      return _i35.CustomPage<void>(
        routeData: routeData,
        child: const _i24.CreatedDocumentView(),
        transitionsBuilder: _i35.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    DocumentTypeDraw.name: (routeData) {
      final args = routeData.argsAs<DocumentTypeDrawArgs>();
      return _i35.CustomPage<void>(
        routeData: routeData,
        child: _i25.DocumentTypeDraw(
          key: args.key,
          documentCod: args.documentCod,
          documentName: args.documentName,
        ),
        transitionsBuilder: _i35.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    RkoPkoList.name: (routeData) {
      return _i35.CustomPage<void>(
        routeData: routeData,
        child: const _i26.RkoPkoList(),
        transitionsBuilder: _i35.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    RemainderRoute.name: (routeData) {
      return _i35.CustomPage<void>(
        routeData: routeData,
        child: const _i27.RemainderScreen(),
        transitionsBuilder: _i35.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ActRealisationRoute.name: (routeData) {
      return _i35.CustomPage<void>(
        routeData: routeData,
        child: const _i28.ActRealisationScreen(),
        transitionsBuilder: _i35.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ViruchkaRoute.name: (routeData) {
      return _i35.CustomPage<void>(
        routeData: routeData,
        child: const _i29.ViruchkaScreen(),
        transitionsBuilder: _i35.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    SaledProductRoute.name: (routeData) {
      return _i35.CustomPage<void>(
        routeData: routeData,
        child: const _i30.SaledProductScreen(),
        transitionsBuilder: _i35.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    KontragentBalanceReport.name: (routeData) {
      final args = routeData.argsAs<KontragentBalanceReportArgs>(
          orElse: () => const KontragentBalanceReportArgs());
      return _i35.CustomPage<void>(
        routeData: routeData,
        child: _i31.KontragentBalanceReport(key: args.key),
        transitionsBuilder: _i35.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    OborotVedomRoute.name: (routeData) {
      return _i35.CustomPage<void>(
        routeData: routeData,
        child: const _i32.OborotVedomScreen(),
        transitionsBuilder: _i35.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    LicenseRoute.name: (routeData) {
      final args = routeData.argsAs<LicenseRouteArgs>(
          orElse: () => const LicenseRouteArgs());
      return _i35.CustomPage<void>(
        routeData: routeData,
        child: _i33.LicenseScreen(key: args.key),
        transitionsBuilder: _i35.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    NeedToPay.name: (routeData) {
      final args =
          routeData.argsAs<NeedToPayArgs>(orElse: () => const NeedToPayArgs());
      return _i35.CustomPage<void>(
        routeData: routeData,
        child: _i34.NeedToPay(key: args.key),
        transitionsBuilder: _i35.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<_i35.RouteConfig> get routes => [
        _i35.RouteConfig(
          SplashRoute.name,
          path: '/',
        ),
        _i35.RouteConfig(
          LoginRoute.name,
          path: '/',
        ),
        _i35.RouteConfig(
          InnerContentOfActRoute.name,
          path: '/',
        ),
        _i35.RouteConfig(
          CreatedActViewRoute.name,
          path: '/',
        ),
        _i35.RouteConfig(
          MainRoute.name,
          path: '/',
        ),
        _i35.RouteConfig(
          UsersRoute.name,
          path: '/',
        ),
        _i35.RouteConfig(
          DiscountsRoute.name,
          path: '/',
        ),
        _i35.RouteConfig(
          CurrencysRoute.name,
          path: '/',
        ),
        _i35.RouteConfig(
          CurrencyNavigationPage.name,
          path: '/',
        ),
        _i35.RouteConfig(
          DiscountNavigationPage.name,
          path: '/',
        ),
        _i35.RouteConfig(
          ProductsGroupRoute.name,
          path: '/',
        ),
        _i35.RouteConfig(
          Products.name,
          path: '/',
        ),
        _i35.RouteConfig(
          SettingsRoute.name,
          path: '/',
        ),
        _i35.RouteConfig(
          UnitRoute.name,
          path: '/',
        ),
        _i35.RouteConfig(
          CategoryRoute.name,
          path: '/',
        ),
        _i35.RouteConfig(
          AccessRoute.name,
          path: '/',
        ),
        _i35.RouteConfig(
          AccessTypeConfigRoute.name,
          path: '/',
        ),
        _i35.RouteConfig(
          SpentRoute.name,
          path: '/',
        ),
        _i35.RouteConfig(
          WarehouseRoute.name,
          path: '/',
        ),
        _i35.RouteConfig(
          StationTypeRoute.name,
          path: '/station-type-screen',
        ),
        _i35.RouteConfig(
          Contragents.name,
          path: '/Contragents',
        ),
        _i35.RouteConfig(
          ContragentElementRoute.name,
          path: '/contragent-element-screen',
        ),
        _i35.RouteConfig(
          DocumentRoute.name,
          path: '/document-screen',
        ),
        _i35.RouteConfig(
          CreatedDocumentView.name,
          path: '/created-document-view',
        ),
        _i35.RouteConfig(
          DocumentTypeDraw.name,
          path: '/document-type-draw',
        ),
        _i35.RouteConfig(
          RkoPkoList.name,
          path: '/rko-pko-list',
        ),
        _i35.RouteConfig(
          RemainderRoute.name,
          path: '/remainder-screen',
        ),
        _i35.RouteConfig(
          ActRealisationRoute.name,
          path: '/act-realisation-screen',
        ),
        _i35.RouteConfig(
          ViruchkaRoute.name,
          path: '/viruchka-screen',
        ),
        _i35.RouteConfig(
          SaledProductRoute.name,
          path: '/saled-product-screen',
        ),
        _i35.RouteConfig(
          KontragentBalanceReport.name,
          path: '/kontragent-balance-report',
        ),
        _i35.RouteConfig(
          OborotVedomRoute.name,
          path: '/oborot-vedom-screen',
        ),
        _i35.RouteConfig(
          LicenseRoute.name,
          path: '/license-screen',
        ),
        _i35.RouteConfig(
          NeedToPay.name,
          path: '/need-to-pay',
        ),
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashRoute extends _i35.PageRouteInfo<void> {
  const SplashRoute()
      : super(
          SplashRoute.name,
          path: '/',
        );

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.LoginScreen]
class LoginRoute extends _i35.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: '/',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i3.InnerContentOfAct]
class InnerContentOfActRoute extends _i35.PageRouteInfo<void> {
  const InnerContentOfActRoute()
      : super(
          InnerContentOfActRoute.name,
          path: '/',
        );

  static const String name = 'InnerContentOfActRoute';
}

/// generated route for
/// [_i4.CreatedActView]
class CreatedActViewRoute extends _i35.PageRouteInfo<void> {
  const CreatedActViewRoute()
      : super(
          CreatedActViewRoute.name,
          path: '/',
        );

  static const String name = 'CreatedActViewRoute';
}

/// generated route for
/// [_i5.MainScreen]
class MainRoute extends _i35.PageRouteInfo<void> {
  const MainRoute()
      : super(
          MainRoute.name,
          path: '/',
        );

  static const String name = 'MainRoute';
}

/// generated route for
/// [_i6.UsersScreen]
class UsersRoute extends _i35.PageRouteInfo<UsersRouteArgs> {
  UsersRoute({
    _i36.Key? key,
    required _i37.QuickMenuPagesType quickMenuPagesType,
  }) : super(
          UsersRoute.name,
          path: '/',
          args: UsersRouteArgs(
            key: key,
            quickMenuPagesType: quickMenuPagesType,
          ),
        );

  static const String name = 'UsersRoute';
}

class UsersRouteArgs {
  const UsersRouteArgs({
    this.key,
    required this.quickMenuPagesType,
  });

  final _i36.Key? key;

  final _i37.QuickMenuPagesType quickMenuPagesType;

  @override
  String toString() {
    return 'UsersRouteArgs{key: $key, quickMenuPagesType: $quickMenuPagesType}';
  }
}

/// generated route for
/// [_i7.DiscountsScreen]
class DiscountsRoute extends _i35.PageRouteInfo<DiscountsRouteArgs> {
  DiscountsRoute({
    _i36.Key? key,
    required _i37.QuickMenuPagesType quickMenuPagesType,
    required dynamic idd,
  }) : super(
          DiscountsRoute.name,
          path: '/',
          args: DiscountsRouteArgs(
            key: key,
            quickMenuPagesType: quickMenuPagesType,
            idd: idd,
          ),
        );

  static const String name = 'DiscountsRoute';
}

class DiscountsRouteArgs {
  const DiscountsRouteArgs({
    this.key,
    required this.quickMenuPagesType,
    required this.idd,
  });

  final _i36.Key? key;

  final _i37.QuickMenuPagesType quickMenuPagesType;

  final dynamic idd;

  @override
  String toString() {
    return 'DiscountsRouteArgs{key: $key, quickMenuPagesType: $quickMenuPagesType, idd: $idd}';
  }
}

/// generated route for
/// [_i8.CurrencysScreen]
class CurrencysRoute extends _i35.PageRouteInfo<CurrencysRouteArgs> {
  CurrencysRoute({
    _i36.Key? key,
    required dynamic currencyPageTypeCaption,
    required dynamic currencyPageTypeGuid,
  }) : super(
          CurrencysRoute.name,
          path: '/',
          args: CurrencysRouteArgs(
            key: key,
            currencyPageTypeCaption: currencyPageTypeCaption,
            currencyPageTypeGuid: currencyPageTypeGuid,
          ),
        );

  static const String name = 'CurrencysRoute';
}

class CurrencysRouteArgs {
  const CurrencysRouteArgs({
    this.key,
    required this.currencyPageTypeCaption,
    required this.currencyPageTypeGuid,
  });

  final _i36.Key? key;

  final dynamic currencyPageTypeCaption;

  final dynamic currencyPageTypeGuid;

  @override
  String toString() {
    return 'CurrencysRouteArgs{key: $key, currencyPageTypeCaption: $currencyPageTypeCaption, currencyPageTypeGuid: $currencyPageTypeGuid}';
  }
}

/// generated route for
/// [_i9.CurrencyNavigationPage]
class CurrencyNavigationPage
    extends _i35.PageRouteInfo<CurrencyNavigationPageArgs> {
  CurrencyNavigationPage({
    _i36.Key? key,
    required _i37.QuickMenuPagesType quickMenuPagesType,
  }) : super(
          CurrencyNavigationPage.name,
          path: '/',
          args: CurrencyNavigationPageArgs(
            key: key,
            quickMenuPagesType: quickMenuPagesType,
          ),
        );

  static const String name = 'CurrencyNavigationPage';
}

class CurrencyNavigationPageArgs {
  const CurrencyNavigationPageArgs({
    this.key,
    required this.quickMenuPagesType,
  });

  final _i36.Key? key;

  final _i37.QuickMenuPagesType quickMenuPagesType;

  @override
  String toString() {
    return 'CurrencyNavigationPageArgs{key: $key, quickMenuPagesType: $quickMenuPagesType}';
  }
}

/// generated route for
/// [_i10.DiscountNavigationPage]
class DiscountNavigationPage
    extends _i35.PageRouteInfo<DiscountNavigationPageArgs> {
  DiscountNavigationPage({
    _i36.Key? key,
    required _i37.QuickMenuPagesType quickMenuPagesType,
  }) : super(
          DiscountNavigationPage.name,
          path: '/',
          args: DiscountNavigationPageArgs(
            key: key,
            quickMenuPagesType: quickMenuPagesType,
          ),
        );

  static const String name = 'DiscountNavigationPage';
}

class DiscountNavigationPageArgs {
  const DiscountNavigationPageArgs({
    this.key,
    required this.quickMenuPagesType,
  });

  final _i36.Key? key;

  final _i37.QuickMenuPagesType quickMenuPagesType;

  @override
  String toString() {
    return 'DiscountNavigationPageArgs{key: $key, quickMenuPagesType: $quickMenuPagesType}';
  }
}

/// generated route for
/// [_i11.ProductsGroupScreen]
class ProductsGroupRoute extends _i35.PageRouteInfo<void> {
  const ProductsGroupRoute()
      : super(
          ProductsGroupRoute.name,
          path: '/',
        );

  static const String name = 'ProductsGroupRoute';
}

/// generated route for
/// [_i12.Products]
class Products extends _i35.PageRouteInfo<ProductsArgs> {
  Products({
    _i36.Key? key,
    required dynamic mainCategoryName,
    required dynamic isRoot,
    required dynamic mainCategoryGuid,
  }) : super(
          Products.name,
          path: '/',
          args: ProductsArgs(
            key: key,
            mainCategoryName: mainCategoryName,
            isRoot: isRoot,
            mainCategoryGuid: mainCategoryGuid,
          ),
        );

  static const String name = 'Products';
}

class ProductsArgs {
  const ProductsArgs({
    this.key,
    required this.mainCategoryName,
    required this.isRoot,
    required this.mainCategoryGuid,
  });

  final _i36.Key? key;

  final dynamic mainCategoryName;

  final dynamic isRoot;

  final dynamic mainCategoryGuid;

  @override
  String toString() {
    return 'ProductsArgs{key: $key, mainCategoryName: $mainCategoryName, isRoot: $isRoot, mainCategoryGuid: $mainCategoryGuid}';
  }
}

/// generated route for
/// [_i13.SettingsScreen]
class SettingsRoute extends _i35.PageRouteInfo<void> {
  const SettingsRoute()
      : super(
          SettingsRoute.name,
          path: '/',
        );

  static const String name = 'SettingsRoute';
}

/// generated route for
/// [_i14.UnitScreen]
class UnitRoute extends _i35.PageRouteInfo<void> {
  const UnitRoute()
      : super(
          UnitRoute.name,
          path: '/',
        );

  static const String name = 'UnitRoute';
}

/// generated route for
/// [_i15.CategoryScreen]
class CategoryRoute extends _i35.PageRouteInfo<void> {
  const CategoryRoute()
      : super(
          CategoryRoute.name,
          path: '/',
        );

  static const String name = 'CategoryRoute';
}

/// generated route for
/// [_i16.AccessScreen]
class AccessRoute extends _i35.PageRouteInfo<void> {
  const AccessRoute()
      : super(
          AccessRoute.name,
          path: '/',
        );

  static const String name = 'AccessRoute';
}

/// generated route for
/// [_i17.AccessTypeConfigScreen]
class AccessTypeConfigRoute
    extends _i35.PageRouteInfo<AccessTypeConfigRouteArgs> {
  AccessTypeConfigRoute({
    _i36.Key? key,
    required dynamic id,
  }) : super(
          AccessTypeConfigRoute.name,
          path: '/',
          args: AccessTypeConfigRouteArgs(
            key: key,
            id: id,
          ),
        );

  static const String name = 'AccessTypeConfigRoute';
}

class AccessTypeConfigRouteArgs {
  const AccessTypeConfigRouteArgs({
    this.key,
    required this.id,
  });

  final _i36.Key? key;

  final dynamic id;

  @override
  String toString() {
    return 'AccessTypeConfigRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i18.SpentScreen]
class SpentRoute extends _i35.PageRouteInfo<void> {
  const SpentRoute()
      : super(
          SpentRoute.name,
          path: '/',
        );

  static const String name = 'SpentRoute';
}

/// generated route for
/// [_i19.WarehouseScreen]
class WarehouseRoute extends _i35.PageRouteInfo<void> {
  const WarehouseRoute()
      : super(
          WarehouseRoute.name,
          path: '/',
        );

  static const String name = 'WarehouseRoute';
}

/// generated route for
/// [_i20.StationTypeScreen]
class StationTypeRoute extends _i35.PageRouteInfo<void> {
  const StationTypeRoute()
      : super(
          StationTypeRoute.name,
          path: '/station-type-screen',
        );

  static const String name = 'StationTypeRoute';
}

/// generated route for
/// [_i21.Contragents]
class Contragents extends _i35.PageRouteInfo<void> {
  const Contragents()
      : super(
          Contragents.name,
          path: '/Contragents',
        );

  static const String name = 'Contragents';
}

/// generated route for
/// [_i22.ContragentElementScreen]
class ContragentElementRoute
    extends _i35.PageRouteInfo<ContragentElementRouteArgs> {
  ContragentElementRoute({
    _i36.Key? key,
    required dynamic mainCategoryName,
    required dynamic isRoot,
    required dynamic mainCategoryGuid,
  }) : super(
          ContragentElementRoute.name,
          path: '/contragent-element-screen',
          args: ContragentElementRouteArgs(
            key: key,
            mainCategoryName: mainCategoryName,
            isRoot: isRoot,
            mainCategoryGuid: mainCategoryGuid,
          ),
        );

  static const String name = 'ContragentElementRoute';
}

class ContragentElementRouteArgs {
  const ContragentElementRouteArgs({
    this.key,
    required this.mainCategoryName,
    required this.isRoot,
    required this.mainCategoryGuid,
  });

  final _i36.Key? key;

  final dynamic mainCategoryName;

  final dynamic isRoot;

  final dynamic mainCategoryGuid;

  @override
  String toString() {
    return 'ContragentElementRouteArgs{key: $key, mainCategoryName: $mainCategoryName, isRoot: $isRoot, mainCategoryGuid: $mainCategoryGuid}';
  }
}

/// generated route for
/// [_i23.DocumentScreen]
class DocumentRoute extends _i35.PageRouteInfo<DocumentRouteArgs> {
  DocumentRoute({
    _i36.Key? key,
    required _i38.DocumentsScreenType documentsScreenType,
  }) : super(
          DocumentRoute.name,
          path: '/document-screen',
          args: DocumentRouteArgs(
            key: key,
            documentsScreenType: documentsScreenType,
          ),
        );

  static const String name = 'DocumentRoute';
}

class DocumentRouteArgs {
  const DocumentRouteArgs({
    this.key,
    required this.documentsScreenType,
  });

  final _i36.Key? key;

  final _i38.DocumentsScreenType documentsScreenType;

  @override
  String toString() {
    return 'DocumentRouteArgs{key: $key, documentsScreenType: $documentsScreenType}';
  }
}

/// generated route for
/// [_i24.CreatedDocumentView]
class CreatedDocumentView extends _i35.PageRouteInfo<void> {
  const CreatedDocumentView()
      : super(
          CreatedDocumentView.name,
          path: '/created-document-view',
        );

  static const String name = 'CreatedDocumentView';
}

/// generated route for
/// [_i25.DocumentTypeDraw]
class DocumentTypeDraw extends _i35.PageRouteInfo<DocumentTypeDrawArgs> {
  DocumentTypeDraw({
    _i36.Key? key,
    required int documentCod,
    required String documentName,
  }) : super(
          DocumentTypeDraw.name,
          path: '/document-type-draw',
          args: DocumentTypeDrawArgs(
            key: key,
            documentCod: documentCod,
            documentName: documentName,
          ),
        );

  static const String name = 'DocumentTypeDraw';
}

class DocumentTypeDrawArgs {
  const DocumentTypeDrawArgs({
    this.key,
    required this.documentCod,
    required this.documentName,
  });

  final _i36.Key? key;

  final int documentCod;

  final String documentName;

  @override
  String toString() {
    return 'DocumentTypeDrawArgs{key: $key, documentCod: $documentCod, documentName: $documentName}';
  }
}

/// generated route for
/// [_i26.RkoPkoList]
class RkoPkoList extends _i35.PageRouteInfo<void> {
  const RkoPkoList()
      : super(
          RkoPkoList.name,
          path: '/rko-pko-list',
        );

  static const String name = 'RkoPkoList';
}

/// generated route for
/// [_i27.RemainderScreen]
class RemainderRoute extends _i35.PageRouteInfo<void> {
  const RemainderRoute()
      : super(
          RemainderRoute.name,
          path: '/remainder-screen',
        );

  static const String name = 'RemainderRoute';
}

/// generated route for
/// [_i28.ActRealisationScreen]
class ActRealisationRoute extends _i35.PageRouteInfo<void> {
  const ActRealisationRoute()
      : super(
          ActRealisationRoute.name,
          path: '/act-realisation-screen',
        );

  static const String name = 'ActRealisationRoute';
}

/// generated route for
/// [_i29.ViruchkaScreen]
class ViruchkaRoute extends _i35.PageRouteInfo<void> {
  const ViruchkaRoute()
      : super(
          ViruchkaRoute.name,
          path: '/viruchka-screen',
        );

  static const String name = 'ViruchkaRoute';
}

/// generated route for
/// [_i30.SaledProductScreen]
class SaledProductRoute extends _i35.PageRouteInfo<void> {
  const SaledProductRoute()
      : super(
          SaledProductRoute.name,
          path: '/saled-product-screen',
        );

  static const String name = 'SaledProductRoute';
}

/// generated route for
/// [_i31.KontragentBalanceReport]
class KontragentBalanceReport
    extends _i35.PageRouteInfo<KontragentBalanceReportArgs> {
  KontragentBalanceReport({_i36.Key? key})
      : super(
          KontragentBalanceReport.name,
          path: '/kontragent-balance-report',
          args: KontragentBalanceReportArgs(key: key),
        );

  static const String name = 'KontragentBalanceReport';
}

class KontragentBalanceReportArgs {
  const KontragentBalanceReportArgs({this.key});

  final _i36.Key? key;

  @override
  String toString() {
    return 'KontragentBalanceReportArgs{key: $key}';
  }
}

/// generated route for
/// [_i32.OborotVedomScreen]
class OborotVedomRoute extends _i35.PageRouteInfo<void> {
  const OborotVedomRoute()
      : super(
          OborotVedomRoute.name,
          path: '/oborot-vedom-screen',
        );

  static const String name = 'OborotVedomRoute';
}

/// generated route for
/// [_i33.LicenseScreen]
class LicenseRoute extends _i35.PageRouteInfo<LicenseRouteArgs> {
  LicenseRoute({_i36.Key? key})
      : super(
          LicenseRoute.name,
          path: '/license-screen',
          args: LicenseRouteArgs(key: key),
        );

  static const String name = 'LicenseRoute';
}

class LicenseRouteArgs {
  const LicenseRouteArgs({this.key});

  final _i36.Key? key;

  @override
  String toString() {
    return 'LicenseRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i34.NeedToPay]
class NeedToPay extends _i35.PageRouteInfo<NeedToPayArgs> {
  NeedToPay({_i36.Key? key})
      : super(
          NeedToPay.name,
          path: '/need-to-pay',
          args: NeedToPayArgs(key: key),
        );

  static const String name = 'NeedToPay';
}

class NeedToPayArgs {
  const NeedToPayArgs({this.key});

  final _i36.Key? key;

  @override
  String toString() {
    return 'NeedToPayArgs{key: $key}';
  }
}
