import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pcassa_retail/constants/app_themes/app_icons/app_icons.dart';
import 'package:pcassa_retail/enums/main_screen_navigation_enum/main_screen_navigations.dart';
import 'package:pcassa_retail/store/discount_state/discount_state.dart';
import 'package:pcassa_retail/widgets/big_text.dart';
import 'package:pcassa_retail/widgets/middle_text.dart';

import '../../constants/app_themes/app_colors/app_colors.dart';
import '../../constants/dimensions/dimensions.dart';
import '../../error_handler/error_handler.dart';
import '../../router/router.gr.dart';
import '../../router/services.dart';
import '../../widgets/app_icons.dart';
import '../main_screen/widgets/navigation_bar_widget/navigation_bar.dart';
import 'discount_screen_widgets/discount_create_widget/discount_create_widget.dart';
import 'discount_screen_widgets/discount_edit_widget/discoutn_edit_widget.dart';

class DiscountsScreen extends StatefulWidget {
  const DiscountsScreen(
      {Key? key, required this.quickMenuPagesType, required this.idd})
      : super(key: key);
  final idd;
  final QuickMenuPagesType quickMenuPagesType;
  @override
  State<DiscountsScreen> createState() => _DiscountsScreenState();
}

class _DiscountsScreenState extends State<DiscountsScreen> {
  final getDiscount = GetIt.I<CreatedDiscounts>();

//Loading Check
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        //trigger leaving and use own data
        if (getDiscount.discountInfo.length == 1) {
          router.replace(
            const MainRoute(),
          );
        } else {
          router.replace(
            DiscountNavigationPage(
                quickMenuPagesType: widget.quickMenuPagesType),
          );
        }

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
              router.pop();
            },
          ),
          title: MiddleText(
            text: "${widget.quickMenuPagesType}".tr(),
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
                icon: (CustomIcons.home))
          ],
        ),
        body: Observer(
            builder: (_) => GridView.count(
                    crossAxisCount: 1,
                    childAspectRatio: 3,
                    children: [
                      for (var j = 0; j < getDiscount.discountInfo.length; j++)
                        if (getDiscount.discountInfo[j].id == widget.idd)
                          for (var i = 0;
                              i < getDiscount.discountInfo[j].items.length;
                              i++)
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
                                      return DiscountEditWidget(
                                        id_d: getDiscount.discountInfo.first.id,
                                        status: getDiscount
                                            .discountInfo[j].items[i].status,
                                        id: getDiscount
                                            .discountInfo[j].items[i].id,
                                        name: getDiscount
                                            .discountInfo[j].items[i].name,
                                        type: getDiscount
                                            .discountInfo[j].items[i].tip,
                                        value: getDiscount
                                            .discountInfo[j].items[i].val,
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
                                        flex: 2,
                                        child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                10, 0, 0, 0),
                                            child: AppIcons(
                                              icon: Icons.percent,
                                              size: Dimensions.iconSize24,
                                            )),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              BigText(
                                                text: getDiscount
                                                    .discountInfo[j]
                                                    .items[i]
                                                    .name,
                                              ),
                                              SizedBox(
                                                height: Dimensions.height10,
                                              ),
                                              Row(
                                                children: [
                                                  if (getDiscount
                                                          .discountInfo[j]
                                                          .items[i]
                                                          .tip ==
                                                      '%')
                                                    Row(
                                                      children: [
                                                        MiddleText(
                                                          text:
                                                              "${getDiscount.discountInfo[j].items[i].val}",
                                                        ),
                                                        const SizedBox(
                                                          width: 2,
                                                        ),
                                                        MiddleText(
                                                          text: getDiscount
                                                              .discountInfo[j]
                                                              .items[i]
                                                              .tip,
                                                        ),
                                                      ],
                                                    )
                                                  else
                                                    Row(
                                                      children: [
                                                        AppIcons(
                                                          icon: Icons.remove,
                                                          size: Dimensions
                                                              .iconSize16,
                                                          iconColor: AppColors
                                                              .appCoral,
                                                        ),
                                                        const SizedBox(
                                                          width: 2,
                                                        ),
                                                        MiddleText(
                                                          text:
                                                              "${getDiscount.discountInfo[j].items[i].val}",
                                                        ),
                                                      ],
                                                    )
                                                ],
                                              )
                                            ]),
                                      ),
                                      SizedBox(
                                        width: Dimensions.width15 * 2,
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            if (getDiscount.discountInfo[j]
                                                    .items[i].status ==
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
                                        flex: 2,
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
                                                                        "${'deleteDiscount'.tr()} ?",
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
                                                                                await getDiscount.deleteDiscount(id: getDiscount.discountInfo[j].items[i].id);
                                                                                await getDiscount.getCreatedDiscounts();
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
          return DiscountCreateWidget(
            id_d: widget.idd,
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
    });
  }
}
