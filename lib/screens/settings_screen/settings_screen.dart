import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pcassa_retail/constants/dimensions/dimensions.dart';

import '../../constants/app_themes/app_colors/app_colors.dart';
import '../../constants/app_themes/app_icons/app_icons.dart';
import '../../constants/paddings_constants/padding_constants.dart';
import '../../error_handler/error_handler.dart';
import '../../router/router.gr.dart';
import '../../router/services.dart';
import '../../store/access_type_state/access_state.dart';
import '../../store/category_state/category_state.dart';
import '../../store/contragent_state/contragent_state.dart';
import '../../store/spent_state/spent_state.dart';
import '../../store/station_type_state/station_type_state.dart';
import '../../store/unit_state/unit_state.dart';
import '../../store/warehouse_state/warehouse_state.dart';
import '../../widgets/app_icons.dart';
import '../../widgets/big_text.dart';
import '../../widgets/main_screen_loading_widget.dart';
import '../../widgets/reference_screen_design.dart';
import '../main_screen/widgets/navigation_bar_widget/navigation_bar.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  //Get Unit State
  final unitSate = GetIt.I<UnitState>();
  //Get spent State
  final spentState = GetIt.I<SpentState>();
  //Get warehouse State
  final warehouseState = GetIt.I<WarehouseState>();
  //Get Category State
  final categoryState = GetIt.I<CategoryState>();
  //Get StationType State
  final stationTypeState = GetIt.I<StationTypeState>();
  //Get Access State
  final accessState = GetIt.I<AccessState>();
  //Get Contragent State
  final contragemtState = GetIt.I<ContragentState>();

  @override
  void initState() {
    super.initState();
    contragemtState.clearGroupState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        //trigger leaving and use own data
        router.replace(
          const MainRoute(),
        );
        //we need to return a future
        return Future.value(false);
      },
      child: Scaffold(
        drawer: const NavDrawer(),
        appBar: AppBar(
          title: BigText(
            text: "references".tr(),
            color: AppColors.appWhite,
          ),
          backgroundColor: AppColors.appPurple,
          actions: [
            IconButton(
              onPressed: () {
                router.replace(
                  const MainRoute(),
                );
              },
              icon: (CustomIcons.home),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Observer(
            builder: (_) => GridView.count(
              physics: ScrollPhysics(),
              crossAxisCount: 2,
              childAspectRatio: 1,
              shrinkWrap: true,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                      paddingLeft, paddingTop, paddingRight, 0),
                  child: InkWell(
                      onTap: () async {
                        try {
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return const MainScreenLoadingWidget();
                            },
                          );
                          await categoryState.getCategory();
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
                         router.replace(const CategoryRoute());
                      },
                      child: const ReferenceScreen(
                        title: "productCategory",
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                      paddingLeft, paddingTop, paddingRight, 0),
                  child: InkWell(
                    onTap: () async {
                      try {
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return const MainScreenLoadingWidget();
                          },
                        );
                        await unitSate.getUnit();
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
                       router.replace(const UnitRoute());
                    },
                    child: const ReferenceScreen(
                      title: "productUnit",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                      paddingLeft, paddingTop, paddingRight, 0),
                  child: InkWell(
                      onTap: () async {
                        try {
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return const MainScreenLoadingWidget();
                            },
                          );
                          await accessState.getAcessTypes();
                        } catch (e) {
                          if (e is DioError) {
                            await ErrorHandler.errorModal(
                              context: context,
                              errorCode: e.response,
                            );
                          } else {
                            // print(e.toString());
                          }
                        }
                         router.replace(const AccessRoute());
                      },
                      child: const ReferenceScreen(
                        title: "accessType",
                      )),
                ),
                Padding(
                    padding: const EdgeInsets.fromLTRB(
                        paddingLeft, paddingTop, paddingRight, 0),
                    child: InkWell(
                        onTap: () async {
                          try {
                            showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) {
                                return const MainScreenLoadingWidget();
                              },
                            );
                            await spentState.getSpent();
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
                           router.replace(const SpentRoute());
                        },
                        child: const ReferenceScreen(
                          title: "spentList",
                        ))),
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                      paddingLeft, paddingTop, paddingRight, 0),
                  child: InkWell(
                      onTap: () async {
                        try {
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return const MainScreenLoadingWidget();
                            },
                          );
                          await warehouseState.getWarehouse();
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
                         router.replace(const WarehouseRoute());
                      },
                      child: const ReferenceScreen(
                        title: "warehouseList",
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                      paddingLeft, paddingTop, paddingRight, 0),
                  child: InkWell(
                    onTap: () async {
                      try {
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return const MainScreenLoadingWidget();
                          },
                        );
                        await stationTypeState.getStationType();
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
                       router.replace(const StationTypeRoute());
                    },
                    child: ReferenceScreen(
                      title: "stationType".tr(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                      paddingLeft, paddingTop, paddingRight, 0),
                  child: InkWell(
                    onTap: () async {
                      try {
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return const MainScreenLoadingWidget();
                          },
                        );
                        await contragemtState.getContragents(context: context);
                        await contragemtState.categoryFirstMade();
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
                      router.replace(const Contragents());

                   
                    },
                    child: const ReferenceScreen(
                      title: "contragents",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
