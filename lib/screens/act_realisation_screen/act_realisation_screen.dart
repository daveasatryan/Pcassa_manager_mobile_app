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
import 'package:pcassa_retail/screens/remainder_screen/filter_remainder_dialog.dart';
import 'package:pcassa_retail/store/act_realisation_state/act_realisation_state.dart';
import 'package:pcassa_retail/store/warehouse_state/warehouse_state.dart';
import 'package:pcassa_retail/widgets/big_text.dart';

import '../../constants/app_themes/app_icons/app_icons.dart';
import '../../widgets/app_icons.dart';

class ActRealisationScreen extends StatefulWidget {
  const ActRealisationScreen({super.key});
  @override
  State<ActRealisationScreen> createState() => _ActRealisationScreenState();
  static var load2 = false;
  static var load_ = false;
}

class _ActRealisationScreenState extends State<ActRealisationScreen> {
  var searchController = TextEditingController();
  var actRealisationState = GetIt.I<ActRealisationState>();
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
    ActRealisationScreen.load2 = false;
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
          ActRealisationScreen.load_ = true;
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
          ActRealisationScreen.load_ = false;
        });
      }
      //sleep(Duration(seconds: 1));
      //await remainderState.getRemainder(name: searchController.text);
    });
    searchController.addListener(() async {
      if (searchController.text.length > 2) {
        actRealisationState.actRealisationList.clear();
        await Future.delayed(const Duration(milliseconds: 500));
        await actRealisationState.getActRealisation(
            name: searchController.text);
      }
    });
  }

  void dispose() {
    super.dispose();
    actRealisationState.actRealisationList.clear();
    ordering = "";
    ActRealisationFilter.firstDatecontraller.text = "";

    ActRealisationFilter.secondDatecontraller.text = "";
    ActRealisationFilter.productGroupContraller = "all".tr();
    ActRealisationFilter.productItemContraller = "";
    ActRealisationFilter.firstWarehouseContraller = "notSelected";
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
              text: 'actRealisation'.tr(),
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
                        return ActRealisationFilter();
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
          body: ActRealisationScreen.load2 == false
              ? Observer(builder: (context) {
                  return Center(
                      child: Column(
                    children: [
                      Expanded(
                        child: DataTable2(
                          scrollController: controller,
                          fixedLeftColumns: 2,
                          horizontalMargin: 5,
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
                                  ActRealisationScreen.load2 = true;
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
                                  ActRealisationScreen.load2 = false;
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
                                  ActRealisationScreen.load2 = true;
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
                                  ActRealisationScreen.load2 = false;
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
                                setState(() {
                                  j = 1;
                                  ordering = "summa_o";
                                });
                                setState(() {
                                  ActRealisationScreen.load2 = true;
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
                                  ActRealisationScreen.load2 = false;
                                });
                              },
                              child: Center(
                                child: BigText(
                                  size: 16,
                                  text: "summa_o",
                                ),
                              ),
                            )),
                            DataColumn2(
                                label: InkWell(
                              onTap: () async {
                                setState(() {
                                  j = 1;
                                  ordering = "summa_p";
                                });
                                setState(() {
                                  ActRealisationScreen.load2 = true;
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
                                  ActRealisationScreen.load2 = false;
                                });
                              },
                              child: Center(
                                child: BigText(
                                  size: 16,
                                  text: "summa_p",
                                ),
                              ),
                            )),
                            DataColumn2(
                                label: InkWell(
                              onTap: () async {
                                setState(() {
                                  j = 1;
                                  ordering = "nacenka";
                                });
                                setState(() {
                                  ActRealisationScreen.load2 = true;
                                });
                                try {
                                  await getInfoAndView(j, ordering);
                                } on DioError catch (e) {
                                  await ErrorHandler.errorModal(
                                    context: context,
                                    errorCode: e.response,
                                  );
                                }
                                await getInfoAndView(j, ordering);

                                setState(() {
                                  ActRealisationScreen.load2 = false;
                                });
                              },
                              child: Center(
                                child: BigText(
                                  size: 16,
                                  text: "nacenka",
                                ),
                              ),
                            )),
                            DataColumn2(
                                label: InkWell(
                              onTap: () async {
                                setState(() {
                                  j = 1;
                                  ordering = "nacenka_tokos";
                                });
                                setState(() {
                                  ActRealisationScreen.load2 = true;
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
                                  ActRealisationScreen.load2 = false;
                                });
                              },
                              child: Center(
                                child: BigText(
                                  size: 16,
                                  text: "nacenka_tokos",
                                ),
                              ),
                            )),
                            DataColumn2(
                                label: InkWell(
                              onTap: () async {
                                setState(() {
                                  j = 1;
                                  ordering = "skl1name";
                                });
                                setState(() {
                                  ActRealisationScreen.load2 = true;
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
                                  ActRealisationScreen.load2 = false;
                                });
                              },
                              child: Center(
                                child: BigText(
                                  size: 16,
                                  text: "skl1name",
                                ),
                              ),
                            )),
                            DataColumn2(
                                label: InkWell(
                              onTap: () async {
                                setState(() {
                                  j = 1;
                                  ordering = "barcode";
                                });
                                setState(() {
                                  ActRealisationScreen.load2 = true;
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
                                  ActRealisationScreen.load2 = false;
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
                                  ActRealisationScreen.load2 = true;
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
                                  ActRealisationScreen.load2 = false;
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
                                    actRealisationState
                                        .actRealisationList.length;
                                i++)
                              DataRow2(cells: [
                                DataCell(
                                  Container(
                                    width: 150,
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Text(
                                        actRealisationState
                                            .actRealisationList[i].name
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
                                      actRealisationState
                                          .actRealisationList[i].ed_izm
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
                                      actRealisationState
                                          .actRealisationList[i].summa_o
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
                                      actRealisationState
                                          .actRealisationList[i].summa_p
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
                                      actRealisationState
                                          .actRealisationList[i].nacenka
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
                                    actRealisationState
                                        .actRealisationList[i].nacenka_tokos
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
                                    actRealisationState
                                        .actRealisationList[i].skl1name
                                        .toString(),
                                    maxLines: 1,
                                    style: i % 2 == 0
                                        ? const TextStyle(
                                            color: AppColors.appBlack)
                                        : const TextStyle(
                                            color: Colors.black45),
                                  ),
                                )),
                                DataCell(
                                  Center(
                                    child: Text(
                                      actRealisationState
                                          .actRealisationList[i].barcode
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
                                      actRealisationState
                                          .actRealisationList[i].kod_tov
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
                      if (ActRealisationScreen.load_ == true)
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
    await actRealisationState.getActRealisation(
        data_s: ActRealisationFilter.firstDatecontraller.text,
        page: point,
        data_e: ActRealisationFilter.secondDatecontraller.text,
        category_name: ActRealisationFilter.productGroupContraller == null ||
                ActRealisationFilter.productGroupContraller == "all" ||
                ActRealisationFilter.productGroupContraller == "Все"
            ? ""
            : ActRealisationFilter.productGroupContraller,
        name: ActRealisationFilter.productItemContraller == null
            ? ""
            : ActRealisationFilter.productItemContraller,
        sklname: ActRealisationFilter.firstWarehouseContraller == null
            ? ""
            : ActRealisationFilter.firstWarehouseContraller,
        order_by: tip);
  }
}
