import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pcassa_retail/constants/app_themes/app_colors/app_colors.dart';
import 'package:pcassa_retail/constants/dimensions/dimensions.dart';

import 'package:pcassa_retail/router/router.gr.dart';
import 'package:pcassa_retail/router/services.dart';
import 'package:pcassa_retail/screens/act_screen/act_create.dart';
import 'package:pcassa_retail/screens/act_screen/filter_act_dialog.dart';
import 'package:pcassa_retail/screens/act_screen/inner_of_act_screen.dart';
import 'package:pcassa_retail/store/act_state/act_state.dart';

import 'package:pcassa_retail/store/act_view_state/act_view_state.dart';
import 'package:pcassa_retail/store/contragent_state/contragent_state.dart';
import 'package:pcassa_retail/store/currency_state/currency_state.dart';
import 'package:pcassa_retail/store/spent_state/spent_state.dart';

import 'package:pcassa_retail/widgets/app_icons.dart';
import 'package:pcassa_retail/widgets/big_text.dart';
import 'package:pcassa_retail/widgets/middle_text.dart';

import '../../constants/app_themes/app_icons/app_icons.dart';

class CreatedActView extends StatefulWidget {
  const CreatedActView({Key? key}) : super(key: key);

  @override
  State<CreatedActView> createState() => _CreatedActViewState();
}

//var documentViewState = GetIt.I<DocumentViewState>();

// var naklInfo = GetIt.I<NaklInfoState>();
bool isLoading = false;
var contragemtState = GetIt.I<ContragentState>();
// var warehouseState = GetIt.I<WarehouseState>();
var currencyState = GetIt.I<CreatedCurrencys>();
var actViewState = GetIt.I<ActViewState>();
var spentState = GetIt.I<SpentState>();


class _CreatedActViewState extends State<CreatedActView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            text: 'act'.tr(),
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
                onPressed: () async{
                  //Edit Screen Route
                    contragemtState.contragentNames.clear();
                    spentState.spentListNames.clear();
                    await contragemtState.getContragentNames();
                    await spentState.getSpentNames();
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return const FilterAct();
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
            builder: (_) => SingleChildScrollView(
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
                                      text: "n_dok".tr(),
                                    )),
                                    // DataColumn(
                                    //     label: BigText(
                                    //   text: "tip",
                                    // )),
                                    DataColumn(
                                        label: BigText(
                                      text: "kontragent".tr(),
                                    )),
                                    DataColumn(
                                        label: BigText(
                                      text: "data".tr(),
                                    )),

                                    DataColumn(
                                        label: BigText(
                                      text: "spentName".tr(),
                                    )),
                                  ], rows: [
                                    for (int i = 0;
                                        i < actViewState.actViewInfo.length;
                                        i++)
                                      DataRow(
                                          color: MaterialStateProperty.all(
                                              Colors.pink),
                                          cells: [
                                            DataCell(PopupMenuButton(
                                                // add icon, by default "3 dot" icon
                                                icon: AppIcons(
                                                  icon: Icons.edit,
                                                  iconColor: AppColors.appWhite,
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
                                                              text: "open".tr(),
                                                            )
                                                          ],
                                                        )),
                                                    PopupMenuItem<int>(
                                                        value: 1,
                                                        child: Row(
                                                          children: [
                                                            CustomIcons.delete,
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
                                                    await openAct(actViewState
                                                        .actViewInfo[i].id!);
                                                    //await spensState.getSpent();
                                                    await showGeneralDialog(
                                                      context: context,
                                                      barrierDismissible: false,
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
                                                              title: MiddleText(
                                                                text: actViewState
                                                                    .actViewInfo[
                                                                        i]
                                                                    .name!,
                                                                color: AppColors
                                                                    .appWhite,
                                                              ),
                                                            ),
                                                            body:
                                                                ActCreateScreen(
                                                                    justClose:
                                                                        false));
                                                        // CreatedActView());
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
                                                                                try {
                                                                                  startLoad(setState);
                                                                                  await actViewState.delActFromList(
                                                                                      id: actViewState.actViewInfo[i].id!,
                                                                                      n_dok: FilterAct.documentNumberContraller.text == null ? "" : FilterAct.documentNumberContraller.text,
                                                                                      data_s: FilterAct.firstDatacontraller.text == null ? "" : FilterAct.firstDatacontraller.text,
                                                                                      data_e: FilterAct.secondDateContraller.text == null ? "" : FilterAct.secondDateContraller.text,
                                                                                      // tip_name: typeContraller == "p/n"
                                                                                      //     ? "п/н"
                                                                                      //     : typeContraller == "r/n"
                                                                                      //         ? "р/н"
                                                                                      //         : typeContraller == "spis"
                                                                                      //             ? "спис"
                                                                                      //             : typeContraller == "vp"
                                                                                      //                 ? "вп"
                                                                                      //                 : typeContraller == "v/t"
                                                                                      //                     ? "в/т"
                                                                                      //                     : typeContraller == "v/tpos"
                                                                                      //                         ? "в/тпос"
                                                                                      //                         : null,
                                                                                      kontname: FilterAct.contragentContraller == null ? "" : FilterAct.contragentContraller!,
                                                                                      zatratname: FilterAct.zatratNameContraller == null ? "" : FilterAct.zatratNameContraller!);
                                                                                  endLoad(setState);
                                                                                } catch (e) {
                                                                                  print(e);
                                                                                }
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
                                                height: Dimensions.height20 * 2,
                                                child: Center(
                                                  child: MiddleText(
                                                    text: actViewState
                                                        .actViewInfo[i].n_dok!,
                                                    color: AppColors.appWhite,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            DataCell(Container(
                                              height: Dimensions.height20 * 2,
                                              child: Center(
                                                child: MiddleText(
                                                  text: actViewState
                                                              .actViewInfo[i]
                                                              .kontname !=
                                                          null
                                                      ? actViewState
                                                          .actViewInfo[i]
                                                          .kontname
                                                          .toString()
                                                      : "notSelected",
                                                  color: AppColors.appWhite,
                                                ),
                                              ),
                                            )),
                                            DataCell(Container(
                                              height: Dimensions.height20 * 2,
                                              child: Center(
                                                child: MiddleText(
                                                  text: DateFormat('dd.MM.yyyy')
                                                      .format(DateTime.parse(
                                                          actViewState
                                                              .actViewInfo[i]
                                                              .data_d!)),
                                                  color: AppColors.appWhite,
                                                ),
                                              ),
                                            )),
                                            DataCell(Container(
                                              height: Dimensions.height20 * 2,
                                              child: Center(
                                                  child: MiddleText(
                                                color: AppColors.appWhite,
                                                text: actViewState
                                                    .actViewInfo[i].name!,
                                              )),
                                            )),
                                          ]),
                                  ]);
                                }),
                              ))),
                    ],
                  ),
                )));
  }
@override
void dispose() {
  
  super.dispose();
   FilterAct.contragentContraller = "notSelected";
      FilterAct.documentNumberContraller.text = "";
      FilterAct.firstDatacontraller.text = "";
      FilterAct.secondDateContraller.text = "";
      FilterAct.zatratNameContraller = "notSelected";
}
  //Start Delete Loading
  startLoad(setState) {
    setState(() {
      isLoading = true;
    });
  }

  openAct(int id) async {
    currencyState.currencyShortNames.clear();
    spensState.spentList.clear();
    await spensState.getSpent();
    await contragemtState.getContragents(context: context);
    await contragemtState.categoryFirstMade();
    await currencyState.getCreatedCurencys();
    await currencyState.getShortNames();
    var res_ = await actViewState.searchActForView(id: id);
    GetIt.I<ActState>().actInfoForCreate = res_;
    // await GetIt.I<ActState>().getActMainInfo(
    //     actInfo_: ActModel(
    //         id: 0,
    //         n_dok: "",
    //         data_d: DateFormat("dd.MM.yyyy").format(DateTime.now()),
    //         typ_d: 24,
    //         summa: 0,
    //         id_osn: 0,
    //         t_osn: 0,
    //         prim: "",
    //         kodpost: int.parse(contragemtState.contragentsElements.first.kod!),
    //         namepost: "",
    //         val:currencyState.currencyShortNames.first,
    //         aktiv: 1,
    //         kurs: 0.0,
    //         summa_val: 0,
    //         kodzatrat: 0,
    //         namezatrat: "",
    //         srok_oplati: DateFormat("dd.MM.yyyy").format(DateTime.now())));
  }

//Stop Delete Loading
  endLoad(setState) {
    setState(() {
      isLoading = false;
      router.pop();
    });
  }
}
