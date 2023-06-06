import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pcassa_retail/constants/app_themes/app_colors/app_colors.dart';
import 'package:pcassa_retail/constants/app_themes/app_icons/app_icons.dart';
import 'package:pcassa_retail/constants/dimensions/dimensions.dart';
import 'package:pcassa_retail/constants/paddings_constants/padding_constants.dart';
import 'package:pcassa_retail/router/services.dart';
import 'package:pcassa_retail/screens/kontragent_balance_screen/kontragent_balance_filter.dart';
import 'package:pcassa_retail/screens/viruchka_screen/viruchka_filter_screen.dart';
import 'package:pcassa_retail/store/kont_balance_state/kont_balance_state.dart';
import 'package:pcassa_retail/widgets/app_icons.dart';
import 'package:pcassa_retail/widgets/big_text.dart';
import 'package:pcassa_retail/widgets/middle_text.dart';

import '../../router/router.gr.dart';

class KontragentBalanceReport extends StatefulWidget {
  KontragentBalanceReport({Key? key}) : super(key: key);

  @override
  State<KontragentBalanceReport> createState() =>
      _KontragentBalanceReportState();
}

class _KontragentBalanceReportState extends State<KontragentBalanceReport> {
  var searchController = TextEditingController();
  var kontragentBalanceState = GetIt.I<KontBalanceState>();
  @override
  void initState() {
    super.initState();
    searchController.addListener(() async {
      if (searchController.text.length > 2) {
        kontragentBalanceState.kontDocsList.clear();
        await Future.delayed(Duration(milliseconds: 500));
        await kontragentBalanceState.getContragentReports(
            name: searchController.text, data_e: '', data_s: '');
      }
    });
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
          text: 'kontragentBalance',
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
                    return KontragentBalanceFilter();
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
        return Column(
          children: [
            Column(
              children: [
                BottomAppBar(
                    child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BigText(text: "nachostatko"),
                      BigText(
                          text: kontragentBalanceState.nachostatok.toString())
                    ],
                  ),
                )),
                DataTable(
                  columnSpacing: 80,
                  columns: [
                    DataColumn(
                        label: BigText(
                      text: "tip_name",
                    )),
                    DataColumn(
                        label: BigText(
                      text: "Amount",
                    )),
                  ],
                  rows: [
                    DataRow(cells: [
                      DataCell(Text("")),
                      DataCell(Text("")),
                    ])
                  ],
                )
              ],
            ),
            Expanded(
              child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        for (int i = 0;
                            i < kontragentBalanceState.kontDocsList.length;
                            i++)
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16, 5, 16, 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  child: BigText(
                                      text: kontragentBalanceState
                                          .kontDocsList[i].tip!),
                                ),
                                Container(
                                  child: BigText(
                                      text: kontragentBalanceState
                                          .kontDocsList[i].amount!
                                          .toString()),
                                )
                              ],
                            ),
                          ),
                      ],
                    ),
                  )),
            )
          ],
        );
      }),
      persistentFooterButtons: [
        Padding(
          padding: const EdgeInsets.all(paddingAll),
          child: Observer(builder: (context) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BigText(text: "SummaItems"),
                    BigText(text: kontragentBalanceState.summaitems.toString())
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BigText(text: "endostatok"),
                    BigText(text: kontragentBalanceState.endostatok.toString())
                  ],
                ),
              ],
            );
          }),
        ),
      ],
    );
  }
}
