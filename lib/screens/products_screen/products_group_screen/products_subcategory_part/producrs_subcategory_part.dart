// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pcassa_retail/constants/app_themes/app_icons/app_icons.dart';
import 'package:pcassa_retail/constants/dimensions/dimensions.dart';
import 'package:pcassa_retail/constants/paddings_constants/padding_constants.dart';
import 'package:pcassa_retail/widgets/app_icons.dart';
import 'package:pcassa_retail/widgets/big_text.dart';
import 'package:pcassa_retail/widgets/main_screen_loading_widget.dart';
import 'package:pcassa_retail/widgets/middle_text.dart';
import 'package:pcassa_retail/widgets/small_text_widget.dart';
import '../../../../constants/app_themes/app_colors/app_colors.dart';
import '../../../../error_handler/error_handler.dart';
import '../../../../router/router.gr.dart';
import '../../../../router/services.dart';
import '../../../../store/authorization_state/authorization_state.dart';
import '../../../../store/category_state/category_state.dart';
import '../../../../store/product_state/product_state.dart';
import '../../../../store/unit_state/unit_state.dart';
import '../products_categories_add_and_edit_wigdets/products_categories_create_widget.dart';
import '../products_categories_add_and_edit_wigdets/products_categories_edit_widget.dart';

class ProductSubcategoryPart extends StatefulWidget {
  const ProductSubcategoryPart({Key? key, required this.parentGuid})
      : super(key: key);
  final parentGuid;
  @override
  State<ProductSubcategoryPart> createState() => _ProductSubcategoryPartState();
}

final getProducts = GetIt.I<CreatedProducts>();

final authState = GetIt.I<AuthorizationState>();
//ProductType State Get
final getCategoryType = GetIt.I<CategoryState>();

//Unit State Get
final getUnitType = GetIt.I<UnitState>();
//Expanded Check
bool isExpanded = true;

// Loading Check
bool isLoading = false;

var elementsGguids = [];

class _ProductSubcategoryPartState extends State<ProductSubcategoryPart> {
  @override
  void initState() {
    super.initState();
    for (int i = 0; i < getProducts.productsElements.length; i++) {
      elementsGguids.add(getProducts.productsElements[i].gguid);
    }
  }

  @override
  Widget build(BuildContext context) {
    //Draw Subcategorys
    return Observer(
      builder: (_) => Column(
        children: [
          for (int i = 0; i < getProducts.productsCategoryList.length; i++)
            if (getProducts.productsCategoryList[i].parentguid ==
                widget.parentGuid)
              LayoutBuilder(
                builder: (context, constraints) => ExpansionTile(
                  initiallyExpanded: false,
                  leading: getProducts.productsCategoryList[i].haschildren == 1
                      ? CustomIcons.arrowDropDown
                      : null,
                  trailing: SizedBox(
                    height: MediaQuery.of(context).size.height / 8.44,
                    width: MediaQuery.of(context).size.height / 8.44,
                    child: Row(
                      children: [
                        //Go tu Products
                        TextButton(
                            onPressed: () {
                              openMenuElement(
                                  mainCategoryGuid:
                                      getProducts.productsCategoryList[i].guid,
                                  mainCategoryName: getProducts
                                      .productsCategoryList[i].caption,
                                  isRoot: getProducts
                                      .productsCategoryList[i].isroot);
                            },
                            child: SmallText(
                              text: "products",
                              color: AppColors.appCoral,
                            )),
                        if (!authState.currentUser!.dostup.productgroupaccess
                                .contains('editgroup') &&
                            !authState.currentUser!.dostup.productgroupaccess
                                .contains('deletegroup') &&
                            (!authState.currentUser!.dostup.productgroupaccess
                                .contains('addgroup')))
                          Expanded(
                            child: PopupMenuButton(
                                // add icon, by default "3 dot" icon
                                icon: AppIcons(
                                  icon: Icons.more_vert,
                                  size: Dimensions.iconSize24,
                                ),
                                itemBuilder: (context) {
                                  return [
                                    if (!authState
                                        .currentUser!.dostup.productgroupaccess
                                        .contains('editgroup'))
                                      PopupMenuItem<int>(
                                          value: 0,
                                          child: Row(
                                            children: [
                                              AppIcons(
                                                icon: Icons.edit,
                                                size: Dimensions.iconSize24,
                                              ),
                                              SizedBox(
                                                  width: Dimensions.width15),
                                              MiddleText(
                                                text: "edit".tr(),
                                                color: AppColors.appBlack,
                                              )
                                            ],
                                          )),
                                    if (!authState
                                        .currentUser!.dostup.productgroupaccess
                                        .contains('deletegroup'))
                                      PopupMenuItem<int>(
                                          value: 1,
                                          child: Row(
                                            children: [
                                              AppIcons(
                                                icon: Icons.delete,
                                                size: Dimensions.iconSize24,
                                              ),
                                              SizedBox(
                                                width: Dimensions.width15,
                                              ),
                                              MiddleText(
                                                text: "delete".tr(),
                                                color: AppColors.appBlack,
                                              )
                                            ],
                                          )),
                                    if (!authState
                                        .currentUser!.dostup.productgroupaccess
                                        .contains('addgroup'))
                                      PopupMenuItem<int>(
                                          value: 2,
                                          child: Row(
                                            children: [
                                              AppIcons(
                                                icon: Icons.add,
                                                size: Dimensions.iconSize24,
                                              ),
                                              SizedBox(
                                                width: Dimensions.width15,
                                              ),
                                              MiddleText(
                                                text: "addSubcategory".tr(),
                                                color: AppColors.appBlack,
                                              )
                                            ],
                                          )),
                                  ];
                                },
                                onSelected: (value) {
                                  if (value == 0) {
                                    //Edit Screen Route
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
                                        return Scaffold(
                                            appBar: AppBar(
                                              backgroundColor:
                                                  AppColors.appPurple,
                                              title: MiddleText(
                                                text: getProducts
                                                    .productsCategoryList[i]
                                                    .caption,
                                                color: AppColors.appWhite,
                                              ),
                                            ),
                                            body: EditCategories(
                                              guidOfCategories: getProducts
                                                  .productsCategoryList[i].guid,
                                              isRoot: getProducts
                                                  .productsCategoryList[i]
                                                  .isroot,
                                              nameOfCategories: getProducts
                                                  .productsCategoryList[i]
                                                  .caption,
                                              parentGuidOfCategories:
                                                  getProducts
                                                      .productsCategoryList[i]
                                                      .parentguid,
                                            ));
                                      },
                                    );
                                  } else if (value == 1) {
                                    //Delete Functionality
                                    showDialog<void>(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return StatefulBuilder(
                                          builder: (BuildContext context,
                                              StateSetter setState) {
                                            return Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  height: Dimensions
                                                      .deletePopUpHeight,
                                                  width:
                                                      Dimensions.deletePopwidth,
                                                  child: SimpleDialog(
                                                    title: MiddleText(
                                                      text:
                                                          "${'deleteGroup'.tr()} ?",
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
                                                                startLoad(
                                                                    setState);

                                                                try {
                                                                  await getProducts.delGroup(
                                                                      context:
                                                                          context,
                                                                      guid: getProducts
                                                                          .productsCategoryList[
                                                                              i]
                                                                          .guid);
                                                                } catch (e) {
                                                                  if (e
                                                                      is DioError) {
                                                                    await ErrorHandler.errorModal(
                                                                        context:
                                                                            context,
                                                                        errorCode:
                                                                            e.response);
                                                                  }
                                                                }

                                                                endLoad(
                                                                    setState);
                                                              },
                                                              child: isLoading
                                                                  ? const CircularProgressIndicator(
                                                                      color: AppColors
                                                                          .appCoral,
                                                                    )
                                                                  : MiddleText(
                                                                      text: 'delete'
                                                                          .tr(),
                                                                      color: AppColors
                                                                          .appCoral,
                                                                    )),
                                                          TextButton(
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: MiddleText(
                                                              text:
                                                                  'cancle'.tr(),
                                                              color: AppColors
                                                                  .appCoral,
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
                                  } else if (value == 2) {
                                    //Subcategory create Sheet
                                    showModalBottomSheet(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              Dimensions.borderRadius10),
                                        ),
                                        context: context,
                                        isScrollControlled: true,
                                        builder: (BuildContext context) {
                                          return SingleChildScrollView(
                                            child: Container(
                                              padding: EdgeInsets.only(
                                                  bottom: MediaQuery.of(context)
                                                      .viewInsets
                                                      .bottom),
                                              child: Padding(
                                                padding: const EdgeInsets.all(
                                                    paddingAll),
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.all(5),
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius: BorderRadius
                                                          .circular(Dimensions
                                                              .borderRadius10),
                                                      boxShadow: const [
                                                        BoxShadow(
                                                            color:
                                                                Color.fromRGBO(
                                                                    143,
                                                                    148,
                                                                    251,
                                                                    .2),
                                                            blurRadius: 20.0,
                                                            offset:
                                                                Offset(0, 10))
                                                      ]),
                                                  child: Column(
                                                    children: [
                                                      CreateGroup(
                                                        isRoot: getProducts
                                                            .productsCategoryList[
                                                                i]
                                                            .isroot,
                                                        parentGuid: getProducts
                                                            .productsCategoryList[
                                                                i]
                                                            .guid,
                                                        title:
                                                            'nameOfSubcategory',
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        });
                                  }
                                }),
                          ),
                      ],
                    ),
                  ),

                  title: Row(
                    children: [
                      // for (int j = 0;
                      //     j < getProducts.productsCategoryList.length;
                      //     j++)
                      !elementsGguids.contains(
                              getProducts.productsCategoryList[i].guid)
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MiddleText(
                                  text: getProducts
                                      .productsCategoryList[i].caption,
                                  // ignore: prefer_const_constructors
                                ),
                                SizedBox(height: 5),
                                SmallText(
                                  text: "empttyGroup".tr(),
                                  color: AppColors.appCoral,
                                )
                              ],
                            )
                          : MiddleText(
                              text: getProducts.productsCategoryList[i].caption,
                              // ignore: prefer_const_constructors
                            ),
                    ],
                  ),
                  onExpansionChanged: (value) {
                    isExpanded = value;
                    setState(() {});
                  },

                  children: [
                    ProductSubcategoryPart(
                        parentGuid: getProducts.productsCategoryList[i].guid)
                  ],
                  // ignore: prefer_const_literals_to_create_immutables
                ),
              ),
        ],
      ),
    );
  }

//Route to Menu Elements
  Future<void> openMenuElement(
      {required mainCategoryGuid,
      required mainCategoryName,
      required isRoot}) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const MainScreenLoadingWidget();
      },
    );
    try {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return const MainScreenLoadingWidget();
        },
      );
      await getProducts.groupingProduct(
          mainCategoryGuid: mainCategoryGuid,
          mainCategoryName: mainCategoryName);
      await getCategoryType.getCategory();
      await getUnitType.getUnit();
      router.replace(Products(
          mainCategoryGuid: mainCategoryGuid,
          isRoot: isRoot,
          mainCategoryName: mainCategoryName));
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

    ;
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
      Navigator.pop(context);
    });
  }
}
