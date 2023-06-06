// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pcassa_retail/constants/dimensions/dimensions.dart';
import 'package:pcassa_retail/enums/main_screen_navigation_enum/main_screen_navigations.dart';
import 'package:pcassa_retail/widgets/app_icons.dart';
import 'package:pcassa_retail/widgets/big_text.dart';
import 'package:pcassa_retail/widgets/middle_text.dart';
import '../../../constants/app_themes/app_colors/app_colors.dart';
import '../../../constants/app_themes/app_icons/app_icons.dart';
import '../../../error_handler/error_handler.dart';
import '../../../router/router.gr.dart';
import '../../../router/services.dart';
import '../../../store/currency_state/currency_state.dart';
import '../../main_screen/widgets/navigation_bar_widget/navigation_bar.dart';
import 'currency_create_widget/currency_create_widget.dart';
import 'currency_edit_widget/currency_edit_widget.dart';

class CurrencysScreen extends StatefulWidget {
  const CurrencysScreen(
      {Key? key,
      required this.currencyPageTypeCaption,
      required this.currencyPageTypeGuid})
      : super(key: key);
  final currencyPageTypeGuid;
  final currencyPageTypeCaption;

  @override
  State<CurrencysScreen> createState() => _CurrencysScreenState();
}

class _CurrencysScreenState extends State<CurrencysScreen> {
  final currencyState = GetIt.I<CreatedCurrencys>();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        //trigger leaving and use own data

        router.replace(
          CurrencyNavigationPage(
              quickMenuPagesType: QuickMenuPagesType.currencys),
        );

        //we need to return a future
        return Future.value(false);
      },
      child: Scaffold(
        drawer: const NavDrawer(),
        appBar: AppBar(
          title: MiddleText(
            text: "${widget.currencyPageTypeCaption}".tr(),
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
                icon: CustomIcons.home)
          ],
          leading: IconButton(
              onPressed: () {
                router.pop();
              },
              icon: const Icon(Icons.arrow_back_sharp)),
        ),
        body: Observer(
            builder: (_) => GridView.count(
                    crossAxisCount: 1,
                    childAspectRatio: 3,
                    children: [
                      for (int i = 0;
                          i < currencyState.currencyInfo.length;
                          i++)
                        if (currencyState.currencyInfo[i].guid ==
                            widget.currencyPageTypeGuid)
                          for (int j = 0;
                              j < currencyState.currencyInfo[i].items.length;
                              j++)
                            Padding(
                              padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
                              child: InkWell(
                                onTap: () {
                                  showGeneralDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    transitionBuilder: (context, animation,
                                        secondaryAnimation, child) {
                                      return FadeTransition(
                                        opacity: animation,
                                        child: ScaleTransition(
                                          scale: animation,
                                          child: child,
                                        ),
                                      );
                                    },
                                    pageBuilder: (context, animation,
                                        secondaryAnimation) {
                                      return CurrencyEdit(
                                        b_valyuta: currencyState
                                            .currencyInfo[i].items[j].b_valyuta,
                                        cod: currencyState
                                            .currencyInfo[i].items[j].cod,
                                        gguid: currencyState
                                            .currencyInfo[i].items[j].gguid,
                                        method_round: currencyState
                                            .currencyInfo[i]
                                            .items[j]
                                            .metod_round
                                            .toString(),
                                        name: currencyState
                                            .currencyInfo[i].items[j].name,
                                        short_name: currencyState
                                            .currencyInfo[i]
                                            .items[j]
                                            .short_name,
                                        spisanie: currencyState
                                            .currencyInfo[i].items[j].spisanie,
                                        status: currencyState
                                            .currencyInfo[i].items[j].status,
                                        tip: currencyState
                                            .currencyInfo[i].items[j].tip,
                                        tip_oplati: currencyState
                                            .currencyInfo[i]
                                            .items[j]
                                            .tip_oplati,
                                        guid: widget.currencyPageTypeGuid,
                                      );
                                    },
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.borderRadius10),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Color.fromARGB(
                                                51, 130, 132, 168),
                                            blurRadius:
                                                Dimensions.borderRadius10 * 2,
                                            offset: Offset(0, 10))
                                      ]),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                          flex: 1,
                                          child: AppIcons(
                                            icon: Icons.currency_exchange,
                                            size: Dimensions.iconSize24,
                                          )),
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              BigText(
                                                text: currencyState
                                                    .currencyInfo[i]
                                                    .items[j]
                                                    .name,
                                              ),
                                              SizedBox(
                                                height: Dimensions.height10,
                                              ),
                                              MiddleText(
                                                text: currencyState
                                                    .currencyInfo[i]
                                                    .items[j]
                                                    .short_name,
                                              ),
                                            ]),
                                      ),
                                      SizedBox(
                                        width: Dimensions.width15 * 2,
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            if (currencyState.currencyInfo[i]
                                                    .items[j].status ==
                                                0)
                                              MiddleText(
                                                text: "notActived".tr(),
                                              )
                                            else
                                              MiddleText(
                                                text: "actived".tr(),
                                              ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Center(
                                            child: IconButton(
                                                onPressed: () {
                                                  showDialog<void>(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
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
                                                                        "${'deleteCurrency'.tr()} ?",
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
                                                                              try {
                                                                                await currencyState.deleteCurrency(cod: currencyState.currencyInfo[i].items[j].cod);
                                                                                await currencyState.getCreatedCurencys();
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
                                                                              endLoad(setState);
                                                                              router.pop();
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
                                                                          ),
                                                                        ),
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
                                                },
                                                icon: AppIcons(
                                                  icon: Icons.delete,
                                                  size: Dimensions.iconSize24,
                                                ))),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                    ])),
        persistentFooterButtons: [
          Padding(
            padding: EdgeInsets.all(Dimensions.borderRadius10),
            child: Stack(
              children: [
                FloatingActionButton(
                  backgroundColor: AppColors.appCoral,
                  onPressed: () {
                    _displayDialog(context);
                  },
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _displayDialog(BuildContext context) {
    showGeneralDialog(
        context: context,
        barrierDismissible: false,
        transitionBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: ScaleTransition(
              scale: animation,
              child: child,
            ),
          );
        },
        pageBuilder: (context, animation, secondaryAnimation) {
          return CreateCurrency(
            guid: widget.currencyPageTypeGuid,
          );
        });
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
