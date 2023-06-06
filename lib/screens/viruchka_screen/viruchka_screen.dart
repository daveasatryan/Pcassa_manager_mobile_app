import 'package:data_table_2/paginated_data_table_2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pcassa_retail/constants/app_themes/app_colors/app_colors.dart';
import 'package:pcassa_retail/constants/app_themes/app_icons/app_icons.dart';
import 'package:pcassa_retail/constants/dimensions/dimensions.dart';
import 'package:pcassa_retail/constants/paddings_constants/padding_constants.dart';

import 'package:pcassa_retail/router/router.gr.dart';
import 'package:pcassa_retail/router/services.dart';
import 'package:pcassa_retail/screens/viruchka_screen/viruchka_filter_screen.dart';
import 'package:pcassa_retail/store/user_state/user_state.dart';

import 'package:pcassa_retail/store/viruchka_state/viruchka_state.dart';
import 'package:pcassa_retail/widgets/app_icons.dart';
import 'package:pcassa_retail/widgets/big_text.dart';
import 'package:pcassa_retail/widgets/middle_text.dart';

class ViruchkaScreen extends StatefulWidget {
  const ViruchkaScreen({Key? key}) : super(key: key);

  @override
  State<ViruchkaScreen> createState() => _ViruchkaScreenState();
}

var viruchkaState = GetIt.I<ViruchkaState>();
bool isLoading = false;
String orderedByContraller = "";
var userState = GetIt.I<CreatedUsers>();

class _ViruchkaScreenState extends State<ViruchkaScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viruchkaState.makeSummary();
    
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
            router.replace(const MainRoute());
          },
        ),
        title: BigText(
          text: 'viruchkaOtchet',
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
                userState.usersFio.clear();
                await userState.getCreatedUsers();
                await userState.getFio();
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return const ViruchkaFilter();
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
      body: Observer(builder: (context) {
        return Center(
                      child: Column(
                    children: [
                  
                      Expanded(
                          child: dataTableDraw(context),
                        ),
                      
                    ],
                  ));
      }),
      persistentFooterButtons: [
        Padding(
            padding: const EdgeInsets.all(paddingAll),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MiddleText(text: "summaryOfCash"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MiddleText(text: "summaryOfNoCash"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MiddleText(text: "summaryOfSellDebt"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: BigText(text: "summaryOfSellprice"),
                      ),
                    ],
                  ),
                  Observer(builder: (context) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: MiddleText(
                            text: viruchkaState.cash.toString(),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: MiddleText(
                            text: viruchkaState.noCash.toString(),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: MiddleText(
                            text: viruchkaState.debt.toString(),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: BigText(
                            text: viruchkaState.summary.toString(),
                          ),
                        ),
                      ],
                    );
                  })
                ],
              ),
            )),
      ],
    );
  }

  DataTable2 dataTableDraw(BuildContext context) {
    
    return DataTable2(
                            fixedLeftColumns: 1,
                            horizontalMargin: 5,
                            columnSpacing: 10,
                            minWidth: 990,
                            columns: [
                              DataColumn2(
                                  label: Center(
                                    child: IconButton(
                                                                    icon: AppIcons(
                                    icon: Icons.open_in_new,
                                    iconColor: AppColors.appBlack,
                                    size: Dimensions.iconSize24,
                                                                    ),
                                                                    onPressed: () {},
                                                                  ),
                                  )),
                              DataColumn2(
                                  label: InkWell(
                                onTap: () async {
                                  setState(() {
                                    orderedByContraller = "chequenumber";
                                  });
                                  await orderedBy();
                                },
                                child:  Center(
                                    child: BigText(
                                      text: "chequenumber",
                                    ),
                                ),
                              )),
                              DataColumn2(
                                  label: InkWell(
                                onTap: () async {
                                  setState(() {
                                    orderedByContraller = "saleprice";
                                  });
                                  await orderedBy();
                                },
                                child: Center(
                                    child: BigText(
                                      text: "saleprice",
                                    ),
                                  ),
                                
                              )),
                              DataColumn2(
                                  label: InkWell(
                                onTap: () async {
                                  setState(() {
                                    orderedByContraller = "paymentdate";
                                  });
                                  await orderedBy();
                                },
                                child:  Center(
                                    child: BigText(
                                      text: "paymentdate",
                                    ),
                                  ),
                               
                              )),
                              DataColumn2(
                                  label: InkWell(
                                onTap: () async {
                                  setState(() {
                                    orderedByContraller = "paidamount";
                                  });
                                  await orderedBy();
                                },
                                child: Center(
                                    child: BigText(
                                      text: "paidamount",
                                    ),
                                  
                                ),
                              )),
                              DataColumn2(
                                  label: InkWell(
                                onTap: () async {
                                  setState(() {
                                    orderedByContraller = "paidamountcard";
                                  });
                                  await orderedBy();
                                },
                                child: Center(
                                    child: BigText(
                                      text: "paidamountcard",
                                    ),
                                  ),
                               
                              )),
                              DataColumn2(
                                  label: InkWell(
                                onTap: () async {
                                  setState(() {
                                    orderedByContraller = "deptamount";
                                  });
                                  await orderedBy();
                                },
                                child: Center(
                                    child: BigText(
                                      text: "deptamount",
                                    ),
                                  ),
                             
                              )),
                              DataColumn2(
                                  label: InkWell(
                                onTap: () async {
                                  setState(() {
                                    orderedByContraller = "waiter_name";
                                  });
                                  await orderedBy();
                                },
                                child:  Center(
                                    child: BigText(
                                      text: "cashier",
                                    ),
                                  ),
                                
                              )),
                            ],
                            rows: [
                                 for (int i = 0;
                                  i < viruchkaState.listOfViruchka.length;
                                  i++)
                                DataRow2(cells: [
                                  DataCell(Center(
                                    child: PopupMenuButton(
                                        // add icon, by default "3 dot" icon
                                        icon: AppIcons(
                                          icon: Icons.open_in_new,
                                          iconColor: AppColors.appCoral,
                                        ),
                                        itemBuilder: (_) {
                                          return [
                                            PopupMenuItem<int>(
                                                value: 0,
                                                child: Row(
                                                  children: [
                                                    AppIcons(
                                                      icon: Icons.remove_red_eye,
                                                      size: Dimensions.iconSize24,
                                                    ),
                                                    SizedBox(
                                                      width: Dimensions.width15,
                                                    ),
                                                    MiddleText(
                                                      text: "open".tr(),
                                                    )
                                                  ],
                                                )),
                                          ];
                                        },
                                        onSelected: (value) async {
                                          if (value == 0) {
                                            showModalBottomSheet(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return Scaffold(
                                                  appBar: AppBar(
                                                      backgroundColor:
                                                          AppColors.appPurple,
                                                      title: Row(
                                                        children: [
                                                          BigText(
                                                            text: "chequenumber",
                                                            color: AppColors
                                                                .appWhite,
                                                          ),
                                                          SizedBox(
                                                            width: 5,
                                                          ),
                                                          BigText(
                                                            text: viruchkaState
                                                                .listOfViruchka[i]
                                                                .chequenumber
                                                                .toString(),
                                                            color: AppColors
                                                                .appWhite,
                                                          ),
                                                        ],
                                                      )),
                                                  body: SingleChildScrollView(
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    child: Center(
                                                      child: DataTable(
                                                        horizontalMargin: 16,
                                                        columnSpacing: 16,
                                                        columns: [
                                                          DataColumn(
                                                              label: BigText(
                                                                  text: "code")),
                                                          DataColumn(
                                                              label: BigText(
                                                                  text: "name")),
                                                          DataColumn(
                                                              label: BigText(
                                                                  text: "count")),
                                                          DataColumn(
                                                              label: BigText(
                                                                  text: "price")),
                                                        ],
                                                        rows: [
                                                          for (int j = 0;
                                                              j <
                                                                  viruchkaState
                                                                      .listOfViruchka[
                                                                          i]
                                                                      .items!
                                                                      .length;
                                                              j++)
                                                            DataRow(cells: [
                                                              DataCell(
                                                                Container(
                                                                  height: Dimensions
                                                                          .height20 *
                                                                      2,
                                                                  child: Center(
                                                                    child:
                                                                        MiddleText(
                                                                      text: viruchkaState
                                                                          .listOfViruchka[
                                                                              i]
                                                                          .items![
                                                                              j]
                                                                          .productcode!,
                                                                      color: AppColors
                                                                          .appBlack,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              DataCell(
                                                                Container(
                                                                  height: Dimensions
                                                                          .height20 *
                                                                      2,
                                                                  child: Center(
                                                                    child:
                                                                        MiddleText(
                                                                      text: viruchkaState
                                                                          .listOfViruchka[
                                                                              i]
                                                                          .items![
                                                                              j]
                                                                          .productname!,
                                                                      color: AppColors
                                                                          .appBlack,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              DataCell(
                                                                Container(
                                                                  height: Dimensions
                                                                          .height20 *
                                                                      2,
                                                                  child: Center(
                                                                    child:
                                                                        MiddleText(
                                                                      text: viruchkaState
                                                                          .listOfViruchka[
                                                                              i]
                                                                          .items![
                                                                              j]
                                                                          .quantity!
                                                                          .toString(),
                                                                      color: AppColors
                                                                          .appBlack,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              DataCell(
                                                                Container(
                                                                  height: Dimensions
                                                                          .height20 *
                                                                      2,
                                                                  child: Center(
                                                                    child:
                                                                        MiddleText(
                                                                      text: viruchkaState
                                                                          .listOfViruchka[
                                                                              i]
                                                                          .items![
                                                                              j]
                                                                          .saleprice!
                                                                          .toString(),
                                                                      color: AppColors
                                                                          .appBlack,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ])
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          }
                                        }),
                                  )),
                                  DataCell(
                                    Container(
                                      height: Dimensions.height20 * 2,
                                      child: Center(
                                        child: MiddleText(
                                          text: viruchkaState.listOfViruchka[i]
                                                      .chequenumber ==
                                                  null
                                              ? 0.toString()
                                              : viruchkaState.listOfViruchka[i]
                                                  .chequenumber!,
                                          color: AppColors.appBlack,
                                        ),
                                      ),
                                    ),
                                  ),
                                  DataCell(Container(
                                    height: Dimensions.height20 * 2,
                                    child: Center(
                                      child: MiddleText(
                                        text: viruchkaState.listOfViruchka[i]
                                                    .saleprice ==
                                                null
                                            ? ""
                                            : viruchkaState
                                                .listOfViruchka[i].saleprice
                                                .toString(),
                                        color: AppColors.appBlack,
                                      ),
                                    ),
                                  )),
                                  DataCell(Container(
                                    height: Dimensions.height20 * 2,
                                    child: Center(
                                      child: MiddleText(
                                        text: viruchkaState.listOfViruchka[i]
                                                    .paymentdate ==
                                                null
                                            ? "noDate"
                                            : DateFormat('dd.MM.yyyy').format(
                                                DateTime.parse(viruchkaState
                                                    .listOfViruchka[i]
                                                    .paymentdate!)),
                                        color: AppColors.appBlack,
                                      ),
                                    ),
                                  )),
                                  DataCell(Container(
                                    height: Dimensions.height20 * 2,
                                    child: Center(
                                      child: MiddleText(
                                        text: viruchkaState.listOfViruchka[i]
                                                    .paidamount ==
                                                null
                                            ? ""
                                            : viruchkaState
                                                .listOfViruchka[i].paidamount
                                                .toString(),
                                        color: AppColors.appBlack,
                                      ),
                                    ),
                                  )),
                                  DataCell(Container(
                                    height: Dimensions.height20 * 2,
                                    child: Center(
                                      child: MiddleText(
                                        text: viruchkaState.listOfViruchka[i]
                                                    .paidamountcard ==
                                                null
                                            ? ""
                                            : viruchkaState.listOfViruchka[i]
                                                .paidamountcard
                                                .toString(),
                                        color: AppColors.appBlack,
                                      ),
                                    ),
                                  )),
                                  DataCell(Container(
                                    height: Dimensions.height20 * 2,
                                    child: Center(
                                      child: MiddleText(
                                        text: viruchkaState.listOfViruchka[i]
                                                    .deptamount ==
                                                null
                                            ? ""
                                            : viruchkaState
                                                .listOfViruchka[i].deptamount
                                                .toString(),
                                        color: AppColors.appBlack,
                                      ),
                                    ),
                                  )),
                                  DataCell(Container(
                                    height: Dimensions.height20 * 2,
                                    child: Center(
                                      child: MiddleText(
                                        text: viruchkaState.listOfViruchka[i]
                                                    .deptamount ==
                                                null
                                            ? ""
                                            : viruchkaState
                                                .listOfViruchka[i].waiter_name
                                                .toString(),
                                        color: AppColors.appBlack,
                                      ),
                                    ),
                                  )),
                                ]),
                            ]);
  }

  orderedBy() async {
    setState(() {
      viruchkaState.summary = 0;
      viruchkaState.debt = 0;
      viruchkaState.noCash = 0;
      viruchkaState.cash = 0;
    });
    await viruchkaState.getViruchka(
        chequenumber: ViruchkaFilter.checkNumber.text,
        data_e: ViruchkaFilter.secondDateContraller.text,
        data_s: ViruchkaFilter.firstDatacontraller.text,
        n_smena: ViruchkaFilter.n_smena.text,
        waiter_name: ViruchkaFilter.cashier_name == "notSelected"
            ? ""
            : ViruchkaFilter.cashier_name,
        order_by: orderedByContraller);
    viruchkaState.makeSummary();
  }

  @override
  void dispose() {
    super.dispose();
    ViruchkaFilter.checkNumber.text = "";
    ViruchkaFilter.secondDateContraller.text = "08.02.2023";
    ViruchkaFilter.firstDatacontraller.text = "08.02.2023";
    ViruchkaFilter.n_smena.text = "";
    ViruchkaFilter.cashier_name == "notSelected";
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
