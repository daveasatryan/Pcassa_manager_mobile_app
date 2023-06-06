// ignore_for_file: unnecessary_string_interpolations, prefer_typing_uninitialized_variables, prefer_interpolation_to_compose_strings, unrelated_type_equality_checks, must_be_immutable

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pcassa_retail/constants/dimensions/dimensions.dart';
import 'package:pcassa_retail/screens/products_screen/products_group_screen/products_categories_add_and_edit_wigdets/products_categories_create_widget.dart';
import 'package:pcassa_retail/widgets/middle_text.dart';
import '../../../../constants/app_themes/app_colors/app_colors.dart';
import '../../../../error_handler/error_handler.dart';
import '../../../../router/services.dart';
import '../../../../store/product_state/product_state.dart';
import '../../../models/contragent_model/contragent_model.dart';
import '../../../store/contragent_state/contragent_state.dart';

class EditContragent extends StatefulWidget {
  EditContragent(
      {Key? key,
      required this.guidOfCategories,
      required this.isRoot,
      required this.nameOfCategories,
      required this.parentGuidOfCategories})
      : super(key: key);
  final nameOfCategories;
  final guidOfCategories;
  final parentGuidOfCategories;
  var isRoot;

  @override
  State<EditContragent> createState() => _EditContragentState();
}

//Get Products State
final getContragent = GetIt.I<ContragentState>();

//Contrallers defination
var groupContraller = TextEditingController();
var nameContraller = TextEditingController();
var contraller = TextEditingController();

//New Group Guid Save
var newGuid;
//All Groups List
List<DropdownMenuItem<String>> groupList = [];

class _EditContragentState extends State<EditContragent> {
  //GropupList initialization
  @override
  void initState() {
    groupList = [
      DropdownMenuItem(
          value: "9d160d60-4c16-4ff7-b9f4-459c93313d14",
          child: Text("firstLevel".tr())),
      for (int i = 0; i < getContragent.contragentCategoryList.length; i++)
        DropdownMenuItem(
            value: "${getContragent.contragentCategoryList[i].guid}",
            child: MiddleText(
                text: "${getContragent.contragentCategoryList[i].caption}")),
    ];
    super.initState();

//Group change Setting Logic
    if (widget.isRoot == 0) {
      groupContraller.text = "9d160d60-4c16-4ff7-b9f4-459c93313d14";
      nameContraller.text = widget.nameOfCategories;
    } else {
      groupContraller.text = widget.parentGuidOfCategories;
      nameContraller.text = widget.nameOfCategories;
    }
  }

//Loading Check
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 60, 0, 0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Padding(
                  padding: const EdgeInsets.all(16),
                  child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.circular(Dimensions.borderRadius10),
                          boxShadow: const [
                            BoxShadow(
                                color: Color.fromRGBO(143, 148, 251, .2),
                                blurRadius: 20.0,
                                offset: Offset(0, 10))
                          ]),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: DropdownButtonFormField(
                                    iconEnabledColor: AppColors.appCoral,
                                    decoration: InputDecoration(
                                      border: const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: AppColors.appPurple),
                                      ),
                                      focusedBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: AppColors.appPurple),
                                      ),
                                      enabledBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: AppColors.appLightBlack),
                                      ),
                                      label: RichText(
                                        text: TextSpan(
                                            text: '* ',
                                            style: TextStyle(
                                                color: AppColors.appCoral,
                                                fontSize: Dimensions.font16),
                                            children: [
                                              TextSpan(
                                                  text: 'mainCategory'.tr(),
                                                  style: TextStyle(
                                                      color: AppColors
                                                          .appLightBlack,
                                                      fontSize:
                                                          Dimensions.font16))
                                            ]),
                                      ),
                                      labelStyle: const TextStyle(
                                          color: AppColors.appLightBlack),
                                    ),
                                    value: groupContraller.text,
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        groupContraller.text = newValue!;
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
                                                      width: Dimensions
                                                          .deletePopwidth,
                                                      child: SimpleDialog(
                                                        title: MiddleText(
                                                          text:
                                                              'areYouSureToChangeContragentGroup'
                                                                      .tr() +
                                                                  " ?",
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
                                                                    switch (
                                                                        newValue) {
                                                                      case '9d160d60-4c16-4ff7-b9f4-459c93313d14':
                                                                        {
                                                                          try {
                                                                            await getContragent.changeGroupe(
                                                                                guid: widget.guidOfCategories,
                                                                                newguid: newValue,
                                                                                oldguid: widget.parentGuidOfCategories,
                                                                                isRoot: 0,
                                                                                context: context);
                                                                          } catch (e) {
                                                                            if (e
                                                                                is DioError) {
                                                                              await ErrorHandler.errorModal(
                                                                                context: context,
                                                                                errorCode: e.response,
                                                                              );
                                                                              break;
                                                                            } else {
                                                                              print(e.toString());
                                                                              break;
                                                                            }
                                                                          }
                                                                          break;
                                                                        }
                                                                      default:
                                                                        {
                                                                          try {
                                                                            await getContragent.changeGroupe(
                                                                                context: context,
                                                                                guid: widget.guidOfCategories,
                                                                                newguid: newValue,
                                                                                oldguid: widget.parentGuidOfCategories,
                                                                                isRoot: 1);
                                                                          } catch (e) {
                                                                            if (e
                                                                                is DioError) {
                                                                              await ErrorHandler.errorModal(
                                                                                context: context,
                                                                                errorCode: e.response,
                                                                              );
                                                                              break;
                                                                            } else {
                                                                              print(e.toString());
                                                                              break;
                                                                            }
                                                                          }
                                                                        }
                                                                        break;
                                                                    }

                                                                    endLoad(
                                                                        setState);
                                                                  },
                                                                  child: isLoading
                                                                      ? const CircularProgressIndicator(
                                                                          color:
                                                                              AppColors.appCoral,
                                                                        )
                                                                      : MiddleText(
                                                                          text:
                                                                              'yes'.tr(),
                                                                          color:
                                                                              AppColors.appCoral,
                                                                        )),
                                                              TextButton(
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.pop(
                                                                        context);
                                                                  },
                                                                  child:
                                                                      MiddleText(
                                                                    text: 'cancle'
                                                                        .tr(),
                                                                    color: AppColors
                                                                        .appCoral,
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
                                      });
                                    },
                                    items: groupList)),
                            Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: TextFormField(
                                  controller: nameContraller,
                                  style: const TextStyle(
                                      color: AppColors.appBlack),
                                  decoration: InputDecoration(
                                    border: const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppColors.appPurple),
                                    ),
                                    focusedBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppColors.appPurple),
                                    ),
                                    enabledBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppColors.appLightBlack),
                                    ),
                                    label: RichText(
                                      text: TextSpan(
                                          text: '* ',
                                          style: TextStyle(
                                            color: AppColors.appCoral,
                                            fontSize: Dimensions.font16,
                                          ),
                                          children: [
                                            TextSpan(
                                                text: 'nameOfContragent'.tr(),
                                                style: TextStyle(
                                                    color:
                                                        AppColors.appLightBlack,
                                                    fontSize:
                                                        Dimensions.font16))
                                          ]),
                                    ),
                                    labelStyle: TextStyle(
                                        color: AppColors.appLightBlack,
                                        fontSize: Dimensions.font16),
                                  ),
                                )),
                          ]))),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                child: SizedBox(
                  width: double.infinity,
                  height: Dimensions.height20 * 3,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(AppColors.appPurple),
                    ),
                    onPressed: () async {
                      if (nameContraller.text == '') {
                        showDialog<bool?>(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return SimpleDialog(
                              title: MiddleText(
                                text: "cardIsNotFull".tr(),
                              ),
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: MiddleText(
                                    text: 'done'.tr(),
                                    color: AppColors.appPurple,
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      } else {
                        setState(() {
                          isLoading = true;
                        });
                        switch (widget.parentGuidOfCategories) {
                          case '9d160d60-4c16-4ff7-b9f4-459c93313d14':
                            {
                              try {
                                await getContragent.addContragentGroup(
                                    context: context,
                                    guid: widget.guidOfCategories,
                                    parentGuid: widget.parentGuidOfCategories,
                                    caption: nameContraller.text,
                                    isRoot: 0);

                                // await getProducts.categoryFirstMade();
                              } catch (e) {
                                if (e is DioError) {
                                  await ErrorHandler.errorModal(
                                    context: context,
                                    errorCode: e.response,
                                  );
                                  break;
                                } else {
                                  print(e.toString());
                                  break;
                                }
                              }
                              break;
                            }
                          default:
                            {
                              try {
                                await getContragent.addContragentGroup(
                                    context: context,
                                    guid: widget.guidOfCategories,
                                    parentGuid: widget.parentGuidOfCategories,
                                    caption: nameContraller.text,
                                    isRoot: 1);
                              } catch (e) {
                                if (e is DioError) {
                                  await ErrorHandler.errorModal(
                                    context: context,
                                    errorCode: e.response,
                                  );
                                  break;
                                } else {
                                  print(e.toString());
                                  break;
                                }
                              }
                            }
                            break;
                        }

                        setState(() {
                          isLoading = false;
                        });
                        router.pop();
                      }
                    },
                    child: isLoading
                        ? const CircularProgressIndicator(
                            color: AppColors.appWhite,
                          )
                        : MiddleText(
                            text: "save".tr(),
                            color: AppColors.appWhite,
                          ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: MiddleText(
                    text: "close".tr(),
                    color: AppColors.appPurple,
                  ),
                ),
              ),
            ])));
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
      getContragent.categoryFirstMade();

      isLoading = false;
      Navigator.pop(context);
    });
  }
}
