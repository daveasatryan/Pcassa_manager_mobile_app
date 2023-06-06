// ignore_for_file: curly_braces_in_flow_control_structures, use_build_context_synchronously, prefer_const_constructors

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pcassa_retail/constants/app_themes/app_icons/app_icons.dart';
import 'package:pcassa_retail/constants/dimensions/dimensions.dart';
import 'package:pcassa_retail/enums/main_screen_navigation_enum/documents_screen_enum.dart';
import 'package:pcassa_retail/error_handler/error_handler.dart';
import 'package:pcassa_retail/models/act_model/act_model.dart';
import 'package:pcassa_retail/models/cashorders/cash_order_model.dart';
import 'package:pcassa_retail/models/product_element_model/product_element_model.dart';
import 'package:pcassa_retail/router/router.gr.dart';
import 'package:pcassa_retail/router/services.dart';
import 'package:pcassa_retail/screens/act_screen/inner_of_act_screen.dart';
import 'package:pcassa_retail/screens/remainder_screen/filter_remainder_dialog.dart';
import 'package:pcassa_retail/store/act_realisation_state/act_realisation_state.dart';
import 'package:pcassa_retail/store/act_state/act_state.dart';
import 'package:pcassa_retail/store/act_view_state/act_view_state.dart';
import 'package:pcassa_retail/store/document_view_state/document_view_state.dart';
import 'package:pcassa_retail/store/get_saled_products_state/get_saled_products_state.dart';
import 'package:pcassa_retail/store/kont_balance_state/kont_balance_state.dart';
import 'package:pcassa_retail/store/oborot_vedom_state/oborot_vedom_state.dart';
import 'package:pcassa_retail/store/product_state/product_state.dart';
import 'package:pcassa_retail/store/remainder_items_state/remainder_items_state.dart';
import 'package:pcassa_retail/store/spent_state/spent_state.dart';
import 'package:pcassa_retail/store/viruchka_state/viruchka_state.dart';
import 'package:pcassa_retail/widgets/app_icons.dart';
import 'package:pcassa_retail/widgets/big_text.dart';
import 'package:pcassa_retail/widgets/main_screen_loading_widget.dart';
import 'package:pcassa_retail/widgets/middle_text.dart';
import '../../../../constants/app_assets/app_assets.dart';
import '../../../../constants/app_themes/app_colors/app_colors.dart';
import '../../../../store/authorization_state/authorization_state.dart';
import '../../../../store/cash_order_state/cash_order_state.dart';
import '../../../../store/contragent_state/contragent_state.dart';
import '../../../../store/currency_state/currency_state.dart';
import '../../../../store/station_type_state/station_type_state.dart';
import '../../../../store/user_state/user_state.dart';
import '../../../../store/warehouse_state/warehouse_state.dart';

class NavDrawer extends StatefulWidget {
  const NavDrawer({Key? navdrawer}) : super(key: navdrawer);

  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  var contragemtState = GetIt.I<ContragentState>();
  var warehouseState = GetIt.I<WarehouseState>();
  var currencyState = GetIt.I<CreatedCurrencys>();
  //Get AutorisationState
  final authState = GetIt.I<AuthorizationState>();
  final kontBalanceState = GetIt.I<KontBalanceState>();
  //Get UserState
  final userState = GetIt.I<CreatedUsers>();
  final stationType = GetIt.I<StationTypeState>();
  final cashOrderState = GetIt.I<CashOrderState>();
  var saledProductState = GetIt.I<SaledProductsState>();
  final viruchkaState = GetIt.I<ViruchkaState>();
  //final spentState = GetIt.I<SpentState>();

  var documentViewState = GetIt.I<DocumentViewState>();
  final actViewState = GetIt.I<ActViewState>();
  bool remainderLoad = false;
  bool actRealisation = false;
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: [
                    UserAccountsDrawerHeader(
                        decoration: const BoxDecoration(
                          color: AppColors.appWhite,
                        ),
                        accountName: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BigText(
                              text: authState.currentUser!.fio,
                            ),
                            Row(
                              children: [
                                PopupMenuButton(
                                    // add icon, by default "3 dot" icon
                                    icon: (CustomIcons.languages),
                                    itemBuilder: (context) {
                                      return [
                                        PopupMenuItem<int>(
                                            value: 0,
                                            child: Row(
                                              children: [
                                                Image.asset(
                                                  Assets.am,
                                                  height: Dimensions.height20,
                                                  width: Dimensions.width20,
                                                ),
                                                SizedBox(
                                                  width: Dimensions.width15,
                                                ),
                                                MiddleText(text: "armenian")
                                              ],
                                            )),
                                        PopupMenuItem<int>(
                                            value: 1,
                                            child: Row(
                                              children: [
                                                Image.asset(
                                                  Assets.ru,
                                                  height: Dimensions.height20,
                                                  width: Dimensions.width20,
                                                ),
                                                SizedBox(
                                                  width: Dimensions.width15,
                                                ),
                                                MiddleText(text: "russian")
                                              ],
                                            )),
                                        PopupMenuItem<int>(
                                            value: 2,
                                            child: Row(
                                              children: [
                                                Image.asset(
                                                  Assets.en,
                                                  height: Dimensions.height20,
                                                  width: Dimensions.width20,
                                                ),
                                                SizedBox(
                                                  width: Dimensions.width15,
                                                ),
                                                MiddleText(text: "english")
                                              ],
                                            )),
                                      ];
                                    },
                                    onSelected: (value) async {
                                      if (value == 0) {
                                        await userState.changeUserLanguage(
                                            id: userState
                                                .authState.currentUser!.id,
                                            language: 'hy',
                                            tip: 'manager');
                                        context.setLocale(const Locale('hy'));
                                        router.replace(const MainRoute());
                                      } else if (value == 1) {
                                        await userState.changeUserLanguage(
                                            id: userState
                                                .authState.currentUser!.id,
                                            language: 'ru',
                                            tip: 'manager');
                                        context.setLocale(const Locale('ru'));
                                        router.replace(const MainRoute());
                                      } else if (value == 2) {
                                        await userState.changeUserLanguage(
                                            id: userState
                                                .authState.currentUser!.id,
                                            language: 'en',
                                            tip: 'manager');
                                        context.setLocale(const Locale('en'));
                                        router.replace(const MainRoute());
                                      }
                                    }),
                              ],
                            ),
                          ],
                        ),
                        accountEmail: null,
                        currentAccountPicture: CircleAvatar(
                            backgroundColor: AppColors.appCoral,
                            child: Center(
                              child: AppIcons(
                                icon: Icons.person,
                                size: Dimensions.iconSize48,
                                iconColor: AppColors.appWhite,
                              ),
                            ))),
                    //Referens Acces
                    if (!authState.currentUser!.dostup.settingsaccess
                        .contains('settings'))
                      ListTile(
                        leading: AppIcons(
                          icon: Icons.note_alt_outlined,
                          iconColor: AppColors.appCoral,
                          size: Dimensions.iconSize24,
                        ),
                        title: MiddleText(text: 'references'),
                        onTap: () {
                          router.replace(
                            const SettingsRoute(),
                          );
                        },
                      ),
                    ListTile(
                      leading: AppIcons(
                        icon: Icons.difference_outlined,
                        iconColor: AppColors.appCoral,
                        size: Dimensions.iconSize24,
                      ),
                      title: MiddleText(text: 'createDocument'.tr()),
                      onTap: () {
                        router.replace(
                          DocumentRoute(
                              documentsScreenType:
                                  DocumentsScreenType.createDocument),
                        );
                      },
                    ),
                    ListTile(
                      leading: AppIcons(
                        icon: Icons.description_outlined,
                        iconColor: AppColors.appCoral,
                        size: Dimensions.iconSize24,
                      ),
                      title: MiddleText(text: 'docuementList'.tr()),
                      onTap: () async {
                        try {
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return const MainScreenLoadingWidget();
                            },
                          );
                          await openDocument();
                        } catch (e) {
                          if (e is DioError) {
                            await ErrorHandler.errorModal(
                              context: context,
                              errorCode: e.response,
                            );
                          } else {
                            print(e.toString());
                          }
                        }
                      },
                    ),
                    ExpansionTile(
                      title: MiddleText(
                        text: "cashOrders",
                      ),
                      leading: AppIcons(
                        icon: Icons.money,
                        size: Dimensions.iconSize24,
                      ),
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                InkWell(
                                  onTap: () async {
                                    try {
                                      showDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (BuildContext context) {
                                          return const MainScreenLoadingWidget();
                                        },
                                      );
                                      await createCashOrder(documentCod: 22);
                                    } catch (e) {
                                      if (e is DioError) {
                                        await ErrorHandler.errorModal(
                                          context: context,
                                          errorCode: e.response,
                                        );
                                      } else {
                                        print(e.toString());
                                      }
                                    }
                                    router.replace(DocumentTypeDraw(
                                        documentCod: 22, documentName: "rko"));
                                  },
                                  child: Container(
                                    height: Dimensions.height20 * 2,
                                    width: double.infinity,
                                    child:
                                        Center(child: MiddleText(text: "rko")),
                                  ),
                                ),
                                InkWell(
                                  onTap: () async {
                                    try {
                                      showDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (BuildContext context) {
                                          return const MainScreenLoadingWidget();
                                        },
                                      );
                                      await createCashOrder(documentCod: 21);
                                    } catch (e) {
                                      if (e is DioError) {
                                        await ErrorHandler.errorModal(
                                          context: context,
                                          errorCode: e.response,
                                        );
                                      } else {
                                        print(e.toString());
                                      }
                                    }
                                    router.replace(DocumentTypeDraw(
                                        documentCod: 21, documentName: "pko"));
                                  },
                                  child: Container(
                                    height: Dimensions.height20 * 2,
                                    width: double.infinity,
                                    child:
                                        Center(child: MiddleText(text: "pko")),
                                  ),
                                ),
                                InkWell(
                                  onTap: () async {
                                    try {
                                      showDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (BuildContext context) {
                                          return const MainScreenLoadingWidget();
                                        },
                                      );
                                      await openRkoPko();
                                    } catch (e) {
                                      if (e is DioError) {
                                        await ErrorHandler.errorModal(
                                          context: context,
                                          errorCode: e.response,
                                        );
                                      } else {
                                        print(e.toString());
                                      }
                                    }
                                  },
                                  child: Container(
                                    height: Dimensions.height20 * 2,
                                    width: double.infinity,
                                    child: Center(
                                        child:
                                            MiddleText(text: "documentList")),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    /*
                AKTERI 
                HATVAC
                */

                    ExpansionTile(
                      title: MiddleText(
                        text: "act".tr(),
                      ),
                      leading: AppIcons(
                        icon: Icons.comment_bank_outlined,
                        size: Dimensions.iconSize24,
                      ),
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                InkWell(
                                  onTap: () async {
                                    try {
                                      showDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (BuildContext context) {
                                          return const MainScreenLoadingWidget();
                                        },
                                      );
                                      await openEmptyAct();

                                      router.replace(InnerContentOfActRoute());
                                    } catch (e) {
                                      print(e);
                                      await ErrorHandler.errorModal(
                                        context: context,
                                        errorCode: null,
                                      );
                                    }
                                  },
                                  child: Container(
                                    height: Dimensions.height20 * 2,
                                    width: double.infinity,
                                    child: Center(
                                        child:
                                            MiddleText(text: "crateact".tr())),
                                  ),
                                ),
                                InkWell(
                                  onTap: () async {
                                    try {
                                      showDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (BuildContext context) {
                                          return const MainScreenLoadingWidget();
                                        },
                                      );
                                      await actViewState.getActList();
                                      //print(actViewState.actViewInfo);
                                      router.replace(CreatedActViewRoute());
                                    } catch (e) {
                                      print(e);
                                      await ErrorHandler.errorModal(
                                        context: context,
                                        errorCode: null,
                                      );
                                    }

                                    //  router.replace(DocumentTypeDraw(
                                    //    documentCod: 21, documentName: "pko"));
                                  },
                                  child: Container(
                                    height: Dimensions.height20 * 2,
                                    width: double.infinity,
                                    child: Center(
                                        child:
                                            MiddleText(text: "actlist".tr())),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    /*
                AKTERI 
                HATVAC
                */
                    ExpansionTile(
                      title: MiddleText(
                        text: "repports".tr(),
                      ),
                      leading: AppIcons(
                        icon: Icons.notes,
                        size: Dimensions.iconSize24,
                      ),
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                ListTile(
                                  title: MiddleText(text: "remainder"),
                                  onTap: () async {
                                    try {
                                      showDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (BuildContext context) {
                                          return const MainScreenLoadingWidget();
                                        },
                                      );
                                      await getReminder();
                                    } catch (e) {
                                      print(e);
                                      await ErrorHandler.errorModal(
                                        context: context,
                                        errorCode: null,
                                      );
                                    }

                                    router.replace(
                                      const RemainderRoute(),
                                    );
                                  },
                                ),
                                ListTile(
                                  title: MiddleText(text: "actRealisation"),
                                  onTap: () async {
                                    try {
                                      showDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (BuildContext context) {
                                          return const MainScreenLoadingWidget();
                                        },
                                      );
                                      await getActRealisation();
                                    } catch (e) {
                                      print(e);
                                      await ErrorHandler.errorModal(
                                        context: context,
                                        errorCode: null,
                                      );
                                    }
                                    router.replace(
                                      const ActRealisationRoute(),
                                    );
                                  },
                                ),
                                 ListTile(
                                  title: MiddleText(text: "oborotVedom"),
                                  onTap: () async {
                                    try {
                                      showDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (BuildContext context) {
                                          return const MainScreenLoadingWidget();
                                        },
                                      );
                                      await getOborotVedomost();
                                    } catch (e) {
                                      print(e);
                                      await ErrorHandler.errorModal(
                                        context: context,
                                        errorCode: null,
                                      );
                                    }
                                    router.replace(
                                      const OborotVedomRoute(),
                                    );
                                  },
                                ),
                                ListTile(
                                  title: MiddleText(text: "viruchka"),
                                  onTap: () async {
                                    try {
                                      showDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (BuildContext context) {
                                          return const MainScreenLoadingWidget();
                                        },
                                      );
                                      await openViruchka();
                                       router.replace(
                                      const ViruchkaRoute(),
                                    );
                                    } catch (e) {
                                      print(e);
                                      await ErrorHandler.errorModal(
                                        context: context,
                                        errorCode: null,
                                      );
                                    }
                                   
                                  },
                                ),
                                ListTile(
                                  title: MiddleText(text: "saledProducts"),
                                  onTap: () async {
                                    try {
                                      showDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (BuildContext context) {
                                          return const MainScreenLoadingWidget();
                                        },
                                      );
                                      await openSaledProducts();
                                    } catch (e) {
                                      print(e);
                                      await ErrorHandler.errorModal(
                                        context: context,
                                        errorCode: null,
                                      );
                                    }
                                    router.replace(
                                      const SaledProductRoute(),
                                    );
                                  },
                                ),
                                ListTile(
                                  title: MiddleText(text: "kontragentBalance"),
                                  onTap: () async {
                                    try {
                                      showDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (BuildContext context) {
                                          return const MainScreenLoadingWidget();
                                        },
                                      );
                                      await getKontBalance();
                                    } catch (e) {
                                      print(e);
                                      await ErrorHandler.errorModal(
                                        context: context,
                                        errorCode: null,
                                      );
                                    }
                                    router.replace(KontragentBalanceReport());
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    ListTile(
                      leading: AppIcons(
                        icon: Icons.exit_to_app,
                        iconColor: AppColors.appCoral,
                        size: Dimensions.iconSize24,
                      ),
                      title: MiddleText(text: 'logout'),
                      onTap: () => {authState.logOut()},
                    ),
                  ],
                ),
              ],
            )));
  }

/* GET ACT REALISATION REPORT */
  getKontBalance() async {
    kontBalanceState.kontDocsList.clear();
    await contragemtState.clearGroupState();
    await contragemtState.getContragents(context: context);
    kontBalanceState.getContragentReports(
      name: "",
      data_s: DateFormat("dd.MM.yyyy")
          .format(DateTime.now().subtract(Duration(days: 1)))
          .toString(),
      data_e: DateFormat("dd.MM.yyyy")
          .format(DateTime.now().subtract(Duration(days: 1)))
          .toString(),
    );
  }

/* GET VEDOMOST  REPORT */
  getOborotVedomost() async {
    warehouseState.warehouseNames.clear();
    await productState.clearGroupState();
    await productState.getProducts(context: context);

    await openSaledProducts();
    await warehouseState.getWarehouse();
    await warehouseState.getWarehouseNames();

    await GetIt.I<OborotVedomState>().getOborotVedom(
      order_by: "category_name",
    );

    GetIt.I<CreatedProducts>().getProducts(context: context);
  }

/* GET ACT REALISATION REPORT */
  getActRealisation() async {
    warehouseState.warehouseNames.clear();
    await productState.clearGroupState();
    await productState.getProducts(context: context);

    await openSaledProducts();
    await warehouseState.getWarehouse();
    await warehouseState.getWarehouseNames();

    await GetIt.I<ActRealisationState>().getActRealisation(
      order_by: "category_name",
    );

    GetIt.I<CreatedProducts>().getProducts(context: context);
  }

/* GET REMINDER REPORT */
  getReminder() async {
    warehouseState.warehouseNames.clear();
    await productState.clearGroupState();
    await productState.getProducts(context: context);

    await openSaledProducts();
    await warehouseState.getWarehouse();
    await warehouseState.getWarehouseNames();

    await GetIt.I<RemainderItemsState>().getRemainder(
      order_by: "category_name",
    );

    GetIt.I<CreatedProducts>().getProducts(context: context);
  }

/* GET SALED PRODUCTS  REPORT */

  openSaledProducts() async {
    viruchkaState.listOfViruchka.clear();
    await productState.clearGroupState();
    await productState.getProducts(context: context);
    await saledProductState.getSaledProducts(
        name: '',
        data_e: DateFormat("dd.MM.yyyy")
            .format(DateTime.now().subtract(Duration(days: 1)))
            .toString(),
        data_s: DateFormat("dd.MM.yyyy")
            .format(DateTime.now().subtract(Duration(days: 1)))
            .toString(),
        category_name: '',
        order_by: '');
  }

/* GET VIRUCHKA REPORT */

  openViruchka() async {
    viruchkaState.listOfViruchka.clear();
    await viruchkaState.getViruchka(
        chequenumber: '',
        data_e: DateFormat("dd.MM.yyyy")
            .format(DateTime.now().subtract(Duration(days: 1)))
            .toString(),
        data_s: DateFormat("dd.MM.yyyy")
            .format(DateTime.now().subtract(Duration(days: 1)))
            .toString(),
        n_smena: '',
        waiter_name: '',
        order_by: '');
  }

/* OPEN DOCUMENTS */

    openDocument() async {
    documentViewState.naklViewInfo.clear();
    warehouseState.warehouseNames.clear();
    currencyState.currencyShortNames.clear();
    await warehouseState.getWarehouse();
    await warehouseState.getWarehouseNames();
    await contragemtState.getContragents(context: context);
    await contragemtState.categoryFirstMade();
    await currencyState.getCreatedCurencys();
    await currencyState.getShortNames();
    await documentViewState.getDocument(data_e: DateTime.now().toString());
    router.replace(CreatedDocumentView());
  }

/* ACT DOCUMENT CREATING */

  openEmptyAct() async {
    currencyState.currencyShortNames.clear();
    GetIt.I<SpentState>().spentList.clear();
    GetIt.I<SpentState>().spentListNames.clear();
    await GetIt.I<SpentState>().getSpent();
    await GetIt.I<SpentState>().getSpentNames();
    await contragemtState.getContragents(context: context);
    await contragemtState.categoryFirstMade();
    await currencyState.getCreatedCurencys();

    await currencyState.getShortNames();
    await GetIt.I<ActState>().getActMainInfo(
        actInfo_: ActModel(
            id: 0,
            n_dok: "",
            data_d: DateFormat("dd.MM.yyyy").format(DateTime.now()),
            typ_d: 24,
            summa: 0,
            id_osn: 0,
            t_osn: 0,
            prim: "",
            kodpost: 0,
            namepost: "",
            val: currencyState.currencyShortNames.last,
            aktiv: 1,
            kurs: 0.0,
            summa_val: 0,
            kodzatrat: 0,
            namezatrat: "",
            srok_oplati: DateFormat("dd.MM.yyyy").format(DateTime.now())));
  }

/* RKO PKO CREATING */

  openRkoPko() async {
    currencyState.currencyShortNames.clear();
    stationType.stationTypeNameList.clear();
    await contragemtState.getContragents(context: context);
    await contragemtState.categoryFirstMade();
    await currencyState.getCreatedCurencys();
    await currencyState.getShortNames();
    await stationType.getStationType();
    await stationType.getNames();
    await cashOrderState.getCashOrdersByFilter(
      data_s: DateTime.now().toString(),
      data_e: DateTime.now().toString(),
    );
    router.replace(RkoPkoList());
  }

/* CASH ORDER CREATING */

  createCashOrder({required int documentCod}) async {
    currencyState.currencyShortNames.clear();
    stationType.stationTypeNameList.clear();
    await contragemtState.getContragents(context: context);
    await contragemtState.categoryFirstMade();
    await currencyState.getCreatedCurencys();
    await currencyState.getShortNames();
    await stationType.getStationType();
    await stationType.getNames();
    await cashOrderState.createCahsOrderDocument(
        cashOrderModel: CashOrderModel(
            id: 0,
            n_dok: "",
            data_d: DateFormat("dd.MM.yyyy").format(DateTime.now()).toString(),
            typ_d: documentCod,
            summa: 0,
            id_osn: 0,
            t_osn: 0,
            prim: "null",
            kodpost: 0,
            namepost: "",
            val: currencyState.currencyShortNames.last,
            aktiv: 1,
            kurs: 0.0,
            summa_v: 0,
            pr_kassa: 0.0,
            id_vidkas: 0));
  }
}
