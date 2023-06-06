// ignore_for_file: prefer_typing_uninitialized_variables, non_constant_identifier_names, unrelated_type_equality_checks

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pcassa_retail/constants/dimensions/dimensions.dart';
import 'package:pcassa_retail/constants/paddings_constants/padding_constants.dart';
import 'package:pcassa_retail/error_handler/error_handler.dart';
import 'package:pcassa_retail/screens/products_screen/products_group_screen/products_categories_add_and_edit_wigdets/products_categories_edit_widget.dart';
import 'package:pcassa_retail/store/product_state/product_state.dart';
import 'package:pcassa_retail/widgets/big_text.dart';
import 'package:pcassa_retail/widgets/middle_text.dart';
//import 'package:scan/scan.dart';

import '../../../../constants/app_themes/app_colors/app_colors.dart';
import '../../../../constants/app_themes/app_icons/app_icons.dart';
import '../../../../models/contragent_items_model/contragent_items_model.dart';
import '../../../../models/product_element_model/product_element_model.dart';
import '../../../../router/services.dart';
import '../../../../store/category_state/category_state.dart';
import '../../../../store/contragent_state/contragent_state.dart';
import '../../../../store/unit_state/unit_state.dart';
import '../../../../widgets/small_text_widget.dart';

class CreateContragentElement extends StatefulWidget {
  const CreateContragentElement(
      {Key? key,
      required this.mainCategoryName,
      required this.barCode,
      required this.isRoot,
      required this.mainCategoryGuid})
      : super(key: key);
  final mainCategoryName;
  final barCode;
  final isRoot;
  final mainCategoryGuid;
  @override
  State<CreateContragentElement> createState() =>
      _CreateContragentElementState();
}

class _CreateContragentElementState extends State<CreateContragentElement> {
  //Contrallers Defination
  var contragentCodContraller = TextEditingController();
  var mainNameContraller = TextEditingController();
  var fullNameContraller = TextEditingController();
  var yourAdressContraller = TextEditingController();
  var postAdressContraller = TextEditingController();
  var telephoneContraller = TextEditingController();
  var contactNameConttraller = TextEditingController();
  var innContraller = TextEditingController();
  var kppContraller = TextEditingController();
  var rrshetContraller = TextEditingController();
  var kshetContraller = TextEditingController();
  var bikContraller = TextEditingController();
  var bankNameContraller = TextEditingController();
  var credditContraller = TextEditingController();
  var primContraller = TextEditingController();
  var descriptionContraller = TextEditingController();

  var mainGroupContraller = TextEditingController();

  final ScrollController scrollController = ScrollController();

  //Get Products State
  var getContragent = GetIt.I<ContragentState>();

//Element Group List
  List<DropdownMenuItem<String>> mainGroupList = [];
  //Status Contrallers
  var fixSumContraller;

  //Status Checking
  var fixSumCheck = true;

  //Boolean variable definations for checkBoxes
  bool? fixSumChecked;

  bool closeTab = true;
  bool isLoading = false;
  //Initiazlization before screen Load
  @override
  void initState() {
    contragentCodContraller.text = "0";
    nameContraller.text = "";

    fullNameContraller.text = "";

    yourAdressContraller.text = "";

    postAdressContraller.text = "";

    telephoneContraller.text = "";

    contactNameConttraller.text = "";

    innContraller.text = "";

    kppContraller.text = "";

    rrshetContraller.text = "";

    kshetContraller.text = "";

    bikContraller.text = "";

    bankNameContraller.text = "";

    credditContraller.text = "";

    primContraller.text = "";

    descriptionContraller.text = "";

    mainGroupContraller.text = widget.mainCategoryGuid;
    super.initState();
    //Dropdown logic for main Group
    mainGroupList = [
      for (int i = 0; i < getContragent.contragentCategoryList.length; i++)
        DropdownMenuItem(
            value: getContragent.contragentCategoryList[i].guid,
            child: MiddleText(
              text: getContragent.contragentCategoryList[i].caption,
              size: Dimensions.font14,
            )),
    ];

    //Check Boxe state logic
    //Product Status
    if (fixSumCheck == true) {
      fixSumContraller = true;
      fixSumChecked = true;
    } else {
      fixSumContraller = false;
      fixSumChecked = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return AppColors.appCoral;
    }

    return Scaffold(
      appBar: AppBar(
        title: MiddleText(
          text: 'newProduct'.tr(),
          color: AppColors.appWhite,
        ),
        backgroundColor: AppColors.appPurple,
        actions: [
          TextButton(
            onPressed: () async {
              startLoad(setState);
              await onElementSave();
              endLoad(setState);
              if (closeTab != false) {
                router.pop();
              } else {
                setState(() {
                  closeTab = true;
                });
              }
            }, //onEditSave Function
            child: isLoading
                ? const CircularProgressIndicator(
                    color: AppColors.appWhite,
                  )
                : MiddleText(
                    text: "save".tr(),
                    color: AppColors.appWhite,
                  ),
          ),
          SizedBox(
            width: Dimensions.width15,
          ),
        ],
      ),

      //Body Start
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(paddingAll),
          child: Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(Dimensions.borderRadius10),
                boxShadow: const [
                  BoxShadow(
                      color: Color.fromRGBO(143, 148, 251, .2),
                      blurRadius: 20.0,
                      offset: Offset(0, 10))
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Main product code TextField
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: paddingHorizontal,
                        vertical: paddingVertical),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.height / 10.55,
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              readOnly: true,
                              controller: contragentCodContraller,
                              style: const TextStyle(
                                  color: AppColors.appLightBlack),
                              decoration: InputDecoration(
                                border: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.appLightBlack),
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColors.appPurple),
                                ),
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.appLightBlack),
                                ),
                                label: RichText(
                                  text: TextSpan(
                                      text: '',
                                      style: TextStyle(
                                          color: AppColors.appCoral,
                                          fontSize: Dimensions.font14),
                                      children: [
                                        TextSpan(
                                            text: 'productCode'.tr(),
                                            style: TextStyle(
                                                color: AppColors.appLightBlack,
                                                fontSize: Dimensions.font14))
                                      ]),
                                ),
                                labelStyle: TextStyle(
                                    fontSize: Dimensions.font14,
                                    color: AppColors.appLightBlack),
                              ),
                            ),
                          ),
                        ])),

//Main category select
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: paddingHorizontal,
                        vertical: paddingVertical),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: TextFormField(
                              readOnly: false,
                              controller: nameContraller,
                              style: const TextStyle(color: AppColors.appBlack),
                              decoration: InputDecoration(
                                border: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.appLightBlack),
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColors.appPurple),
                                ),
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.appLightBlack),
                                ),
                                label: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                          text: '',
                                          style: TextStyle(
                                              color: AppColors.appCoral,
                                              fontSize: Dimensions.font14),
                                          children: [
                                            TextSpan(
                                                text: 'nameContragent'.tr(),
                                                style: TextStyle(
                                                  fontSize: Dimensions.font14,
                                                  color:
                                                      AppColors.appLightBlack,
                                                )),
                                          ]),
                                    ),
                                  ],
                                ),
                                labelStyle: TextStyle(
                                    color: AppColors.appLightBlack,
                                    fontSize: Dimensions.font14),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: Dimensions.width15,
                          ),

                          //element group barcode
                          Expanded(
                            child: TextFormField(
                              readOnly: false,
                              controller: fullNameContraller,
                              style: const TextStyle(color: AppColors.appBlack),
                              decoration: InputDecoration(
                                border: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.appLightBlack),
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColors.appPurple),
                                ),
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.appLightBlack),
                                ),
                                label: RichText(
                                  text: TextSpan(
                                      text: '',
                                      style: TextStyle(
                                        fontSize: Dimensions.font14,
                                        color: AppColors.appCoral,
                                      ),
                                      children: [
                                        TextSpan(
                                            text: 'contragentFullName'.tr(),
                                            style: TextStyle(
                                              fontSize: Dimensions.font14,
                                              color: AppColors.appLightBlack,
                                            ))
                                      ]),
                                ),
                                labelStyle: TextStyle(
                                    color: AppColors.appLightBlack,
                                    fontSize: Dimensions.font14),
                              ),
                            ),
                          ),
                        ])),
                // Padding(
                //     padding: const EdgeInsets.symmetric(
                //         horizontal: paddingHorizontal,
                //         vertical: paddingVertical),
                //     child: DropdownButtonFormField(
                //         iconEnabledColor: AppColors.appCoral,
                //         decoration: InputDecoration(
                //           border: const UnderlineInputBorder(
                //             borderSide:
                //                 BorderSide(color: AppColors.appLightBlack),
                //           ),
                //           focusedBorder: const UnderlineInputBorder(
                //             borderSide: BorderSide(color: AppColors.appPurple),
                //           ),
                //           enabledBorder: const UnderlineInputBorder(
                //             borderSide:
                //                 BorderSide(color: AppColors.appLightBlack),
                //           ),
                //           label: RichText(
                //             text: TextSpan(
                //                 text: '',
                //                 style: TextStyle(
                //                     color: AppColors.appCoral,
                //                     fontSize: Dimensions.font14),
                //                 children: [
                //                   TextSpan(
                //                       text: 'mainCategory'.tr(),
                //                       style: TextStyle(
                //                         fontSize: Dimensions.font14,
                //                         color: AppColors.appLightBlack,
                //                       ))
                //                 ]),
                //           ),
                //           labelStyle: TextStyle(
                //               color: AppColors.appLightBlack,
                //               fontSize: Dimensions.font14),
                //         ),
                //         value: mainGroupContraller.text,
                //         onChanged: (String? newValue) {
                //           setState(() {
                //             showDialog<void>(
                //               context: context,
                //               builder: (BuildContext context) {
                //                 return StatefulBuilder(
                //                   builder: (BuildContext context,
                //                       StateSetter setState) {
                //                     return Row(
                //                       mainAxisAlignment:
                //                           MainAxisAlignment.center,
                //                       children: [
                //                         SimpleDialog(
                //                           title: MiddleText(
                //                             text:
                //                                 "${'areYouSureToChangeCategory'.tr()} ?",
                //                           ),
                //                           children: [
                //                             Row(
                //                               mainAxisAlignment:
                //                                   MainAxisAlignment.center,
                //                               children: [
                //                                 TextButton(
                //                                     onPressed: () async {
                //                                       startLoad(setState);

                //                                       mainGroupContraller.text =
                //                                           newValue!;
                //                                       await onElementSave();

                //                                       endLoad(setState);
                //                                       if (closeTab != false) {
                //                                         router.pop();
                //                                       } else {
                //                                         setState(() {
                //                                           closeTab = true;
                //                                         });
                //                                       }
                //                                     },
                //                                     child: isLoading
                //                                         ? const CircularProgressIndicator(
                //                                             color: AppColors
                //                                                 .appCoral,
                //                                           )
                //                                         : MiddleText(
                //                                             text: 'yes'.tr(),
                //                                             color: AppColors
                //                                                 .appCoral,
                //                                           )),
                //                                 TextButton(
                //                                   onPressed: () {
                //                                     Navigator.pop(context);
                //                                   },
                //                                   child: MiddleText(
                //                                     text: 'cancle'.tr(),
                //                                     color: AppColors.appCoral,
                //                                   ),
                //                                 ),
                //                               ],
                //                             )
                //                           ],
                //                         )
                //                       ],
                //                     );
                //                   },
                //                 );
                //               },
                //             );
                //           });
                //         },
                //         items: mainGroupList)),
                //Product Name
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: paddingHorizontal,
                        vertical: paddingVertical),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: TextFormField(
                              readOnly: false,
                              controller: yourAdressContraller,
                              style: const TextStyle(color: AppColors.appBlack),
                              decoration: InputDecoration(
                                border: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.appLightBlack),
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColors.appPurple),
                                ),
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.appLightBlack),
                                ),
                                label: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                          text: '',
                                          style: TextStyle(
                                              color: AppColors.appCoral,
                                              fontSize: Dimensions.font14),
                                          children: [
                                            TextSpan(
                                                text: 'yourAdress'.tr(),
                                                style: TextStyle(
                                                  fontSize: Dimensions.font14,
                                                  color:
                                                      AppColors.appLightBlack,
                                                )),
                                          ]),
                                    ),
                                  ],
                                ),
                                labelStyle: TextStyle(
                                    color: AppColors.appLightBlack,
                                    fontSize: Dimensions.font14),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: Dimensions.width15,
                          ),

                          //element group barcode
                          Expanded(
                            child: TextFormField(
                              readOnly: false,
                              controller: postAdressContraller,
                              style: const TextStyle(color: AppColors.appBlack),
                              decoration: InputDecoration(
                                border: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.appLightBlack),
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColors.appPurple),
                                ),
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.appLightBlack),
                                ),
                                label: RichText(
                                  text: TextSpan(
                                      text: '',
                                      style: TextStyle(
                                        fontSize: Dimensions.font14,
                                        color: AppColors.appCoral,
                                      ),
                                      children: [
                                        TextSpan(
                                            text: 'postAdress'.tr(),
                                            style: TextStyle(
                                              fontSize: Dimensions.font14,
                                              color: AppColors.appLightBlack,
                                            ))
                                      ]),
                                ),
                                labelStyle: TextStyle(
                                    color: AppColors.appLightBlack,
                                    fontSize: Dimensions.font14),
                              ),
                            ),
                          ),
                        ])),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: paddingHorizontal,
                        vertical: paddingVertical),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              readOnly: false,
                              controller: telephoneContraller,
                              style: const TextStyle(color: AppColors.appBlack),
                              decoration: InputDecoration(
                                border: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.appLightBlack),
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColors.appPurple),
                                ),
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.appLightBlack),
                                ),
                                label: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                          text: '',
                                          style: TextStyle(
                                              color: AppColors.appCoral,
                                              fontSize: Dimensions.font14),
                                          children: [
                                            TextSpan(
                                                text: 'telephone'.tr(),
                                                style: TextStyle(
                                                  fontSize: Dimensions.font14,
                                                  color:
                                                      AppColors.appLightBlack,
                                                )),
                                          ]),
                                    ),
                                  ],
                                ),
                                labelStyle: TextStyle(
                                    color: AppColors.appLightBlack,
                                    fontSize: Dimensions.font14),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: Dimensions.width15,
                          ),

                          //element group barcode
                          Expanded(
                            child: TextFormField(
                              readOnly: false,
                              controller: contactNameConttraller,
                              style: const TextStyle(color: AppColors.appBlack),
                              decoration: InputDecoration(
                                border: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.appLightBlack),
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColors.appPurple),
                                ),
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.appLightBlack),
                                ),
                                label: RichText(
                                  text: TextSpan(
                                      text: '',
                                      style: TextStyle(
                                        fontSize: Dimensions.font14,
                                        color: AppColors.appCoral,
                                      ),
                                      children: [
                                        TextSpan(
                                            text: 'contactPersonName'.tr(),
                                            style: TextStyle(
                                              fontSize: Dimensions.font14,
                                              color: AppColors.appLightBlack,
                                            ))
                                      ]),
                                ),
                                labelStyle: TextStyle(
                                    color: AppColors.appLightBlack,
                                    fontSize: Dimensions.font14),
                              ),
                            ),
                          ),
                        ])),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: paddingHorizontal,
                        vertical: paddingVertical),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              readOnly: false,
                              controller: innContraller,
                              style: const TextStyle(color: AppColors.appBlack),
                              decoration: InputDecoration(
                                border: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.appLightBlack),
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColors.appPurple),
                                ),
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.appLightBlack),
                                ),
                                label: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                          text: '',
                                          style: TextStyle(
                                              color: AppColors.appCoral,
                                              fontSize: Dimensions.font14),
                                          children: [
                                            TextSpan(
                                                text: 'inn'.tr(),
                                                style: TextStyle(
                                                  fontSize: Dimensions.font14,
                                                  color:
                                                      AppColors.appLightBlack,
                                                )),
                                          ]),
                                    ),
                                  ],
                                ),
                                labelStyle: TextStyle(
                                    color: AppColors.appLightBlack,
                                    fontSize: Dimensions.font14),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: Dimensions.width15,
                          ),

                          //element group barcode
                          Expanded(
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              readOnly: false,
                              controller: kppContraller,
                              style: const TextStyle(color: AppColors.appBlack),
                              decoration: InputDecoration(
                                border: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.appLightBlack),
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColors.appPurple),
                                ),
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.appLightBlack),
                                ),
                                label: RichText(
                                  text: TextSpan(
                                      text: '',
                                      style: TextStyle(
                                        fontSize: Dimensions.font14,
                                        color: AppColors.appCoral,
                                      ),
                                      children: [
                                        TextSpan(
                                            text: 'kpp'.tr(),
                                            style: TextStyle(
                                              fontSize: Dimensions.font14,
                                              color: AppColors.appLightBlack,
                                            ))
                                      ]),
                                ),
                                labelStyle: TextStyle(
                                    color: AppColors.appLightBlack,
                                    fontSize: Dimensions.font14),
                              ),
                            ),
                          ),
                        ])),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: paddingHorizontal,
                        vertical: paddingVertical),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              readOnly: false,
                              controller: rrshetContraller,
                              style: const TextStyle(color: AppColors.appBlack),
                              decoration: InputDecoration(
                                border: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.appLightBlack),
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColors.appPurple),
                                ),
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.appLightBlack),
                                ),
                                label: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      child: RichText(
                                        overflow: TextOverflow.ellipsis,
                                        text: TextSpan(
                                            text: '',
                                            style: TextStyle(
                                                color: AppColors.appCoral,
                                                fontSize: Dimensions.font14),
                                            children: [
                                              TextSpan(
                                                  text: 'rshet'.tr(),
                                                  style: TextStyle(
                                                    fontSize: Dimensions.font14,
                                                    color:
                                                        AppColors.appLightBlack,
                                                  )),
                                            ]),
                                      ),
                                    ),
                                  ],
                                ),
                                labelStyle: TextStyle(
                                    color: AppColors.appLightBlack,
                                    fontSize: Dimensions.font14),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: Dimensions.width15,
                          ),

                          //element group barcode
                          Expanded(
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              readOnly: false,
                              controller: kshetContraller,
                              style: const TextStyle(color: AppColors.appBlack),
                              decoration: InputDecoration(
                                border: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.appLightBlack),
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColors.appPurple),
                                ),
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.appLightBlack),
                                ),
                                label: RichText(
                                  text: TextSpan(
                                      text: '',
                                      style: TextStyle(
                                        fontSize: Dimensions.font14,
                                        color: AppColors.appCoral,
                                      ),
                                      children: [
                                        TextSpan(
                                            text: 'kshet'.tr(),
                                            style: TextStyle(
                                              fontSize: Dimensions.font14,
                                              color: AppColors.appLightBlack,
                                            ))
                                      ]),
                                ),
                                labelStyle: TextStyle(
                                    color: AppColors.appLightBlack,
                                    fontSize: Dimensions.font14),
                              ),
                            ),
                          ),
                        ])),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: paddingHorizontal,
                        vertical: paddingVertical),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              readOnly: false,
                              controller: bikContraller,
                              style: const TextStyle(color: AppColors.appBlack),
                              decoration: InputDecoration(
                                border: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.appLightBlack),
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColors.appPurple),
                                ),
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.appLightBlack),
                                ),
                                label: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                          text: '',
                                          style: TextStyle(
                                              color: AppColors.appCoral,
                                              fontSize: Dimensions.font14),
                                          children: [
                                            TextSpan(
                                                text: 'bik'.tr(),
                                                style: TextStyle(
                                                  fontSize: Dimensions.font14,
                                                  color:
                                                      AppColors.appLightBlack,
                                                )),
                                          ]),
                                    ),
                                  ],
                                ),
                                labelStyle: TextStyle(
                                    color: AppColors.appLightBlack,
                                    fontSize: Dimensions.font14),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: Dimensions.width15,
                          ),

                          //element group barcode
                          Expanded(
                            child: TextFormField(
                              readOnly: false,
                              controller: bankNameContraller,
                              style: const TextStyle(color: AppColors.appBlack),
                              decoration: InputDecoration(
                                border: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.appLightBlack),
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColors.appPurple),
                                ),
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.appLightBlack),
                                ),
                                label: RichText(
                                  text: TextSpan(
                                      text: '',
                                      style: TextStyle(
                                        fontSize: Dimensions.font14,
                                        color: AppColors.appCoral,
                                      ),
                                      children: [
                                        TextSpan(
                                            text: 'bankName'.tr(),
                                            style: TextStyle(
                                              fontSize: Dimensions.font14,
                                              color: AppColors.appLightBlack,
                                            ))
                                      ]),
                                ),
                                labelStyle: TextStyle(
                                    color: AppColors.appLightBlack,
                                    fontSize: Dimensions.font14),
                              ),
                            ),
                          ),
                        ])),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: paddingHorizontal,
                        vertical: paddingVertical),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              readOnly: false,
                              controller: credditContraller,
                              style: const TextStyle(color: AppColors.appBlack),
                              decoration: InputDecoration(
                                border: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.appLightBlack),
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColors.appPurple),
                                ),
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.appLightBlack),
                                ),
                                label: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                          text: '',
                                          style: TextStyle(
                                              color: AppColors.appCoral,
                                              fontSize: Dimensions.font14),
                                          children: [
                                            TextSpan(
                                                text: 'kredit'.tr(),
                                                style: TextStyle(
                                                  fontSize: Dimensions.font14,
                                                  color:
                                                      AppColors.appLightBlack,
                                                )),
                                          ]),
                                    ),
                                  ],
                                ),
                                labelStyle: TextStyle(
                                    color: AppColors.appLightBlack,
                                    fontSize: Dimensions.font14),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: Dimensions.width15,
                          ),

                          //element group barcode
                          Expanded(
                            child: TextFormField(
                              readOnly: false,
                              controller: primContraller,
                              style: const TextStyle(color: AppColors.appBlack),
                              decoration: InputDecoration(
                                border: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.appLightBlack),
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColors.appPurple),
                                ),
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.appLightBlack),
                                ),
                                label: RichText(
                                  text: TextSpan(
                                      text: '',
                                      style: TextStyle(
                                        fontSize: Dimensions.font14,
                                        color: AppColors.appCoral,
                                      ),
                                      children: [
                                        TextSpan(
                                            text: 'primechaniee'.tr(),
                                            style: TextStyle(
                                              fontSize: Dimensions.font14,
                                              color: AppColors.appLightBlack,
                                            ))
                                      ]),
                                ),
                                labelStyle: TextStyle(
                                    color: AppColors.appLightBlack,
                                    fontSize: Dimensions.font14),
                              ),
                            ),
                          ),
                        ])),

                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: paddingHorizontal,
                        vertical: paddingVertical),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: TextFormField(
                              readOnly: false,
                              controller: descriptionContraller,
                              style: const TextStyle(color: AppColors.appBlack),
                              decoration: InputDecoration(
                                border: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.appLightBlack),
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColors.appPurple),
                                ),
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.appLightBlack),
                                ),
                                label: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                          text: '',
                                          style: TextStyle(
                                              color: AppColors.appCoral,
                                              fontSize: Dimensions.font14),
                                          children: [
                                            TextSpan(
                                                text: 'description'.tr(),
                                                style: TextStyle(
                                                  fontSize: Dimensions.font14,
                                                  color:
                                                      AppColors.appLightBlack,
                                                )),
                                          ]),
                                    ),
                                  ],
                                ),
                                labelStyle: TextStyle(
                                    color: AppColors.appLightBlack,
                                    fontSize: Dimensions.font14),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: Dimensions.width15,
                          ),
                        ])),

                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BigText(
                            text: "fixSum".tr(),
                          ),
                          Checkbox(
                            checkColor: Colors.white,
                            fillColor:
                                MaterialStateProperty.resolveWith(getColor),
                            value: fixSumChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                fixSumChecked = value!;
                                if (fixSumCheck == true) {
                                  fixSumContraller = false;
                                } else {
                                  fixSumContraller = true;
                                }
                              });
                            },
                          ),
                        ]),
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  onElementSave() async {
    if (nameContraller.text == '') {
      setState(() {
        closeTab = false;
      });
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
      try {
        await getContragent.postContragent(
            context: context,
            contragentItemModel: ContragentItemsModel(
              guid: 0.toString(),
              name: nameContraller.text,
              description: descriptionContraller.text,
              kod: contragentCodContraller.text,
              yur_adres: yourAdressContraller.text,
              gguid: mainGroupContraller.text,
              post_adres: postAdressContraller.text,
              tel: telephoneContraller.text,
              full_name: fullNameContraller.text,
              inn: innContraller.text,
              kpp: kppContraller.text,
              rshet: rrshetContraller.text,
              kshet: kshetContraller.text,
              bik: bikContraller.text,
              bank_name: bankNameContraller.text,
              prim: primContraller.text,
              contact_litso: contactNameConttraller.text,
              kredit: credditContraller.text,
              fixsum: fixSumContraller,
            ));

        getContragent.groupContragents.clear();

        await getContragent.groupingContragents(
            mainCategoryGuid: widget.mainCategoryGuid,
            mainCategoryName: widget.mainCategoryName);
      } on DioError catch (e) {
        await ErrorHandler.errorModal(
          context: context,
          errorCode: e.response,
        );
        setState(() {
          closeTab = false;
        });
      }
    }
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
