import 'package:auto_route/auto_route.dart';
import 'package:pcassa_retail/screens/act_realisation_screen/act_realisation_screen.dart';
import 'package:pcassa_retail/screens/act_screen/created_act_view.dart';
import 'package:pcassa_retail/screens/act_screen/inner_of_act_screen.dart';
import 'package:pcassa_retail/screens/currencys_screen/currency_navigation_widget/currency_navigation_widget.dart';
import 'package:pcassa_retail/screens/currencys_screen/currency_screen_widgets/currencys_screen.dart';
import 'package:pcassa_retail/screens/discounts_screen/discount_navigation_widget/discount_navigation_widget.dart';
import 'package:pcassa_retail/screens/discounts_screen/discounts_screen.dart';
import 'package:pcassa_retail/screens/documents_screen/created_document_view.dart';
import 'package:pcassa_retail/screens/documents_screen/rko_pko/document_type_draw.dart';
import 'package:pcassa_retail/screens/documents_screen/rko_pko/documents_list.dart';
import 'package:pcassa_retail/screens/kontragent_balance_screen/kontragent_balance_screen.dart';
import 'package:pcassa_retail/screens/license_add_screen/license_add_screen.dart';
import 'package:pcassa_retail/screens/license_add_screen/need_to_pay.dart';
import 'package:pcassa_retail/screens/login_screen/login_screen.dart';
import 'package:pcassa_retail/screens/main_screen/main_screen.dart';
import 'package:pcassa_retail/screens/oborot_vedom_screen/oborot_vedom_screen.dart';
import 'package:pcassa_retail/screens/product_unit_screen/product_unit_screen.dart';
import 'package:pcassa_retail/screens/remainder_screen/remainder_screen.dart';
import 'package:pcassa_retail/screens/saled_products_screen/saled_products_screen.dart';
import 'package:pcassa_retail/screens/spent_screen/spent_screen.dart';
import 'package:pcassa_retail/screens/stationtype_screen/stationtype_screen.dart';
import 'package:pcassa_retail/screens/users_screen/users_screen.dart';
import 'package:pcassa_retail/screens/viruchka_screen/viruchka_screen.dart';
import 'package:pcassa_retail/screens/warehouse_screen/warehouse_screen.dart';

import '../screens/access_screen/access_screen.dart';
import '../screens/access_screen/access_type_config_screen/access_type_config_screen.dart';
import '../screens/category_screen/category_screen.dart';
import '../screens/contragents_screen/contragents_elements_screen/contragents_elements_screen.dart';
import '../screens/contragents_screen/contragents_screen.dart';
import '../screens/documents_screen/documents_screen.dart';
import '../screens/products_screen/product_elements_screen/products_elements_sreen.dart';
import '../screens/products_screen/products_group_screen/products_group_screen.dart';
import '../screens/settings_screen/settings_screen.dart';
import '../screens/splash_screen/splash_screen.dart';

@CustomAutoRouter(
  preferRelativeImports: true,
  replaceInRouteName: 'Screen,Route',
  routes: [
    //Splash Screen Route
    CustomRoute<void>(
      page: SplashScreen,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      initial: true,
    ),

    //Login Screen Route
    CustomRoute<void>(
      page: LoginScreen,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      initial: true,
    ),
    //Act Create Screen
    CustomRoute<void>(
        page: InnerContentOfAct,
        transitionsBuilder: TransitionsBuilders.fadeIn,
        initial: true,
        name: "InnerContentOfActRoute"),
    //Act List Screen
    CustomRoute<void>(
        page: CreatedActView,
        transitionsBuilder: TransitionsBuilders.fadeIn,
        initial: true,
        name: "CreatedActViewRoute"),

    //Main Screen Route
    CustomRoute<void>(
      page: MainScreen,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      initial: true,
    ),

    //User Screen Route
    CustomRoute<void>(
      page: UsersScreen,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      initial: true,
    ),

    //Discounts Screen Route
    CustomRoute<void>(
      page: DiscountsScreen,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      initial: true,
    ),

    //Currency Screen Route
    CustomRoute<void>(
      page: CurrencysScreen,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      initial: true,
    ),

    //Currency Navigation Widget Route
    CustomRoute<void>(
      page: CurrencyNavigationPage,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      initial: true,
    ),

    //Discount Navigation Widget Route
    CustomRoute<void>(
      page: DiscountNavigationPage,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      initial: true,
    ),

    //ProductCreateGroup
    CustomRoute<void>(
      page: ProductsGroupScreen,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      initial: true,
    ),

    //Products
    CustomRoute<void>(
      page: Products,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      initial: true,
    ),

    //Settings
    CustomRoute<void>(
      page: SettingsScreen,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      initial: true,
    ),

    //Settings Unit
    CustomRoute<void>(
      page: UnitScreen,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      initial: true,
    ),

    //Settings CategorysType
    CustomRoute<void>(
      page: CategoryScreen,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      initial: true,
    ),

    //Settings AccessType
    CustomRoute<void>(
      page: AccessScreen,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      initial: true,
    ),
    //Settings AccessType configs
    CustomRoute<void>(
      page: AccessTypeConfigScreen,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      initial: true,
    ),

    //Spent Screen
    CustomRoute<void>(
      page: SpentScreen,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      initial: true,
    ),

    //Spent Screen
    CustomRoute<void>(
      page: WarehouseScreen,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      initial: true,
    ),
    //StationType Screen
    CustomRoute<void>(
      page: StationTypeScreen,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      //initial: true,
    ),

    //StationType Screen
    CustomRoute<void>(
      page: Contragents,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      //initial: true,
    ),
    //Contragents Screen
    CustomRoute<void>(
      page: ContragentElementScreen,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      //initial: true,
    ),
    //Document Screen
    CustomRoute<void>(
      page: DocumentScreen,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      //initial: true,
    ),
    //Document Screen
    CustomRoute<void>(
      page: CreatedDocumentView,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      //initial: true,
    ),
    //Rko/Pko Screen
    //Rko/Pko Screen
    CustomRoute<void>(
      page: DocumentTypeDraw,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      //initial: true,
    ),

    CustomRoute<void>(
      page: RkoPkoList,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      //initial: true,
    ),
    CustomRoute<void>(
      page: RemainderScreen,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      //initial: true,
    ),
    CustomRoute<void>(
      page: ActRealisationScreen,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      //initial: true,
    ),
    CustomRoute<void>(
      page: ViruchkaScreen,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      //initial: true,
    ),
    CustomRoute<void>(
      page: SaledProductScreen,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      //initial: true,
    ),
    CustomRoute<void>(
      page: KontragentBalanceReport,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      //initial: true,
    ),
     CustomRoute<void>(
      page: OborotVedomScreen,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      //initial: true,
    ),
     CustomRoute<void>(
      page: LicenseScreen,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      //initial: true,
    ),
     CustomRoute<void>(
      page: NeedToPay,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      //initial: true,
    )
    
  ],
  

  
)
class $Router {}
