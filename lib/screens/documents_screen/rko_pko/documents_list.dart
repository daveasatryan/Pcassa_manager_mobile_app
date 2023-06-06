import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pcassa_retail/constants/app_themes/app_colors/app_colors.dart';
import 'package:pcassa_retail/constants/app_themes/app_icons/app_icons.dart';
import 'package:pcassa_retail/constants/dimensions/dimensions.dart';

import 'package:pcassa_retail/router/router.gr.dart';
import 'package:pcassa_retail/router/services.dart';
import 'package:pcassa_retail/screens/documents_screen/rko_pko/filter_rko_pko_document.dart';
import 'package:pcassa_retail/screens/documents_screen/rko_pko/pko.dart';
import 'package:pcassa_retail/screens/documents_screen/rko_pko/rko.dart';
import 'package:pcassa_retail/store/cash_order_state/cash_order_state.dart';
import 'package:pcassa_retail/store/contragent_state/contragent_state.dart';
import 'package:pcassa_retail/store/currency_state/currency_state.dart';
import 'package:pcassa_retail/widgets/app_icons.dart';
import 'package:pcassa_retail/widgets/big_text.dart';
import 'package:pcassa_retail/widgets/middle_text.dart';

class RkoPkoList extends StatefulWidget {
  const RkoPkoList({Key? key}) : super(key: key);

  @override
  State<RkoPkoList> createState() => _RkoPkoListState();
}

var cashOrderstate = GetIt.I<CashOrderState>();

bool isLoading = false;
var contragemtState = GetIt.I<ContragentState>();
var currencyState = GetIt.I<CreatedCurrencys>();

class _RkoPkoListState extends State<RkoPkoList> {
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
              text: 'myDocuments',
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
                    contragemtState.contragentNames.clear();
                    await contragemtState.getContragentNames();
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return const FilterRkoPko();
                      },
                    );
                  },
                  icon: AppIcons(
                    icon: Icons.filter_alt_outlined,
                    iconColor: AppColors.appWhite,
                    size: Dimensions.iconSize24,
                  )),
            ],
          ),
          body: Observer(
              builder: (context) => SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        Container(
                            child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Container(
                                  child: Observer(builder: (_) {
                                    return DataTable(columns: [
                                      DataColumn(
                                          label: IconButton(
                                        icon: AppIcons(
                                          icon: Icons.edit,
                                          iconColor: AppColors.appBlack,
                                          size: Dimensions.iconSize24,
                                        ),
                                        onPressed: () {},
                                      )),
                                      DataColumn(
                                          label: BigText(
                                        text: "n_dok",
                                      )),
                                      DataColumn(
                                          label: BigText(
                                        text: "tip",
                                      )),
                                      DataColumn(
                                          label: BigText(
                                        text: "data",
                                      )),
                                      DataColumn(
                                          label: BigText(
                                        text: "kontragent",
                                      )),
                                      DataColumn(
                                          label: BigText(
                                        text: "summa",
                                      )),
                                    ], rows: [
                                      for (int i = 0;
                                          i <
                                              cashOrderstate
                                                  .resultCashOrder.length;
                                          i++)
                                        DataRow(
                                            color: cashOrderstate
                                                        .resultCashOrder[i]
                                                        .typ_d ==
                                                    21
                                                ? MaterialStateProperty
                                                    .resolveWith<Color?>((Set<
                                                            MaterialState>
                                                        states) {
                                                    if (states.contains(
                                                        MaterialState
                                                            .selected)) {
                                                      return Colors.green;
                                                    }
                                                    return Colors
                                                        .green; // Use the default value.
                                                  })
                                                : cashOrderstate
                                                            .resultCashOrder[i]
                                                            .typ_d ==
                                                        22
                                                    ? MaterialStateProperty
                                                        .resolveWith<Color?>(
                                                            (Set<MaterialState>
                                                                states) {
                                                        if (states.contains(
                                                            MaterialState
                                                                .selected)) {
                                                          return Colors.cyan;
                                                        }
                                                        return Colors
                                                            .cyan; // Use the default value.
                                                      })
                                                    : null,
                                            cells: [
                                              DataCell(PopupMenuButton(
                                                  // add icon, by default "3 dot" icon
                                                  icon: AppIcons(
                                                    icon: Icons.edit,
                                                    iconColor:
                                                        AppColors.appWhite,
                                                  ),
                                                  itemBuilder: (context) {
                                                    return [
                                                      PopupMenuItem<int>(
                                                          value: 0,
                                                          child: Row(
                                                            children: [
                                                              AppIcons(
                                                                icon: Icons
                                                                    .remove_red_eye,
                                                                size: Dimensions
                                                                    .iconSize24,
                                                              ),
                                                              SizedBox(
                                                                width: Dimensions
                                                                    .width15,
                                                              ),
                                                              MiddleText(
                                                                text:
                                                                    "open".tr(),
                                                              )
                                                            ],
                                                          )),
                                                      PopupMenuItem<int>(
                                                          value: 1,
                                                          child: Row(
                                                            children: [
                                                              CustomIcons
                                                                  .delete,
                                                              SizedBox(
                                                                width: Dimensions
                                                                    .width15,
                                                              ),
                                                              MiddleText(
                                                                  text: "delete"
                                                                      .tr())
                                                            ],
                                                          )),
                                                    ];
                                                  },
                                                  onSelected: (value) async {
                                                    if (value == 0) {
                                                      await cashOrderstate
                                                          .openDocument(
                                                              id: cashOrderstate
                                                                  .resultCashOrder[
                                                                      i]
                                                                  .id!);
                                                      showGeneralDialog(
                                                        context: context,
                                                        barrierDismissible:
                                                            false,
                                                        transitionBuilder:
                                                            (context,
                                                                animation,
                                                                secondaryAnimation,
                                                                child) {
                                                          return FadeTransition(
                                                            opacity: animation,
                                                            child:
                                                                ScaleTransition(
                                                              scale: animation,
                                                              child: child,
                                                            ),
                                                          );
                                                        },
                                                        pageBuilder: (context,
                                                            animation,
                                                            secondaryAnimation) {
                                                          return Scaffold(
                                                              appBar: AppBar(
                                                                backgroundColor:
                                                                    AppColors
                                                                        .appPurple,
                                                                title:
                                                                    MiddleText(
                                                                  text: cashOrderstate
                                                                      .resultCashOrder[
                                                                          i]
                                                                      .tip_name!,
                                                                  color: AppColors
                                                                      .appWhite,
                                                                ),
                                                              ),
                                                              body: Container(
                                                                  child: cashOrderstate
                                                                              .resultCashOrder[
                                                                                  i]
                                                                              .typ_d ==
                                                                          21
                                                                      ? IncomingCashOreder(
                                                                          justClose:
                                                                              false,
                                                                        )
                                                                      : ExpendableCashOrder(
                                                                          justClose:
                                                                              false)));

                                                          // body: Column(
                                                        },
                                                      );
                                                    } else if (value == 1) {
                                                      //Delete Functionality
                                                      showDialog<void>(
                                                        context: context,
                                                        builder: (BuildContext
                                                            context) {
                                                          return StatefulBuilder(
                                                            builder: (BuildContext
                                                                    context,
                                                                StateSetter
                                                                    setState) {
                                                              return Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  SizedBox(
                                                                    height: Dimensions
                                                                        .deletePopUpHeight,
                                                                    width: Dimensions
                                                                        .deletePopwidth,
                                                                    child:
                                                                        SimpleDialog(
                                                                      title:
                                                                          MiddleText(
                                                                        text:
                                                                            "${'deleteDocument'.tr()} ?",
                                                                      ),
                                                                      children: [
                                                                        Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            TextButton(
                                                                                onPressed: () async {
                                                                                  startLoad(setState);
                                                                                  await cashOrderstate.delteCashOrdersByFilter(
                                                                                      id: cashOrderstate.resultCashOrder[i].id!,
                                                                                      n_dok: FilterRkoPko.documentNumberContraller.text,
                                                                                      data_s: FilterRkoPko.firstDatacontraller.text,
                                                                                      data_e: FilterRkoPko.secondDateContraller.text,
                                                                                      tip_name: FilterRkoPko.typeContraller == "rko"
                                                                                          ? "рко"
                                                                                          : FilterRkoPko.typeContraller == "pko"
                                                                                              ? "пко"
                                                                                              : "",
                                                                                      kontname: FilterRkoPko.contragentContraller == "notSelected" ? "" : FilterRkoPko.contragentContraller,
                                                                                      kassname: FilterRkoPko.stationContraller == "notSelected" ? "" : FilterRkoPko.stationContraller);

                                                                                  endLoad(setState);
                                                                                },
                                                                                child: isLoading
                                                                                    ? const CircularProgressIndicator(
                                                                                        color: AppColors.appCoral,
                                                                                      )
                                                                                    : MiddleText(
                                                                                        text: 'delete'.tr(),
                                                                                        color: AppColors.appCoral,
                                                                                      )),
                                                                            TextButton(
                                                                                onPressed: () {
                                                                                  Navigator.pop(context);
                                                                                },
                                                                                child: MiddleText(
                                                                                  text: 'cancle'.tr(),
                                                                                  color: AppColors.appCoral,
                                                                                )),
                                                                          ],
                                                                        )
                                                                      ],
                                                                    ),
                                                                  )
                                                                ],
                                                              );
                                                            },
                                                          );
                                                        },
                                                      );
                                                    }
                                                  })),
                                              DataCell(
                                                Container(
                                                  height:
                                                      Dimensions.height20 * 2,
                                                  child: Center(
                                                    child: MiddleText(
                                                      text: cashOrderstate
                                                          .resultCashOrder[i]
                                                          .n_dok!,
                                                      color: AppColors.appWhite,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              DataCell(Container(
                                                height: Dimensions.height20 * 2,
                                                child: Center(
                                                  child: MiddleText(
                                                    text: DateFormat(
                                                            'dd.MM.yyyy')
                                                        .format(DateTime.parse(
                                                            cashOrderstate
                                                                .resultCashOrder[
                                                                    i]
                                                                .data_d!)),
                                                    color: AppColors.appWhite,
                                                  ),
                                                ),
                                              )),
                                              DataCell(
                                                Container(
                                                  height:
                                                      Dimensions.height20 * 2,
                                                  child: Center(
                                                    child: MiddleText(
                                                      text: cashOrderstate
                                                          .resultCashOrder[i]
                                                          .tip_name!,
                                                      color: AppColors.appWhite,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              DataCell(Container(
                                                height: Dimensions.height20 * 2,
                                                child: Center(
                                                  child: MiddleText(
                                                    text: cashOrderstate
                                                        .resultCashOrder[i]
                                                        .kontname
                                                        .toString(),
                                                    color: AppColors.appWhite,
                                                  ),
                                                ),
                                              )),
                                              DataCell(Container(
                                                height: Dimensions.height20 * 2,
                                                child: Center(
                                                  child: MiddleText(
                                                    text: cashOrderstate
                                                        .resultCashOrder[i]
                                                        .summa
                                                        .toString(),
                                                    color: AppColors.appWhite,
                                                  ),
                                                ),
                                              )),
                                            ]),
                                    ]);
                                  }),
                                ))),
                      ],
                    ),
                  ))),
    );
  }

  @override
  void dispose() {
    super.dispose();
    FilterRkoPko.contragentContraller = "notSelected";
    FilterRkoPko.documentNumberContraller.text = "";
    FilterRkoPko.firstDatacontraller.text = "";
    FilterRkoPko.secondDateContraller.text = "";
    FilterRkoPko.stationContraller = "notSelected";
    FilterRkoPko.typeContraller = "notSelected";
  }

  //Start Delete Loading
  startLoad(setState) {
    setState(() {
      isLoading = true;
    });
  }

//Stop Delete Loading
  endLoad(setState) {
    setState(() {
      isLoading = false;
      router.pop();
    });
  }
}
