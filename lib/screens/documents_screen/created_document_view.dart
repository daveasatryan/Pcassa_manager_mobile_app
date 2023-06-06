import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:get_it/get_it.dart';
import 'package:pcassa_retail/constants/app_themes/app_colors/app_colors.dart';
import 'package:pcassa_retail/constants/dimensions/dimensions.dart';

import 'package:pcassa_retail/router/router.gr.dart';
import 'package:pcassa_retail/router/services.dart';
import 'package:pcassa_retail/screens/documents_screen/filter_document_dialog.dart';
import 'package:pcassa_retail/screens/documents_screen/new_document_create.dart';
import 'package:pcassa_retail/store/document_view_state/document_view_state.dart';
import 'package:pcassa_retail/widgets/app_icons.dart';
import 'package:pcassa_retail/widgets/big_text.dart';
import 'package:pcassa_retail/widgets/middle_text.dart';

import '../../constants/app_themes/app_icons/app_icons.dart';
import '../../store/contragent_state/contragent_state.dart';
import '../../store/currency_state/currency_state.dart';
import '../../store/nakl_info_state/nakl_info_state.dart';
import '../../store/warehouse_state/warehouse_state.dart';

class CreatedDocumentView extends StatefulWidget {
  const CreatedDocumentView({Key? key}) : super(key: key);

  @override
  State<CreatedDocumentView> createState() => _CreatedDocumentViewState();
}

var documentViewState = GetIt.I<DocumentViewState>();

var naklInfo = GetIt.I<NaklInfoState>();
bool isLoading = false;
var contragemtState = GetIt.I<ContragentState>();
var warehouseState = GetIt.I<WarehouseState>();
var currencyState = GetIt.I<CreatedCurrencys>();

class _CreatedDocumentViewState extends State<CreatedDocumentView> {
   
 @override
 void initState() {
   super.initState();

 }
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
              router.replace(MainRoute());
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
                  warehouseState.warehouseNames.clear();
                  await warehouseState.getWarehouseNames();
                  await contragemtState.getContragentNames();
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return FilterDocument();
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
                                      text: "sklad",
                                    )),
                                  ], rows: [
                                    for (int i = 0;
                                        i <
                                            documentViewState
                                                .naklViewInfo.length;
                                        i++)
                                      DataRow(cells: [
                                        DataCell(PopupMenuButton(
                                            // add icon, by default "3 dot" icon
                                            icon: AppIcons(
                                              icon: Icons.edit,
                                              iconColor: AppColors.appCoral,
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
                                                            text: "delete".tr())
                                                      ],
                                                    )),
                                              ];
                                            },
                                            onSelected: (value) async {
                                              if (value == 0) {
                                                await documentViewState
                                                    .openDocument(
                                                        id: documentViewState
                                                            .naklViewInfo[i]
                                                            .id!);

                                                await showGeneralDialog(
                                                  context: context,
                                                  barrierDismissible: false,
                                                  transitionBuilder: (context,
                                                      animation,
                                                      secondaryAnimation,
                                                      child) {
                                                    return FadeTransition(
                                                      opacity: animation,
                                                      child: ScaleTransition(
                                                        scale: animation,
                                                        child: child,
                                                      ),
                                                    );
                                                  },
                                                  pageBuilder: (context,
                                                      animation,
                                                      secondaryAnimation) {
                                                    return Scaffold(
                                                        body: NewDocumentCreate(
                                                      documentCode:
                                                          documentViewState
                                                              .naklViewInfo[i]
                                                              .typ_d!,
                                                      documentName:
                                                          documentViewState
                                                              .naklViewInfo[i]
                                                              .tip_name!,
                                                    ));
                                                    // CreatedDocumentView());
                                                  },
                                                );
                                              } else if (value == 1) {
                                                //Delete Functionality
                                                showDialog<void>(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return StatefulBuilder(
                                                      builder:
                                                          (BuildContext context,
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
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      TextButton(
                                                                          onPressed:
                                                                              () async {
                                                                            startLoad(setState);
                                                                            await documentViewState.deleteDocument(
                                                                                id: documentViewState.naklViewInfo[i].id!,
                                                                                n_dok: FilterDocument.documentNumberContraller.text,
                                                                                data_s: FilterDocument.firstDatacontraller.text,
                                                                                data_e: FilterDocument.secondDateContraller.text,
                                                                                tip_name: FilterDocument.typeContraller,
                                                                                kontname: FilterDocument.contragentContraller,
                                                                                skl1name: FilterDocument.firstWarehouseContraller,
                                                                                skl2name: FilterDocument.secondWarehouseContraller,
                                                                                aktiv: FilterDocument.statusContraller);
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
                                                                          onPressed:
                                                                              () {
                                                                            Navigator.pop(context);
                                                                          },
                                                                          child:
                                                                              MiddleText(
                                                                            text:
                                                                                'cancle'.tr(),
                                                                            color:
                                                                                AppColors.appCoral,
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
                                                text: documentViewState
                                                    .naklViewInfo[i].n_dok!,
                                                color: AppColors.appBlack,
                                              ),
                                            ),
                                          ),
                                        ),
                                        DataCell(Container(
                                          color: documentViewState
                                                      .naklViewInfo[i].typ_d ==
                                                  15
                                              ? Colors.green
                                              : documentViewState
                                                          .naklViewInfo[i]
                                                          .typ_d ==
                                                      16
                                                  ? Colors.yellow
                                                  : documentViewState
                                                              .naklViewInfo[i]
                                                              .typ_d ==
                                                          17
                                                      ? Colors.blue
                                                      : documentViewState
                                                                  .naklViewInfo[
                                                                      i]
                                                                  .typ_d ==
                                                              18
                                                          ? Colors.red
                                                          : documentViewState
                                                                      .naklViewInfo[
                                                                          i]
                                                                      .typ_d ==
                                                                  19
                                                              ? Colors.purple
                                                              : documentViewState
                                                                          .naklViewInfo[
                                                                              i]
                                                                          .typ_d ==
                                                                      20
                                                                  ? Colors.pink
                                                                  : null,
                                          height: Dimensions.height20 * 2,
                                          child: Center(
                                            child: MiddleText(
                                              text: documentViewState
                                                  .naklViewInfo[i].tip_name!,
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
                                                      documentViewState
                                                          .naklViewInfo[i]
                                                          .data_d!)),
                                              color: AppColors.appBlack,
                                            ),
                                          ),
                                        )),
                                        DataCell(Container(
                                          height: Dimensions.height20 * 2,
                                          child: Center(
                                            child: MiddleText(
                                              text: documentViewState
                                                  .naklViewInfo[i].kontname
                                                  .toString(),
                                              color: AppColors.appBlack,
                                            ),
                                          ),
                                        )),
                                        DataCell(Container(
                                            height: Dimensions.height20 * 2,
                                            child: Center(
                                              child: documentViewState
                                                              .naklViewInfo[i]
                                                              .typ_d ==
                                                          15 ||
                                                      documentViewState
                                                              .naklViewInfo[i]
                                                              .typ_d ==
                                                          18 ||
                                                      documentViewState
                                                              .naklViewInfo[i]
                                                              .typ_d ==
                                                          19
                                                  ? MiddleText(
                                                      text: documentViewState
                                                                  .naklViewInfo[
                                                                      i]
                                                                  .skl1name
                                                                  .toString() ==
                                                              "null"
                                                          ? documentViewState
                                                              .naklViewInfo[i]
                                                              .skl1name
                                                              .toString()
                                                              .replaceAll(
                                                                  "null",
                                                                  "notSelected")
                                                          : documentViewState
                                                              .naklViewInfo[i]
                                                              .skl1name
                                                              .toString(),
                                                      color: AppColors.appBlack,
                                                    )
                                                  : MiddleText(
                                                      text: documentViewState
                                                                  .naklViewInfo[
                                                                      i]
                                                                  .skl2name
                                                                  .toString() ==
                                                              "null"
                                                          ? documentViewState
                                                              .naklViewInfo[i]
                                                              .skl2name
                                                              .toString()
                                                              .replaceAll(
                                                                  "null",
                                                                  "notSelected")
                                                          : documentViewState
                                                              .naklViewInfo[i]
                                                              .skl2name
                                                              .toString(),
                                                      color:
                                                          AppColors.appBlack),
                                            ))),
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

    FilterDocument.contragentContraller = "notSelected";
    FilterDocument.documentNumberContraller.text = "";
    FilterDocument.firstDatacontraller.text = "";
    FilterDocument.firstWarehouseContraller = "notSelected";
    FilterDocument.secondDateContraller.text = "";
    FilterDocument.secondWarehouseContraller = "notSelected";
    FilterDocument.statusContraller = 1;
    FilterDocument.typeContraller = "notSelected";
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
