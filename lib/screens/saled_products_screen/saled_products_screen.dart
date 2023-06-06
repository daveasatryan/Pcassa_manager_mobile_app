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
import 'package:pcassa_retail/screens/documents_screen/rko_pko/filter_rko_pko_document.dart';
import 'package:pcassa_retail/screens/saled_products_screen/saled_products_filter_screen.dart';

import 'package:pcassa_retail/store/get_saled_products_state/get_saled_products_state.dart';

import 'package:pcassa_retail/widgets/app_icons.dart';
import 'package:pcassa_retail/widgets/big_text.dart';
import 'package:pcassa_retail/widgets/middle_text.dart';

class SaledProductScreen extends StatefulWidget {
  const SaledProductScreen({Key? key}) : super(key: key);

  @override
  State<SaledProductScreen> createState() => _SaledProductScreenState();
}

bool isLoading = false;
String orderedByContraller = "";
var saledProductState = GetIt.I<SaledProductsState>();

class _SaledProductScreenState extends State<SaledProductScreen> {
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
          text: 'saledOtchet',
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
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return FilterSaled();
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
        return  Center(
            child:  Expanded(
                            child: DataTable2(
                                horizontalMargin: 5,
                                columnSpacing: 10,
                                minWidth: 900,
                                columns: [
                                  DataColumn(
                                      label: InkWell(
                                    onTap: () async {
                                      setState(() {
                                        orderedByContraller = "name";
                                      });
                                      await orderedBy();
                                    },
                                    child: Center(
                                        child: BigText(
                                          text: "name",
                                        ),
                                      ),
                                    
                                  )),
                                  DataColumn(
                                      label: InkWell(
                                    onTap: () async {
                                      setState(() {
                                        orderedByContraller = "edizm";
                                      });
                                      await orderedBy();
                                    },
                                    child:  Center(
                                        child: BigText(
                                          text: "ed_izm",
                                        ),
                                      ),
                                    
                                  )),
                                  DataColumn(
                                      label: InkWell(
                                    onTap: () async {
                                      setState(() {
                                        orderedByContraller = "quantity";
                                      });
                                      await orderedBy();
                                    },
                                    child:  Center(
                                        child: BigText(
                                          text: "Quantity",
                                        ),
                                      ),
                                  
                                  )),
                                  DataColumn(
                                      label: InkWell(
                                    onTap: () async {
                                      setState(() {
                                        orderedByContraller = "saleprice";
                                      });
                                      await orderedBy();
                                    },
                                    child:  Center(
                                        child: BigText(
                                          text: "SalePrice",
                                        ),
                                      ),
                                    
                                  )),
                                  DataColumn(
                                      label: InkWell(
                                    onTap: () async {
                                      setState(() {
                                        orderedByContraller = "amount";
                                      });
                                      await orderedBy();
                                    },
                                    child:  Center(
                                        child: BigText(
                                          text: "Amount",
                                        ),
                                      ),
                                    
                                  )),
                                  DataColumn(
                                      label: InkWell(
                                    onTap: () async {
                                      setState(() {
                                        orderedByContraller = "kod_tov";
                                      });
                                      await orderedBy();
                                    },
                                    child: Center(
                                        child: BigText(
                                          text: "kod_tov",
                                        ),
                                      ),
                                    
                                  )),
                                  DataColumn(
                                      label: InkWell(
                                    onTap: () async {
                                      setState(() {
                                        orderedByContraller = "barcode";
                                      });
                                      await orderedBy();
                                    },
                                  
                                      child: Center(
                                        child: BigText(
                                          text: "barcode",
                                        ),
                                      ),
                                    
                                  )),
                                ],
                                rows: [
                                  for (int i = 0;
                                      i < saledProductState.saledItemsList.length;
                                      i++)
                                    DataRow(cells: [
                                      DataCell(Container(
                                        height: Dimensions.height20 * 2,
                                        child: Center(
                                          child: Container(
                                            width: 160,
                                            child: SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: MiddleText(
                                                text: saledProductState
                                                            .saledItemsList[i]
                                                            .name ==
                                                        null
                                                    ? ""
                                                    : saledProductState
                                                        .saledItemsList[i].name
                                                        .toString(),
                                                color: AppColors.appBlack,
                                              ),
                                            ),
                                          ),
                                        ),
                                      )),
                                      DataCell(Container(
                                        height: Dimensions.height20 * 2,
                                        child: Center(
                                          child: MiddleText(
                                            text: saledProductState
                                                        .saledItemsList[i].edizm ==
                                                    null
                                                ? ""
                                                : saledProductState
                                                    .saledItemsList[i].edizm
                                                    .toString(),
                                            color: AppColors.appBlack,
                                          ),
                                        ),
                                      )),
                                      DataCell(Container(
                                        height: Dimensions.height20 * 2,
                                        child: Center(
                                          child: MiddleText(
                                            text: saledProductState
                                                        .saledItemsList[i]
                                                        .quantity ==
                                                    null
                                                ? ""
                                                : saledProductState
                                                    .saledItemsList[i].quantity
                                                    .toString(),
                                            color: AppColors.appBlack,
                                          ),
                                        ),
                                      )),
                                      DataCell(Container(
                                        height: Dimensions.height20 * 2,
                                        child: Center(
                                          child: MiddleText(
                                            text: saledProductState
                                                        .saledItemsList[i]
                                                        .saleprice ==
                                                    null
                                                ? ""
                                                : saledProductState
                                                    .saledItemsList[i].saleprice
                                                    .toString(),
                                            color: AppColors.appBlack,
                                          ),
                                        ),
                                      )),
                                      DataCell(Container(
                                        height: Dimensions.height20 * 2,
                                        child: Center(
                                          child: MiddleText(
                                            text: saledProductState
                                                        .saledItemsList[i].amount ==
                                                    null
                                                ? ""
                                                : saledProductState
                                                    .saledItemsList[i].amount
                                                    .toString(),
                                            color: AppColors.appBlack,
                                          ),
                                        ),
                                      )),
                                      DataCell(Container(
                                        height: Dimensions.height20 * 2,
                                        child: Center(
                                          child: MiddleText(
                                            text: saledProductState
                                                        .saledItemsList[i]
                                                        .kod_tov ==
                                                    null
                                                ? ""
                                                : saledProductState
                                                    .saledItemsList[i].kod_tov
                                                    .toString(),
                                            color: AppColors.appBlack,
                                          ),
                                        ),
                                      )),
                                      DataCell(Center(
                                        child: Container(
                                          height: Dimensions.height20 * 2,
                                          
                                            child: Center(
                                              child: MiddleText(
                                                text: saledProductState
                                                            .saledItemsList[i]
                                                            .barcode ==
                                                        null
                                                    ? ""
                                                    : saledProductState
                                                        .saledItemsList[i].barcode
                                                        .toString(),
                                                color: AppColors.appBlack,
                                              ),
                                            ),
                                          
                                        ),
                                      )),
                                    ]),
                                ]),
                          
                        )
            
          );
      }),
      persistentFooterButtons: [
        Observer(builder: (context) {
          return Padding(
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
                          child: BigText(text: "summa"),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:
                              BigText(text: saledProductState.summa.toString()),
                        ),
                      ],
                    )
                  ],
                ),
              ));
        }),
      ],
    );
  }

  orderedBy() async {
    await saledProductsState.getSaledProducts(
        data_s: FilterSaled.firstDatecontraller.text == null
            ? ""
            : FilterSaled.firstDatecontraller.text,
        data_e: FilterSaled.secondDatecontraller.text == null
            ? ""
            : FilterSaled.secondDatecontraller.text,
        category_name: FilterSaled.productGroupContraller == null
            ? ""
            : FilterSaled.productGroupContraller == "all".tr()
                ? ""
                : FilterSaled.productGroupContraller!,
        name: FilterSaled.productItemContraller == null
            ? ""
            : FilterSaled.productItemContraller.toString(),
        order_by: orderedByContraller);
  }

  @override
  void dispose() {
    super.dispose();
    FilterSaled.firstDatecontraller.text = DateFormat("dd.MM.yyyy")
        .format(DateTime.now().subtract(Duration(days: 1)))
        .toString();
    FilterSaled.secondDatecontraller.text = DateFormat("dd.MM.yyyy")
        .format(DateTime.now().subtract(Duration(days: 1)))
        .toString();
    FilterSaled.productGroupContraller = "all".tr();
    FilterSaled.productItemContraller = "";
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
