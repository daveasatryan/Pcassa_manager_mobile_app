import 'dart:io';

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
import 'package:pcassa_retail/store/remainder_items_state/remainder_items_state.dart';
import 'package:pcassa_retail/widgets/big_text.dart';
import 'package:pcassa_retail/widgets/middle_text.dart';
import '../../constants/app_themes/app_icons/app_icons.dart';
import '../../widgets/app_icons.dart';
import 'package:data_table_2/data_table_2.dart';

class RemainderScreen extends StatefulWidget {
  const RemainderScreen({super.key});
  @override
  State<RemainderScreen> createState() => _RemainderScreenState();
  static var load2 = false;
  static var load_ = false;
}

class _RemainderScreenState extends State<RemainderScreen> {
  var searchController = TextEditingController();
  var remainderState = GetIt.I<RemainderItemsState>();
  final ScrollController controller = ScrollController();
  final ScrollController controller2 = ScrollController();

  //var currencyContraller = ;
  var j = 1;

  var load3 = false;
  var lenght_ = 0;
  var can_do = false;
  var ordering = "";
  void initState() {
    RemainderScreen.load2 == false;
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
          RemainderScreen.load_ = true;
        });
        await Future.delayed(Duration(milliseconds: 500));
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
          RemainderScreen.load_ = false;
        });
      }
      //sleep(Duration(seconds: 1));
      //await remainderState.getRemainder(name: searchController.text);
    });
    searchController.addListener(() async {
      if (searchController.text.length > 2) {
        remainderState.remainderList.clear();
        await Future.delayed(Duration(milliseconds: 500));
        await remainderState.getRemainder(name: searchController.text);
      }
    });
  }

  void dispose() {
    super.dispose();
    remainderState.remainderList.clear();
    ordering = "";
    FilterReminder.secondDatecontraller.text = "";
    FilterReminder.productGroupContraller = "all".tr();
    FilterReminder.productItemContraller = "";
    FilterReminder.firstWarehouseContraller = "notSelected";
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
              text: 'reminder'.tr(),
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
                        return FilterReminder();
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
          body: RemainderScreen.load2 == false
              ? Observer(builder: (context) {
                  return Center(
                      child: Column(
                    children: [
                      Expanded(
                        child: DataTable2(
                          scrollController: controller,
                          fixedLeftColumns: 2,
                          horizontalMargin: 6,
                          columnSpacing: 5,
                          minWidth: 950,
                          columns: [
                            DataColumn2(
                                label: InkWell(
                              onTap: () async {
                                setState(() {
                                  j = 1;
                                  ordering = "name";
                                });
                                setState(() {
                                  RemainderScreen.load2 = true;
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
                                  RemainderScreen.load2 = false;
                                });
                              },
                              child: Center(
                                child: BigText(
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
                                  RemainderScreen.load2 = true;
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
                                  RemainderScreen.load2 = false;
                                });
                              },
                              child: Center(
                                child: BigText(
                                  text: "ed_izm",
                                ),
                              ),
                            )),
                            DataColumn2(
                                label: InkWell(
                              onTap: () async {
                                setState(() {
                                  j = 1;
                                  ordering = "quantity";
                                });
                                setState(() {
                                  RemainderScreen.load2 = true;
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
                                  RemainderScreen.load2 = false;
                                });
                              },
                              child: Center(
                                child: BigText(
                                  text: "quantity",
                                ),
                              ),
                            )),
                            DataColumn2(
                                label: InkWell(
                              onTap: () async {
                                setState(() {
                                  j = 1;
                                  ordering = "price_o_r";
                                });
                                setState(() {
                                  RemainderScreen.load2 = true;
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
                                  RemainderScreen.load2 = false;
                                });
                              },
                              child: Center(
                                child: BigText(
                                  text: "price_o_r",
                                ),
                              ),
                            )),
                            DataColumn2(
                                label: InkWell(
                              onTap: () async {
                                setState(() {
                                  j = 1;
                                  ordering = "price_s";
                                });
                                setState(() {
                                  RemainderScreen.load2 = true;
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
                                  RemainderScreen.load2 = false;
                                });
                              },
                              child: Center(
                                child: BigText(
                                  text: "price_s",
                                ),
                              ),
                            )),
                            DataColumn2(
                                label: InkWell(
                              onTap: () async {
                                setState(() {
                                  j = 1;
                                  ordering = "sklname";
                                });
                                setState(() {
                                  RemainderScreen.load2 = true;
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
                                  RemainderScreen.load2 = false;
                                });
                              },
                              child: Center(
                                child: BigText(
                                  text: "sklname",
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
                                  RemainderScreen.load2 = true;
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
                                  RemainderScreen.load2 = false;
                                });
                              },
                              child: Center(
                                child: BigText(
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
                                  RemainderScreen.load2 = true;
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
                                  RemainderScreen.load2 = false;
                                });
                              },
                              child: Center(
                                child: BigText(
                                  text: "kod_tov",
                                ),
                              ),
                            )),
                          ],
                          rows: [
                            for (var i = 0;
                                i < remainderState.remainderList.length;
                                i++)
                              DataRow2(cells: [
                                DataCell(
                                  Container(
                                    width: 150,
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Text(
                                        remainderState.remainderList[i].name
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
                                      remainderState.remainderList[i].ed_izm
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
                                      remainderState.remainderList[i].quantity
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
                                      remainderState.remainderList[i].price_o_r
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
                                      remainderState.remainderList[i].price_s
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
                                    remainderState.remainderList[i].sklname
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
                                    remainderState.remainderList[i].barcode
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
                                      remainderState.remainderList[i].kod_tov
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
                      if (RemainderScreen.load_ == true)
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
    await remainderState.getRemainder(
        page: point,
        data_e: FilterReminder.secondDatecontraller.text,
        category_name: FilterReminder.productGroupContraller == null ||
                FilterReminder.productGroupContraller == "all" ||
                FilterReminder.productGroupContraller == "Все"
            ? ""
            : FilterReminder.productGroupContraller,
        name: FilterReminder.productItemContraller == null
            ? ""
            : FilterReminder.productItemContraller,
        sklname: FilterReminder.firstWarehouseContraller == null
            ? ""
            : FilterReminder.firstWarehouseContraller,
        order_by: tip);
  }
}
