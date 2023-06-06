// ignore_for_file: prefer_typing_uninitialized_variables, non_constant_identifier_names, unrelated_type_equality_checks, iterable_contains_unrelated_type

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
import 'package:pcassa_retail/widgets/small_text_widget.dart';
import 'package:scan/scan.dart';

import '../../../../constants/app_themes/app_colors/app_colors.dart';
import '../../../../constants/app_themes/app_icons/app_icons.dart';
import '../../../../models/product_element_model/product_element_model.dart';
import '../../../../router/services.dart';
import '../../../../store/category_state/category_state.dart';
import '../../../../store/unit_state/unit_state.dart';

class EditElement extends StatefulWidget {
  const EditElement({
    Key? key,
    required this.mainCategoryName,
    required this.element,
    required this.isRoot,
    required this.mainCategoryGuid,
  }) : super(key: key);

  final mainCategoryName;
  final ProductElementModel element;
  final isRoot;
  final mainCategoryGuid;
  @override
  State<EditElement> createState() => _EditElementState();
}

class _EditElementState extends State<EditElement> {
  //Contrallers Defination
  var productCodContraller = TextEditingController();
  var barCodContraller = TextEditingController();
  var groupBarCodContraller = TextEditingController();
  var mainNameContraller = TextEditingController();
  var altNameContraller = TextEditingController();
  var o_r_priceContraller = TextEditingController();
  var o_o_priceContraller = TextEditingController();
  var unitTypeContraller = TextEditingController();
  var categoryTypeContraller = TextEditingController();
  var adgCodeContraller = TextEditingController();
  var descriptionContraller = TextEditingController();
  var mainGroupContraller = TextEditingController();

  final ScrollController scrollController = ScrollController();

  //Get Products State
  var getProduct = GetIt.I<CreatedProducts>();

  //Get Unit State
  var getUnit = GetIt.I<UnitState>();

  //Get CategoryType State
  var getCategoryType = GetIt.I<CategoryState>();

  //Element Group List
  List<DropdownMenuItem<String>> mainGroupList = [];

  //Element Unit List
  Set<String> unitDropDownList = Set();

  //Element Unit List
  Set<String> categoryTypeDropDownList = Set();
//Scanner
  //Scan Contraller
 ScanController controller = ScanController();

  //Scan Result defination
  var _scanResult = '';
  //Status Contrallers
  var statusContraller;
  var topProductContraller;
  var priznakSkContraller;
  var exciseContraller;

  //Boolean variable definations for checkBoxes
  bool? statusChecked;
  bool? topProductChecked;
  bool? priznak_sk_checked;
  bool? excisechecked;

  bool isLoading = false;

  bool closeTab = true;
  //Initiazlization before screen Load

  @override
  void initState() {
    productCodContraller.text = widget.element.kod_tov!;
    barCodContraller.text = widget.element.barcode!;
    groupBarCodContraller.text = widget.element.barcode_grupp!;
    mainNameContraller.text =
        widget.element.name.toString().replaceAll("null", '');
    altNameContraller.text = widget.element.kname!;
    o_o_priceContraller.text = widget.element.price_o_o.toString();
    o_r_priceContraller.text = widget.element.price_o_r.toString();
    adgCodeContraller.text =
        widget.element.adg.toString().replaceAll("null", '');

    unitTypeContraller.text =
        widget.element.ed_izm.toString().replaceAll("null", '');
    categoryTypeContraller.text =
        widget.element.kat_tov.toString().replaceAll("null", '');
    descriptionContraller.text =
        widget.element.description.toString().replaceAll("null", '');
    mainGroupContraller.text = widget.mainCategoryGuid;

//Packag for Unit changes Detect
    for (int i = 0; i < getProduct.groupElement.length; i++) {
      unitDropDownList.add(getProduct.groupElement[i].ed_izm.toString());
    }

    Map<String, String> unitMap = {};
    var index = 0;
    for (var element in getUnit.unitList) {
      unitMap["name: " + '${index}'] = element.name;
      index++;
    }

    if (unitMap.containsValue(widget.element.ed_izm)) {
      unitTypeContraller.text = widget.element.ed_izm!;
    } else {
      unitTypeContraller.text = "notSelected".tr();
    }

//Packag for Category Type changes Detect
    for (int i = 0; i < getProduct.groupElement.length; i++) {
      categoryTypeDropDownList
          .add(getProduct.groupElement[i].kat_tov.toString());
    }

    Map<String, String> categoryMap = {};
    var index1 = 0;
    for (var element in getCategoryType.categoryTypeList) {
      categoryMap["name: " + '${index1}'] = element.name;
      index1++;
    }

    if (categoryMap.containsValue(widget.element.kat_tov)) {
      categoryTypeContraller.text = widget.element.kat_tov!;
    } else {
      categoryTypeContraller.text = "notSelected".tr();
    }

    super.initState();

    //Dropdown logic for main Group
    mainGroupList = [
      for (int i = 0; i < getProduct.productsCategoryList.length; i++)
        DropdownMenuItem(
            value: getProduct.productsCategoryList[i].guid,
            child: MiddleText(
              text: getProduct.productsCategoryList[i].caption,
              size: Dimensions.font16,
            )),
    ];

//Main Group Check

    //Dropdown logic for unit List

    //Check Boxe state logic
    //Product Status
    if (widget.element.status == true) {
      statusContraller = true;
      statusChecked = true;
    } else {
      statusContraller = false;
      statusChecked = false;
    }

    //Status TopProduct
    if (widget.element.top == true) {
      topProductContraller = true;
      topProductChecked = true;
    } else {
      topProductContraller = false;
      topProductChecked = false;
    }

    //ProznakSk Check
    if (widget.element.priznak_sk == 1) {
      priznakSkContraller = 1;
      priznak_sk_checked = true;
    } else {
      priznakSkContraller = 0;
      priznak_sk_checked = false;
    }
    if (widget.element.excise == true) {
      exciseContraller = true;
      excisechecked = true;
    } else {
      exciseContraller = false;
      excisechecked = false;
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
          text: widget.element.name.toString(),
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
                              controller: productCodContraller,
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
                                          fontSize: Dimensions.font16),
                                      children: [
                                        TextSpan(
                                            text: 'productCode'.tr(),
                                            style: TextStyle(
                                                color: AppColors.appLightBlack,
                                                fontSize: Dimensions.font16))
                                      ]),
                                ),
                                labelStyle: TextStyle(
                                    fontSize: Dimensions.font16,
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
                              keyboardType: TextInputType.number,
                              readOnly: false,
                              controller: barCodContraller,
                              style: const TextStyle(
                                  color: AppColors.appLightBlack),
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                    onPressed:(){},
                                   // _showBarcodeScanner,
                                    icon: CustomIcons.barcode),
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
                                          text: '* ',
                                          style: TextStyle(
                                              color: AppColors.appCoral,
                                              fontSize: Dimensions.font16),
                                          children: [
                                            TextSpan(
                                                text: 'barcode'.tr(),
                                                style: TextStyle(
                                                  fontSize: Dimensions.font16,
                                                  color:
                                                      AppColors.appLightBlack,
                                                )),
                                          ]),
                                    ),
                                  ],
                                ),
                                labelStyle: TextStyle(
                                    color: AppColors.appLightBlack,
                                    fontSize: Dimensions.font16),
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
                              controller: groupBarCodContraller,
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
                                      text: '* ',
                                      style: TextStyle(
                                        fontSize: Dimensions.font16,
                                        color: AppColors.appCoral,
                                      ),
                                      children: [
                                        TextSpan(
                                            text: 'groupBarcode'.tr(),
                                            style: TextStyle(
                                              fontSize: Dimensions.font16,
                                              color: AppColors.appLightBlack,
                                            ))
                                      ]),
                                ),
                                labelStyle: TextStyle(
                                    color: AppColors.appLightBlack,
                                    fontSize: Dimensions.font16),
                              ),
                            ),
                          ),
                        ])),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: paddingHorizontal,
                        vertical: paddingVertical),
                    child: DropdownButtonFormField(
                        iconEnabledColor: AppColors.appCoral,
                        decoration: InputDecoration(
                          border: const UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.appLightBlack),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: AppColors.appPurple),
                          ),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.appLightBlack),
                          ),
                          label: RichText(
                            text: TextSpan(
                                text: '',
                                style: TextStyle(
                                    color: AppColors.appCoral,
                                    fontSize: Dimensions.font16),
                                children: [
                                  TextSpan(
                                      text: 'mainCategory'.tr(),
                                      style: TextStyle(
                                        fontSize: Dimensions.font16,
                                        color: AppColors.appLightBlack,
                                      ))
                                ]),
                          ),
                          labelStyle: TextStyle(
                              color: AppColors.appLightBlack,
                              fontSize: Dimensions.font16),
                        ),
                        value: mainGroupContraller.text,
                        onChanged: (String? newValue) {
                          setState(() {
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
                                        SimpleDialog(
                                          title: MiddleText(
                                            text:
                                                "${'areYouSureToChangeCategory'.tr()} ?",
                                          ),
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                TextButton(
                                                    onPressed: () async {
                                                      startLoad(setState);

                                                      mainGroupContraller.text =
                                                          newValue!;
                                                      endLoad(setState);
                                                      if (closeTab != false) {
                                                        router.pop();
                                                      } else {
                                                        setState(() {
                                                          closeTab = true;
                                                        });
                                                      }
                                                    },
                                                    child: isLoading
                                                        ? const CircularProgressIndicator(
                                                            color: AppColors
                                                                .appCoral,
                                                          )
                                                        : MiddleText(
                                                            text: 'yes'.tr(),
                                                            color: AppColors
                                                                .appCoral,
                                                          )),
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: MiddleText(
                                                    text: 'cancle'.tr(),
                                                    color: AppColors.appCoral,
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        )
                                      ],
                                    );
                                  },
                                );
                              },
                            );
                          });
                        },
                        items: mainGroupList)),
                //Product Name
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: paddingHorizontal,
                        vertical: paddingVertical),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: TextFormField(
                              readOnly: false,
                              controller: mainNameContraller,
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
                                      text: '* ',
                                      style: TextStyle(
                                        fontSize: Dimensions.font16,
                                        color: AppColors.appCoral,
                                      ),
                                      children: [
                                        TextSpan(
                                            text: 'productName'.tr(),
                                            style: TextStyle(
                                              fontSize: Dimensions.font16,
                                              color: AppColors.appLightBlack,
                                            ))
                                      ]),
                                ),
                                labelStyle: TextStyle(
                                    color: AppColors.appLightBlack,
                                    fontSize: Dimensions.font16),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: Dimensions.width15,
                          ),

                          //Product Alt Name
                          Expanded(
                            child: TextFormField(
                              onTap: () {
                                if (altNameContraller.text == '') {
                                  setState(() {
                                    altNameContraller.text =
                                        mainNameContraller.text;
                                  });
                                }
                              },
                              readOnly: false,
                              controller: altNameContraller,
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
                                      text: '* ',
                                      style: TextStyle(
                                          color: AppColors.appCoral,
                                          fontSize: Dimensions.font16),
                                      children: [
                                        TextSpan(
                                            text: 'productAltName'.tr(),
                                            style: TextStyle(
                                              fontSize: Dimensions.font16,
                                              color: AppColors.appLightBlack,
                                            ))
                                      ]),
                                ),
                                labelStyle: TextStyle(
                                    color: AppColors.appLightBlack,
                                    fontSize: Dimensions.font16),
                              ),
                            ),
                          )
                        ])),
                //Category Type DropDown
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: paddingHorizontal, vertical: paddingVertical),
                  child: Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                              width: 1.0, color: AppColors.appLightBlack),
                        ),
                      ),
                      child: Column(
                        children: [
                          PopupMenuButton(

                              // add icon, by default "3 dot" icon
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                        text: '* ',
                                        style: TextStyle(
                                            color: AppColors.appCoral,
                                            fontSize: Dimensions.font12),
                                        children: [
                                          TextSpan(
                                              text: 'categoryType'.tr(),
                                              style: TextStyle(
                                                fontSize: Dimensions.font12,
                                                color: AppColors.appLightBlack,
                                              ))
                                        ]),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(categoryTypeContraller.text),
                                      CustomIcons.arrowDropDown,
                                    ],
                                  ),
                                ],
                              ),
                              itemBuilder: (context) {
                                return [
                                  for (int i = 0;
                                      i <
                                          getCategoryType
                                              .categoryTypeList.length;
                                      i++)
                                    PopupMenuItem<int>(
                                        value: i,
                                        child: MiddleText(
                                            text: getCategoryType
                                                .categoryTypeList[i].name)),
                                ];
                              },
                              onSelected: (value) {
                                for (int i = 0;
                                    i < getCategoryType.categoryTypeList.length;
                                    i++) {
                                  if (value == i) {
                                    setState(() {
                                      categoryTypeContraller.text =
                                          getCategoryType
                                              .categoryTypeList[i].name;
                                    });
                                  }
                                }
                              }),
                          const SizedBox(
                            height: 5,
                          )
                        ],
                      )),
                ),

                //Prices
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: paddingHorizontal,
                        vertical: paddingVertical),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //retail price
                          Expanded(
                            child: TextFormField(
                              readOnly: false,
                              onTap: () {
                                if (o_r_priceContraller.text == '0.0') {
                                  o_r_priceContraller.clear();
                                }
                              },
                              keyboardType: TextInputType.number,
                              controller: o_r_priceContraller,
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
                                      text: ' ',
                                      style: TextStyle(
                                        fontSize: Dimensions.font16,
                                        color: AppColors.appCoral,
                                      ),
                                      children: [
                                        TextSpan(
                                            text: 'retailPrice'.tr(),
                                            style: TextStyle(
                                                color: AppColors.appLightBlack,
                                                fontSize: Dimensions.font16))
                                      ]),
                                ),
                                labelStyle: TextStyle(
                                    color: AppColors.appLightBlack,
                                    fontSize: Dimensions.font16),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: Dimensions.width15,
                          ),
                          //wholl price
                          Expanded(
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              onTap: () {
                                if (o_o_priceContraller.text == '0.0') {
                                  o_o_priceContraller.clear();
                                }
                              },
                              readOnly: false,
                              controller: o_o_priceContraller,
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
                                          color: AppColors.appCoral,
                                          fontSize: Dimensions.font16),
                                      children: [
                                        TextSpan(
                                            text: 'wholesalePrice'.tr(),
                                            style: TextStyle(
                                              fontSize: Dimensions.font16,
                                              color: AppColors.appLightBlack,
                                            ))
                                      ]),
                                ),
                                labelStyle: TextStyle(
                                    color: AppColors.appLightBlack,
                                    fontSize: Dimensions.font16),
                              ),
                            ),
                          ),
                        ])),
                //Adg and unit
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: paddingHorizontal,
                        vertical: paddingVertical),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //retail price
                          Expanded(
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              readOnly: false,
                              controller: adgCodeContraller,
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
                                      text: ' ',
                                      style: TextStyle(
                                        fontSize: Dimensions.font16,
                                        color: AppColors.appCoral,
                                      ),
                                      children: [
                                        TextSpan(
                                            text: 'adgCode'.tr(),
                                            style: TextStyle(
                                                color: AppColors.appLightBlack,
                                                fontSize: Dimensions.font16))
                                      ]),
                                ),
                                labelStyle: TextStyle(
                                    color: AppColors.appLightBlack,
                                    fontSize: Dimensions.font16),
                              ),
                            ),
                          ),

                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                        width: 1.0,
                                        color: AppColors.appLightBlack),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    PopupMenuButton(

                                        // add icon, by default "3 dot" icon
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            RichText(
                                              text: TextSpan(
                                                  text: '* ',
                                                  style: TextStyle(
                                                      color: AppColors.appCoral,
                                                      fontSize:
                                                          Dimensions.font12),
                                                  children: [
                                                    TextSpan(
                                                        text: 'unit'.tr(),
                                                        style: TextStyle(
                                                          fontSize:
                                                              Dimensions.font12,
                                                          color: AppColors
                                                              .appLightBlack,
                                                        ))
                                                  ]),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(unitTypeContraller.text),
                                                CustomIcons.arrowDropDown,
                                              ],
                                            ),
                                          ],
                                        ),
                                        itemBuilder: (context) {
                                          return [
                                            for (int i = 0;
                                                i < getUnit.unitList.length;
                                                i++)
                                              PopupMenuItem<int>(
                                                  value: i,
                                                  child: MiddleText(
                                                      text: getUnit
                                                          .unitList[i].name)),
                                          ];
                                        },
                                        onSelected: (value) {
                                          for (int i = 0;
                                              i < getUnit.unitList.length;
                                              i++) {
                                            if (value == i) {
                                              setState(() {
                                                unitTypeContraller.text =
                                                    getUnit.unitList[i].name;
                                              });
                                            }
                                          }
                                        }),
                                    const SizedBox(
                                      height: 5,
                                    )
                                  ],
                                )),
                          ),
                        ])),
                //Description
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: paddingHorizontal, vertical: paddingVertical),
                  child: TextFormField(
                    readOnly: false,
                    controller: descriptionContraller,
                    style: const TextStyle(color: AppColors.appBlack),
                    decoration: InputDecoration(
                      border: const UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.appLightBlack),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.appPurple),
                      ),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.appLightBlack),
                      ),
                      label: RichText(
                        text: TextSpan(
                            text: '',
                            style: TextStyle(
                                color: AppColors.appCoral,
                                fontSize: Dimensions.font16),
                            children: [
                              TextSpan(
                                  text: 'description'.tr(),
                                  style: TextStyle(
                                      color: AppColors.appLightBlack,
                                      fontSize: Dimensions.font16))
                            ]),
                      ),
                      labelStyle: TextStyle(
                          color: AppColors.appLightBlack,
                          fontSize: Dimensions.font16),
                    ),
                  ),
                ),

                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BigText(
                          text: "topMenu".tr(),
                        ),
                        Checkbox(
                          checkColor: Colors.white,
                          fillColor:
                              MaterialStateProperty.resolveWith(getColor),
                          value: topProductChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              topProductChecked = value!;
                              if (widget.element.top == true) {
                                topProductContraller = false;
                              } else {
                                topProductContraller = true;
                              }
                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BigText(
                          text: "discounted".tr(),
                        ),
                        Checkbox(
                          checkColor: Colors.white,
                          fillColor:
                              MaterialStateProperty.resolveWith(getColor),
                          value: priznak_sk_checked,
                          onChanged: (bool? value) {
                            setState(() {
                              priznak_sk_checked = value!;
                              if (widget.element.priznak_sk == 1) {
                                priznakSkContraller = 0;
                              } else {
                                priznakSkContraller = 1;
                              }
                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BigText(
                            text: "actived".tr(),
                          ),
                          Checkbox(
                            checkColor: Colors.white,
                            fillColor:
                                MaterialStateProperty.resolveWith(getColor),
                            value: statusChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                statusChecked = value!;
                                if (widget.element.status == true) {
                                  statusContraller = false;
                                } else {
                                  statusContraller = true;
                                }
                              });
                            },
                          ),
                        ]),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BigText(
                            text: "excise".tr(),
                          ),
                          Checkbox(
                            checkColor: Colors.white,
                            fillColor:
                                MaterialStateProperty.resolveWith(getColor),
                            value: excisechecked,
                            onChanged: (bool? value) {
                              setState(() {
                                excisechecked = value!;
                                if (widget.element.excise == true) {
                                  exciseContraller = false;
                                } else {
                                  exciseContraller = true;
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
    if (mainNameContraller.text == '' ||
        altNameContraller.text == '' ||
        barCodContraller.text == '') {
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
    } else if (unitTypeContraller.text == 'notSelected'.tr()) {
      closeTab = false;
      showDialog<bool?>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: MiddleText(
              text: "${"chooseUnitType".tr()}",
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
    } else if (categoryTypeContraller.text == 'notSelected'.tr()) {
      closeTab = false;
      showDialog<bool?>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: MiddleText(
              text: "${"chooseCategoryType".tr()}",
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
      if (o_o_priceContraller.text == '') {
        o_o_priceContraller.text = '0.0';
      }
      if (o_r_priceContraller.text == '') {
        o_r_priceContraller.text = '0.0';
      }

      try {
        await getProducts.postProducts(
            context: context,
            productElementModel: ProductElementModel(
                guid: widget.element.guid,
                top: topProductContraller,
                price_o_o: double.parse(o_o_priceContraller.text),
                price_o_r: double.parse(o_r_priceContraller.text),
                name: mainNameContraller.text,
                gguid: mainGroupContraller.text,
                linkfoto: "",
                kat_tov: categoryTypeContraller.text,
                kod_tov: productCodContraller.text,
                description: descriptionContraller.text,
                ed_izm: unitTypeContraller.text,
                barcode: barCodContraller.text,
                barcode_grupp: groupBarCodContraller.text == ''
                    ? barCodContraller.text
                    : groupBarCodContraller.text,
                priznak_sk: priznakSkContraller,
                adg: adgCodeContraller.text,
                kname: altNameContraller.text,
                komplekt_id: 0,
                status: statusContraller,
                excise: exciseContraller));

        getProducts.groupElement.clear();

        await getProduct.groupingProduct(
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

//BarcodeScaner Function
  _showBarcodeScanner() {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (builder) {
        return StatefulBuilder(builder: (BuildContext context, setState) {
          return SizedBox(
              height: MediaQuery.of(context).size.height / 2,
              child: Scaffold(
                appBar: _buildBarcodeScannerAppBar(),
                body: _buildBarcodeScannerBody(),
              ));
        });
      },
    );
  }

//Barcode Scanner App Bar
  AppBar _buildBarcodeScannerAppBar() {
    return AppBar(
      bottom: PreferredSize(
        child: Container(color: AppColors.appPurple, height: 4.0),
        preferredSize: const Size.fromHeight(4.0),
      ),
      title: MiddleText(
        text: 'ScanYourBarcode',
        color: AppColors.appWhite,
      ),
      elevation: 0.0,
      backgroundColor: const Color(0xFF333333),
      automaticallyImplyLeading: false,
      leading: GestureDetector(
        onTap: () async {
          controller.pause;
          await router.pop();
        },
        child: const Center(
            child: Icon(
          Icons.arrow_back,
          color: Colors.white,
        )),
      ),
      actions: [
        Row(
          children: [
            SingleChildScrollView(
              child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(right: 16.0),
                  child: const Icon(Icons.flashlight_on)),
            ),
          ],
        )
      ],
    );
  }

//Barcode Scanner Body
  Widget _buildBarcodeScannerBody() {
    return SizedBox(
      height: 400,
      child: ScanView(
        controller: controller,
        scanAreaScale: .7,
        scanLineColor: AppColors.appCoral,
        onCapture: (data) async {
          setState(() {
            barCodContraller.text = data;
            groupBarCodContraller.text = data;
          });
          controller.pause;
          await router.pop();
        },
      ),
    );
  }
}
