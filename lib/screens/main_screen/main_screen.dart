// ignore_for_file: unused_field, unrelated_type_equality_checks, prefer_const_constructors

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pcassa_retail/constants/dimensions/dimensions.dart';
import 'package:pcassa_retail/constants/paddings_constants/padding_constants.dart';
import 'package:pcassa_retail/router/router.gr.dart';
import 'package:pcassa_retail/router/services.dart';
import 'package:pcassa_retail/screens/documents_screen/created_document_view.dart';
import 'package:pcassa_retail/screens/main_screen/widgets/navigation_bar_widget/navigation_bar.dart';
import 'package:pcassa_retail/screens/products_screen/products_group_screen/products_categories_add_and_edit_wigdets/products_categories_create_widget.dart';
import 'package:pcassa_retail/store/document_view_state/document_view_state.dart';
import 'package:pcassa_retail/store/loading_state/loading_state.dart';
import 'package:pcassa_retail/store/nakl_info_state/nakl_info_state.dart';
import 'package:pcassa_retail/widgets/big_text.dart';
import 'package:pcassa_retail/widgets/main_menu_buttons.dart';
import 'package:pcassa_retail/widgets/main_screen_loading_widget.dart';
import '../../constants/app_themes/app_colors/app_colors.dart';
import '../../enums/main_screen_navigation_enum/main_screen_navigations.dart';
import '../../error_handler/error_handler.dart';
import '../../store/access_type_state/access_state.dart';
import '../../store/authorization_state/authorization_state.dart';
import '../../store/currency_state/currency_state.dart';
import '../../store/discount_state/discount_state.dart';
import '../../store/product_state/product_state.dart';
import '../../store/user_state/user_state.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool isLoading = false;
  //getIt User State
  final getUsers = GetIt.I<CreatedUsers>();
  //getLoginState
  final getLoginInfo = GetIt.I<AuthorizationState>();
  //getIt Discount State
  final getDiscounts = GetIt.I<CreatedDiscounts>();
  //getIt Currency State
  final geCurrency = GetIt.I<CreatedCurrencys>();
  //getIt Product State
  final productState = GetIt.I<CreatedProducts>();
    //getIt Product State
  final naklInfoState = GetIt.I<NaklInfoState>();
  //getIt AccessType State
  final getAccessState = GetIt.I<AccessState>();
var documentViewState = GetIt.I<DocumentViewState>();
//clear MenuGet Data
  @override
  void initState() {
    super.initState();
    getProducts.clearGroupState();
    currencyState.currencyShortNames.clear();
   
  }

  @override
  void dispose() {
    super.dispose();
     naklInfoState.savedDocument= false;
  }

  @override
  Widget build(BuildContext context) {
    //Set Locale
    context.setLocale(Locale(getLoginInfo.currentUser!.language.toString()));
    return WillPopScope(
      onWillPop: () {
        authState.logOut();
        return Future.value(false);
      },
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.appPurple,
            title: BigText(
              text: 'pcassaMobileManager',
              color: AppColors.appWhite,
              size: Dimensions.font18,
            ),
          ),
          drawer: const NavDrawer(),
          body: Center(
            child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 1,
                shrinkWrap: true,
                children: [
                  //GoToProducts
                  Padding(
                    padding: EdgeInsets.only(
                        left: Dimensions.paddingLeft12,
                        top: Dimensions.paddingTop16,
                        right: Dimensions.paddingRight12,
                        bottom: paddingBottom),
                    child: InkWell(
                        onTap: () {
                          provider(
                              quicMenuPagesType: QuickMenuPagesType.products);
                        },
                        child: MainMenuButtons(
                          buttonText: "products",
                          icon: Icons.shopping_bag_rounded,
                        )),
                  ),
                  //GoToUsers
                  Padding(
                    padding: EdgeInsets.only(
                        left: Dimensions.paddingLeft12,
                        top: Dimensions.paddingTop16,
                        right: Dimensions.paddingRight12,
                        bottom: paddingBottom),
                    child: InkWell(
                        onTap: () {
                          provider(quicMenuPagesType: QuickMenuPagesType.users);
                        },
                        child: MainMenuButtons(
                          buttonText: "users",
                          icon: Icons.person,
                        )),
                  ),
                  //GoToDiscounts
                  Padding(
                    padding: EdgeInsets.only(
                        left: Dimensions.paddingLeft12,
                        top: Dimensions.paddingTop16,
                        right: Dimensions.paddingRight12,
                        bottom: paddingBottom),
                    child: InkWell(
                        onTap: () {
                          provider(
                              quicMenuPagesType: QuickMenuPagesType.discounts);
                        },
                        child: MainMenuButtons(
                          buttonText: "discounts",
                          icon: Icons.discount,
                        )),
                  ),
                  // GoToCurrencys
                  Padding(
                    padding: EdgeInsets.only(
                        left: Dimensions.paddingLeft12,
                        top: Dimensions.paddingTop16,
                        right: Dimensions.paddingRight12,
                        bottom: paddingBottom),
                    child: InkWell(
                        onTap: () {
                          provider(
                              quicMenuPagesType: QuickMenuPagesType.currencys);
                        },
                        child: MainMenuButtons(
                            buttonText: "currencys", icon: Icons.money)),
                  ),
                ]),
          )),
    );
  }

  //Provider functio for amin menu enum screen
  Future<void> provider({required quicMenuPagesType}) async {
    switch (quicMenuPagesType) {
      case QuickMenuPagesType.products:
        {
          try {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return const MainScreenLoadingWidget();
              },
            );

            await productState.getProducts(context: context);
            await productState.categoryFirstMade();

            router.replace(const ProductsGroupRoute());
          } catch (e) {
            if (e is DioError) {
              await ErrorHandler.errorModal(
                context: context,
                errorCode: e.response,
              );
              break;
            } else {
              print(e.toString());
              break;
            }
          }
        }
        break;
      case QuickMenuPagesType.users:
        {
          try {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return const MainScreenLoadingWidget();
              },
            );
            await getUsers.getCreatedUsers();
            await getAccessState.getAcessTypes();
          } catch (e) {
            if (e is DioError) {
              await ErrorHandler.errorModal(
                context: context,
                errorCode: e.response,
              );
              break;
            } else {
              print(e.toString());
              break;
            }
          }
          router.replace(UsersRoute(quickMenuPagesType: quicMenuPagesType));
        }
        break;
      case QuickMenuPagesType.discounts:
        {
          try {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return const MainScreenLoadingWidget();
              },
            );
            await getDiscounts.getCreatedDiscounts();
          } catch (e) {
            if (e is DioError) {
              await ErrorHandler.errorModal(
                context: context,
                errorCode: e.response,
              );
              break;
            } else {
              print(e.toString());
              break;
            }
          }
          if (getDiscounts.discountInfo.length == 1) {
            router.replace(DiscountsRoute(
                quickMenuPagesType: quicMenuPagesType,
                idd: getDiscounts.discountInfo.first.id));
          } else {
            router.replace(
                DiscountNavigationPage(quickMenuPagesType: quicMenuPagesType));
          }
        }

        break;
      case QuickMenuPagesType.currencys:
        {
          try {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return const MainScreenLoadingWidget();
              },
            );
            await geCurrency.getCreatedCurencys();
          } catch (e) {
            if (e is DioError) {
              await ErrorHandler.errorModal(
                context: context,
                errorCode: e.response,
              );
              break;
            } else {
              print(e.toString());
              break;
            }
          }
          router.replace(
              CurrencyNavigationPage(quickMenuPagesType: quicMenuPagesType));
        }
    }
  }
}
