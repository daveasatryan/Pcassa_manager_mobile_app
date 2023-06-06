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
import 'package:pcassa_retail/widgets/middle_text.dart';
import '../../../../constants/app_themes/app_colors/app_colors.dart';
import '../../../../error_handler/error_handler.dart';
import '../../../../router/router.gr.dart';
import '../../../../router/services.dart';
import '../../../../store/authorization_state/authorization_state.dart';
import '../../../../store/category_state/category_state.dart';
import '../../../../store/product_state/product_state.dart';
import '../../../../store/unit_state/unit_state.dart';
import '../../../store/contragent_state/contragent_state.dart';
import '../contragent_add_and_edit_widget/contragent_create_widget.dart';
import '../contragent_add_and_edit_widget/contragent_edit_widget.dart';
import '../contragents_elements_screen/contragents_elements_screen.dart';

class ContragentSubcategoryPart extends StatefulWidget {
  const ContragentSubcategoryPart({Key? key, required this.parentGuid})
      : super(key: key);
  final parentGuid;
  @override
  State<ContragentSubcategoryPart> createState() =>
      _ContragentSubcategoryPartState();
}

final getContragent = GetIt.I<ContragentState>();

//Expanded Check
bool isExpanded = true;

// Loading Check
bool isLoading = false;

class _ContragentSubcategoryPartState extends State<ContragentSubcategoryPart> {
  @override
  Widget build(BuildContext context) {
    //Draw Subcategorys
    return Observer(
      builder: (_) => Column(
        children: [
          for (int i = 0; i < getContragent.contragentCategoryList.length; i++)
            if (getContragent.contragentCategoryList[i].parentguid ==
                widget.parentGuid)
              LayoutBuilder(
                builder: (context, constraints) => ExpansionTile(
                  initiallyExpanded: false,
                  leading:
                      getContragent.contragentCategoryList[i].haschildren == 1
                          ? CustomIcons.arrowDropDown
                          : null,
                  trailing: SizedBox(
                    height: MediaQuery.of(context).size.height / 8.44,
                    width: MediaQuery.of(context).size.height / 8.44,
                    child: Row(
                      children: [
                        Expanded(
                          child: PopupMenuButton(
                              // add icon, by default "3 dot" icon
                              icon: AppIcons(
                                icon: Icons.more_vert,
                                size: Dimensions.iconSize24,
                              ),
                              itemBuilder: (context) {
                                return [
                                  PopupMenuItem<int>(
                                      value: 0,
                                      child: Row(
                                        children: [
                                          AppIcons(
                                            icon: Icons.edit,
                                            size: Dimensions.iconSize24,
                                          ),
                                          SizedBox(width: Dimensions.width15),
                                          MiddleText(
                                            text: "edit".tr(),
                                            color: AppColors.appBlack,
                                          )
                                        ],
                                      )),
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
                                              text: getContragent
                                                  .contragentCategoryList[i]
                                                  .caption,
                                              color: AppColors.appWhite,
                                            ),
                                          ),
                                          body: EditContragent(
                                            guidOfCategories: getContragent
                                                .contragentCategoryList[i].guid,
                                            isRoot: getContragent
                                                .contragentCategoryList[i]
                                                .isroot,
                                            nameOfCategories: getContragent
                                                .contragentCategoryList[i]
                                                .caption,
                                            parentGuidOfCategories:
                                                getContragent
                                                    .contragentCategoryList[i]
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
                                                        "${'deleteContragent'.tr()} ?",
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
                                                                await getContragent.delGroup(
                                                                    context:
                                                                        context,
                                                                    guid: getContragent
                                                                        .contragentCategoryList[
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

                                                              endLoad(setState);
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
                                                            text: 'cancle'.tr(),
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
                                }
                              }),
                        ),

                        //Go tu Products
                        Expanded(
                          child: IconButton(
                              onPressed: () {
                                openContragentElement(
                                    mainCategoryGuid: getContragent
                                        .contragentCategoryList[i].guid,
                                    mainCategoryName: getContragent
                                        .contragentCategoryList[i].caption,
                                    isRoot: getContragent
                                        .contragentCategoryList[i].isroot);
                              },
                              icon: AppIcons(
                                icon: Icons.note_alt_outlined,
                                size: Dimensions.iconSize24,
                              )),
                        ),

                        Expanded(
                          child: IconButton(
                              onPressed: () {
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
                                              padding: const EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          Dimensions
                                                              .borderRadius10),
                                                  boxShadow: const [
                                                    BoxShadow(
                                                        color: Color.fromRGBO(
                                                            143, 148, 251, .2),
                                                        blurRadius: 20.0,
                                                        offset: Offset(0, 10))
                                                  ]),
                                              child: Column(
                                                children: [
                                                  CreateContragent(
                                                    isRoot: getContragent
                                                        .contragentCategoryList[
                                                            i]
                                                        .isroot,
                                                    parentGuid: getContragent
                                                        .contragentCategoryList[
                                                            i]
                                                        .guid,
                                                    title: 'nameOfContragent',
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    });
                              },
                              icon: AppIcons(
                                icon: Icons.add_rounded,
                                size: Dimensions.iconSize24,
                              )),
                        ),
                      ],
                    ),
                  ),

                  title: MiddleText(
                    text: getContragent.contragentCategoryList[i].caption,
                    // ignore: prefer_const_constructors
                  ),
                  onExpansionChanged: (value) {
                    isExpanded = value;
                    setState(() {});
                  },

                  children: [
                    ContragentSubcategoryPart(
                        parentGuid:
                            getContragent.contragentCategoryList[i].guid)
                  ],
                  // ignore: prefer_const_literals_to_create_immutables
                ),
              ),
        ],
      ),
    );
  }

//Route to Menu Elements
  Future<void> openContragentElement(
      {required mainCategoryGuid,
      required mainCategoryName,
      required isRoot}) async {
    await getContragent.groupingContragents(
        mainCategoryGuid: mainCategoryGuid, mainCategoryName: mainCategoryName);

    router.replace(ContragentElementRoute(
      mainCategoryName: mainCategoryName,
      isRoot: isRoot,
      mainCategoryGuid: mainCategoryGuid,
    ));
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
