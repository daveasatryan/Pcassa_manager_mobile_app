import 'package:data_table_2/paginated_data_table_2.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pcassa_retail/constants/app_themes/app_colors/app_colors.dart';
import 'package:pcassa_retail/constants/dimensions/dimensions.dart';
import 'package:pcassa_retail/error_handler/error_handler.dart';
import 'package:pcassa_retail/router/router.gr.dart';
import 'package:pcassa_retail/router/services.dart';
import 'package:pcassa_retail/screens/act_realisation_screen/act_realisation_filter.dart';
import 'package:pcassa_retail/screens/oborot_vedom_screen/oborot_vedom_filter.dart';
import 'package:pcassa_retail/screens/remainder_screen/filter_remainder_dialog.dart';
import 'package:pcassa_retail/store/act_realisation_state/act_realisation_state.dart';
import 'package:pcassa_retail/store/oborot_vedom_state/oborot_vedom_state.dart';
import 'package:pcassa_retail/store/warehouse_state/warehouse_state.dart';
import 'package:pcassa_retail/widgets/big_text.dart';

import '../../constants/app_themes/app_icons/app_icons.dart';
import '../../widgets/app_icons.dart';

class OborotVedomScreen extends StatefulWidget {
  const OborotVedomScreen({super.key});
  @override
  State<OborotVedomScreen> createState() => _OborotVedomScreenState();
  static var load2 = false;
  static var load_ = false;
}

class _OborotVedomScreenState extends State<OborotVedomScreen> {
  var searchController = TextEditingController();
  var oborotVedomState = GetIt.I<OborotVedomState>();
  final ScrollController controller = ScrollController();
  final ScrollController controller2 = ScrollController();
  var warehouseState = GetIt.I<WarehouseState>();
  //var currencyContraller = ;
  var j = 1;

  var load3 = false;
  var lenght_ = 0;
  var can_do = false;
  var ordering = "";
  void initState() {
    OborotVedomScreen.load2 = false;
    //currencyContraller = "notSelected";
    //productState.getProducts(context: context).then((value) => can_do = true);
    controller.addListener(() async {
      // if(ordering!=""){
      //   setState(() {
      //     j = 1;
      //   });
      // }
      if (controller.offset == controller.position.maxScrollExtent) {
        setState(() {
          j += 1;
          OborotVedomScreen.load_ = true;
        });
        try {
          await getInfoAndView(j, ordering);
        } on DioError catch (e) {
          await ErrorHandler.errorModal(
            context: context,
            errorCode: e.response,
          );
        }
        setState(() {
          //sleep(Duration(milliseconds: 600));
          OborotVedomScreen.load_ = false;
        });
      }
      //sleep(Duration(seconds: 1));
      //await remainderState.getRemainder(name: searchController.text);
    });
    searchController.addListener(() async {
      if (searchController.text.length > 2) {
        oborotVedomState.oborotVedomList.clear();
        await Future.delayed(const Duration(milliseconds: 500));
        await oborotVedomState.getOborotVedom(
            name: searchController.text);
      }
    });
  }

  void dispose() {
    super.dispose();
    oborotVedomState.oborotVedomList.clear();
    ordering = "";
    OborotVedomFilter.firstDatecontraller.text = "";

    OborotVedomFilter.secondDatecontraller.text = "";
    OborotVedomFilter.productGroupContraller = "all".tr();
    OborotVedomFilter.productItemContraller = "";
    OborotVedomFilter.firstWarehouseContraller = "notSelected";
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        //trigger leaving and use own data

        router.replace(const MainRoute());

        //we need to return a future
        return Future.value(false);
      },
      child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: AppIcons(
                icon: Icons.arrow_back,
                iconColor: AppColors.appWhite,
                size: Dimensions.iconSize24,
              ),
              onPressed: () {
                router.replace(const MainRoute());
              },
            ),
            title: BigText(
              text: 'oborotVedomsty'.tr(),
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
              IconButton(
                  onPressed: () async {
                    //Edit Screen Route
                    setState(() {
                      load3 = true;
                    });

                    setState(() {
                      load3 = false;
                    });

                    await showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return OborotVedomFilter();
                      },
                    );
                  },
                  icon: load3 == false
                      ? AppIcons(
                          icon: Icons.filter_alt_outlined,
                          iconColor: AppColors.appWhite,
                          size: Dimensions.iconSize24,
                        )
                      : const CircularProgressIndicator(
                          color: AppColors.appCoral,
                        )),
            ],
          ),
          body: OborotVedomScreen.load2 == false
              ? Observer(builder: (context) {
                  return Center(
                      child: Column(
                    children: [
                      Expanded(
                        child: DataTable2(
                          scrollController: controller,
                          fixedLeftColumns: 2,
                          horizontalMargin: 17,
                          columnSpacing: 3,
                          minWidth: 990,
                          columns: [
                            DataColumn2(
                                label: InkWell(
                              onTap: () async {
                                setState(() {
                                  j = 1;
                                  ordering = "name";
                                });
                                setState(() {
                                  OborotVedomScreen.load2 = true;
                                });

                                try {
                                  await getInfoAndView(j, ordering);
                                } on DioError catch (e) {
                                  await ErrorHandler.errorModal(
                                    context: context,
                                    errorCode: e.response,
                                  );
                                }

                                setState(() {
                                  OborotVedomScreen.load2 = false;
                                });
                              },
                              child: Center(
                                child: BigText(
                                  size: 16,
                                  text: "name",
                                ),
                              ),
                            )),
                            DataColumn2(
                                label: InkWell(
                              onTap: () async {
                                setState(() {
                                  j = 1;
                                  ordering = "ed_izm";
                                });
                                setState(() {
                                  OborotVedomScreen.load2 = true;
                                });

                                try {
                                  await getInfoAndView(j, ordering);
                                } on DioError catch (e) {
                                  await ErrorHandler.errorModal(
                                    context: context,
                                    errorCode: e.response,
                                  );
                                }
                                setState(() {
                                  OborotVedomScreen.load2 = false;
                                });
                              },
                              child: Center(
                                child: BigText(
                                  size: 16,
                                  text: "ed_izm",
                                ),
                              ),
                            )),
                            DataColumn2(
                                label: InkWell(
                              onTap: () async {
                                // setState(() {
                                //   j = 1;
                                //   ordering = "quantity_nach";
                                // });
                                // setState(() {
                                //   OborotVedomScreen.load2 = true;
                                // });

                                // try {
                                //   await getInfoAndView(j, ordering);
                                // } on DioError catch (e) {
                                //   await ErrorHandler.errorModal(
                                //     context: context,
                                //     errorCode: e.response,
                                //   );
                                // }

                                // setState(() {
                                //   OborotVedomScreen.load2 = false;
                                // });
                              },
                              child: Center(
                                child: BigText(
                                  size: 16,
                                  text: "quantity_nach",
                                ),
                              ),
                            )),
                            DataColumn2(
                                label: InkWell(
                              onTap: () async {
                                // setState(() {
                                //   j = 1;
                                //   ordering = "quantity_pr";
                                // });
                                // setState(() {
                                //   OborotVedomScreen.load2 = true;
                                // });

                                // try {
                                //   await getInfoAndView(j, ordering);
                                // } on DioError catch (e) {
                                //   await ErrorHandler.errorModal(
                                //     context: context,
                                //     errorCode: e.response,
                                //   );
                                // }

                                // setState(() {
                                //   OborotVedomScreen.load2 = false;
                                // });
                              },
                              child: Center(
                                child: BigText(
                                  size: 16,
                                  text: "quantity_pr",
                                ),
                              ),
                            )),
                            DataColumn2(
                                label: InkWell(
                              onTap: () async {
                                // setState(() {
                                //   j = 1;
                                //   ordering = "quantity_rx";
                                // });
                                // setState(() {
                                //   OborotVedomScreen.load2 = true;
                                // });
                                // try {
                                //   await getInfoAndView(j, ordering);
                                // } on DioError catch (e) {
                                //   await ErrorHandler.errorModal(
                                //     context: context,
                                //     errorCode: e.response,
                                //   );
                                // }
                                // await getInfoAndView(j, ordering);

                                // setState(() {
                                //   OborotVedomScreen.load2 = false;
                                // });
                              },
                              child: Center(
                                child: BigText(
                                  size: 16,
                                  text: "quantity_rx",
                                ),
                              ),
                            )),
                            DataColumn2(
                                label: InkWell(
                              onTap: () async {
                                // setState(() {
                                //   j = 1;
                                //   ordering = "quantity_vp";
                                // });
                                // setState(() {
                                //   OborotVedomScreen.load2 = true;
                                // });

                                // try {
                                //   await getInfoAndView(j, ordering);
                                // } on DioError catch (e) {
                                //   await ErrorHandler.errorModal(
                                //     context: context,
                                //     errorCode: e.response,
                                //   );
                                // }
                                // setState(() {
                                //   OborotVedomScreen.load2 = false;
                                // });
                              },
                              child: Center(
                                child: BigText(
                                  size: 16,
                                  text: "quantity_vp",
                                ),
                              ),
                            )),
                              DataColumn2(
                                label: InkWell(
                              onTap: () async {
                                // setState(() {
                                //   j = 1;
                                //   ordering = "quantity_vt";
                                // });
                                // setState(() {
                                //   OborotVedomScreen.load2 = true;
                                // });

                                // try {
                                //   await getInfoAndView(j, ordering);
                                // } on DioError catch (e) {
                                //   await ErrorHandler.errorModal(
                                //     context: context,
                                //     errorCode: e.response,
                                //   );
                                // }
                                // setState(() {
                                //   OborotVedomScreen.load2 = false;
                                // });
                              },
                              child: Center(
                                child: BigText(
                                  size: 16,
                                  text: "quantity_vt",
                                ),
                              ),
                            )),
                              DataColumn2(
                                label: InkWell(
                              onTap: () async {
                                // setState(() {
                                //   j = 1;
                                //   ordering = "quantity_vtp";
                                // });
                                // setState(() {
                                //   OborotVedomScreen.load2 = true;
                                // });

                                // try {
                                //   await getInfoAndView(j, ordering);
                                // } on DioError catch (e) {
                                //   await ErrorHandler.errorModal(
                                //     context: context,
                                //     errorCode: e.response,
                                //   );
                                // }
                                // setState(() {
                                //   OborotVedomScreen.load2 = false;
                                // });
                              },
                              child: Center(
                                child: BigText(
                                  size: 16,
                                  text: "quantity_vtp",
                                ),
                              ),
                            )),
                              DataColumn2(
                                label: InkWell(
                              onTap: () async {
                                // setState(() {
                                //   j = 1;
                                //   ordering = "quantity_spis";
                                // });
                                // setState(() {
                                //   OborotVedomScreen.load2 = true;
                                // });

                                // try {
                                //   await getInfoAndView(j, ordering);
                                // } on DioError catch (e) {
                                //   await ErrorHandler.errorModal(
                                //     context: context,
                                //     errorCode: e.response,
                                //   );
                                // }
                                // setState(() {
                                //   OborotVedomScreen.load2 = false;
                                // });
                              },
                              child: Center(
                                child: BigText(
                                  size: 16,
                                  text: "quantity_spis",
                                ),
                              ),
                            )),
                              DataColumn2(
                                label: InkWell(
                              onTap: () async {
                                // setState(() {
                                //   j = 1;
                                //   ordering = "quantity_inv";
                                // });
                                // setState(() {
                                //   OborotVedomScreen.load2 = true;
                                // });

                                // try {
                                //   await getInfoAndView(j, ordering);
                                // } on DioError catch (e) {
                                //   await ErrorHandler.errorModal(
                                //     context: context,
                                //     errorCode: e.response,
                                //   );
                                // }
                                // setState(() {
                                //   OborotVedomScreen.load2 = false;
                                // });
                              },
                              child: Center(
                                child: BigText(
                                  size: 16,
                                  text: "quantity_inv",
                                ),
                              ),
                            )),
                              DataColumn2(
                                label: InkWell(
                              onTap: () async {
                                // setState(() {
                                //   j = 1;
                                //   ordering = "quantity_ost";
                                // });
                                // setState(() {
                                //   OborotVedomScreen.load2 = true;
                                // });

                                // try {
                                //   await getInfoAndView(j, ordering);
                                // } on DioError catch (e) {
                                //   await ErrorHandler.errorModal(
                                //     context: context,
                                //     errorCode: e.response,
                                //   );
                                // }
                                // setState(() {
                                //   OborotVedomScreen.load2 = false;
                                // });
                              },
                              child: Center(
                                child: BigText(
                                  size: 16,
                                  text: "quantity_ost",
                                ),
                              ),
                            )),
                            // DataColumn2(
                            //     label: InkWell(
                            //   onTap: () async {
                            //     setState(() {
                            //       j = 1;
                            //       ordering = "skl1name";
                            //     });
                            //     setState(() {
                            //       OborotVedomScreen.load2 = true;
                            //     });

                            //     try {
                            //       await getInfoAndView(j, ordering);
                            //     } on DioError catch (e) {
                            //       await ErrorHandler.errorModal(
                            //         context: context,
                            //         errorCode: e.response,
                            //       );
                            //     }

                            //     setState(() {
                            //       OborotVedomScreen.load2 = false;
                            //     });
                            //   },
                            //   child: Center(
                            //     child: BigText(
                            //       size: 16,
                            //       text: "skl1name",
                            //     ),
                            //   ),
                            // )),
                            DataColumn2(
                                label: InkWell(
                              onTap: () async {
                                setState(() {
                                  j = 1;
                                  ordering = "barcode";
                                });
                                setState(() {
                                  OborotVedomScreen.load2 = true;
                                });

                                try {
                                  await getInfoAndView(j, ordering);
                                } on DioError catch (e) {
                                  await ErrorHandler.errorModal(
                                    context: context,
                                    errorCode: e.response,
                                  );
                                }
                                setState(() {
                                  OborotVedomScreen.load2 = false;
                                });
                              },
                              child: Center(
                                child: BigText(
                                  size: 16,
                                  text: "barcode",
                                ),
                              ),
                            )),
                            DataColumn2(
                                label: InkWell(
                              onTap: () async {
                                setState(() {
                                  j = 1;
                                  ordering = "kod_tov";
                                });
                                setState(() {
                                  OborotVedomScreen.load2 = true;
                                });

                                try {
                                  await getInfoAndView(j, ordering);
                                } on DioError catch (e) {
                                  await ErrorHandler.errorModal(
                                    context: context,
                                    errorCode: e.response,
                                  );
                                }

                                setState(() {
                                  OborotVedomScreen.load2 = false;
                                });
                              },
                              child: Center(
                                child: BigText(
                                  size: 16,
                                  text: "kod_tov",
                                ),
                              ),
                            )),
                          ],
                          rows: [
                            for (var i = 0;
                                i <
                                    oborotVedomState
                                        .oborotVedomList.length;
                                i++)
                              DataRow2(cells: [
                                DataCell(
                                  Container(
                                    width: 150,
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Text(
                                        oborotVedomState
                                            .oborotVedomList[i].name
                                            .toString(),
                                        maxLines: 1,
                                        style: i % 2 == 0
                                            ? const TextStyle(
                                                color: AppColors.appBlack)
                                            : const TextStyle(
                                                color: Colors.black45),
                                      ),
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Center(
                                    child: Text(
                                      oborotVedomState
                                          .oborotVedomList[i].ed_izm
                                          .toString(),
                                      maxLines: 1,
                                      style: i % 2 == 0
                                          ? const TextStyle(
                                              color: AppColors.appBlack)
                                          : const TextStyle(
                                              color: Colors.black45),
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Center(
                                    child: Text(
                                      oborotVedomState
                                          .oborotVedomList[i].quantity_nach
                                          .toString(),
                                      maxLines: 1,
                                      style: i % 2 == 0
                                          ? const TextStyle(
                                              color: AppColors.appBlack)
                                          : const TextStyle(
                                              color: Colors.black45),
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Center(
                                    child: Text(
                                      oborotVedomState
                                          .oborotVedomList[i].quantity_pr
                                          .toString(),
                                      maxLines: 1,
                                      style: i % 2 == 0
                                          ? const TextStyle(
                                              color: AppColors.appBlack)
                                          : const TextStyle(
                                              color: Colors.black45),
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Center(
                                    child: Text(
                                      oborotVedomState
                                          .oborotVedomList[i].quantity_rx
                                          .toString(),
                                      maxLines: 1,
                                      style: i % 2 == 0
                                          ? const TextStyle(
                                              color: AppColors.appBlack)
                                          : const TextStyle(
                                              color: Colors.black45),
                                    ),
                                  ),
                                ),
                                DataCell(Center(
                                  child: Text(
                                    oborotVedomState
                                        .oborotVedomList[i].quantity_vp
                                        .toString(),
                                    maxLines: 1,
                                    style: i % 2 == 0
                                        ? const TextStyle(
                                            color: AppColors.appBlack)
                                        : const TextStyle(
                                            color: Colors.black45),
                                  ),
                                )),
                                DataCell(Center(
                                  child: Text(
                                    oborotVedomState
                                        .oborotVedomList[i].quantity_vt
                                        .toString(),
                                    maxLines: 1,
                                    style: i % 2 == 0
                                        ? const TextStyle(
                                            color: AppColors.appBlack)
                                        : const TextStyle(
                                            color: Colors.black45),
                                  ),
                                )),
                                DataCell(Center(
                                  child: Text(
                                    oborotVedomState
                                        .oborotVedomList[i].quantity_vtp
                                        .toString(),
                                    maxLines: 1,
                                    style: i % 2 == 0
                                        ? const TextStyle(
                                            color: AppColors.appBlack)
                                        : const TextStyle(
                                            color: Colors.black45),
                                  ),
                                )),
                                DataCell(Center(
                                  child: Text(
                                    oborotVedomState
                                        .oborotVedomList[i].quantity_spis
                                        .toString(),
                                    maxLines: 1,
                                    style: i % 2 == 0
                                        ? const TextStyle(
                                            color: AppColors.appBlack)
                                        : const TextStyle(
                                            color: Colors.black45),
                                  ),
                                )),
                                DataCell(Center(
                                  child: Text(
                                    oborotVedomState
                                        .oborotVedomList[i].quantity_inv
                                        .toString(),
                                    maxLines: 1,
                                    style: i % 2 == 0
                                        ? const TextStyle(
                                            color: AppColors.appBlack)
                                        : const TextStyle(
                                            color: Colors.black45),
                                  ),
                                )),
                                DataCell(Center(
                                  child: Text(
                                    oborotVedomState
                                        .oborotVedomList[i].quantity_ost
                                        .toString(),
                                    maxLines: 1,
                                    style: i % 2 == 0
                                        ? const TextStyle(
                                            color: AppColors.appBlack)
                                        : const TextStyle(
                                            color: Colors.black45),
                                  ),
                                )),
                                // DataCell(Center(
                                //   child: Text(
                                //     oborotVedomState
                                //         .oborotVedomList[i].skl1name
                                //         .toString(),
                                //     maxLines: 1,
                                //     style: i % 2 == 0
                                //         ? const TextStyle(
                                //             color: AppColors.appBlack)
                                //         : const TextStyle(
                                //             color: Colors.black45),
                                //   ),
                                // )),
                                DataCell(
                                  Center(
                                    child: Text(
                                      oborotVedomState
                                          .oborotVedomList[i].barcode
                                          .toString(),
                                      maxLines: 1,
                                      style: i % 2 == 0
                                          ? const TextStyle(
                                              color: AppColors.appBlack)
                                          : const TextStyle(
                                              color: Colors.black45),
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Center(
                                    child: Text(
                                      oborotVedomState
                                          .oborotVedomList[i].kod_tov
                                          .toString(),
                                      maxLines: 1,
                                      style: i % 2 == 0
                                          ? const TextStyle(
                                              color: AppColors.appBlack)
                                          : const TextStyle(
                                              color: Colors.black45),
                                    ),
                                  ),
                                ),
                              ]),
                          ],
                        ),
                      ),
                      if (OborotVedomScreen.load_ == true)
                        Center(
                            child: Container(
                                height: 80,
                                width: 80,
                                child: Column(
                                  children: [
                                    Center(
                                      child: const CircularProgressIndicator(
                                        color: AppColors.appCoral,
                                      ),
                                    ),
                                  ],
                                )))
                    ],
                  ));
                })
              : const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.appCoral,
                  ),
                )),
    );
  }

  getInfoAndView(int point, String tip) async {
    await oborotVedomState.getOborotVedom(
        data_s: OborotVedomFilter.firstDatecontraller.text,
        page: point,
        data_e: OborotVedomFilter.secondDatecontraller.text,
        category_name: OborotVedomFilter.productGroupContraller == null ||
                OborotVedomFilter.productGroupContraller == "all" ||
                OborotVedomFilter.productGroupContraller == "Все"
            ? ""
            : OborotVedomFilter.productGroupContraller,
        name: OborotVedomFilter.productItemContraller == null
            ? ""
            : OborotVedomFilter.productItemContraller,
        sklname: OborotVedomFilter.firstWarehouseContraller == null
            ? ""
            : OborotVedomFilter.firstWarehouseContraller,
        order_by: tip);
  }
}
