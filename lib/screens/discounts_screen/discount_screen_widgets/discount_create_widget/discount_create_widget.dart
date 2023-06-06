import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pcassa_retail/constants/dimensions/dimensions.dart';
import 'package:pcassa_retail/constants/paddings_constants/padding_constants.dart';
import 'package:pcassa_retail/widgets/middle_text.dart';

import '../../../../constants/app_themes/app_colors/app_colors.dart';
import '../../../../constants/app_themes/app_icons/app_icons.dart';
import '../../../../error_handler/error_handler.dart';
import '../../../../router/services.dart';
import '../../../../store/discount_state/discount_state.dart';
import '../../../../widgets/big_text.dart';

class DiscountCreateWidget extends StatefulWidget {
  const DiscountCreateWidget({Key? key, required this.id_d}) : super(key: key);
  final id_d;
  @override
  State<DiscountCreateWidget> createState() => _DiscountCreateWidgetState();
}

class _DiscountCreateWidgetState extends State<DiscountCreateWidget> {
//Get discountInfo State
  final getDiscount = GetIt.I<CreatedDiscounts>();

//Contrallers defination
  var nameContraller = TextEditingController();
  var typeContraller = TextEditingController();
  var valueContraller = TextEditingController();

  var _statusController;

  var status = 1;

  bool isChecked = false;
  @override
  void initState() {
    nameContraller.text = '';
    valueContraller.text = '';
    typeContraller.text = "%";

    super.initState();
    if (status == 1) {
      _statusController = 1;
      isChecked = true;
    } else {
      _statusController = 0;
      isChecked = false;
    }
  }

  List<DropdownMenuItem<String>> typeOfDiscount = [
    DropdownMenuItem(value: "%", child: MiddleText(text: "%")),
    DropdownMenuItem(value: "+", child: MiddleText(text: "summary".tr())),
  ];

  String selectedValue = "%";
  bool isLoading = false;

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
        backgroundColor: AppColors.appPurple,
        title: MiddleText(
          text: 'newDiscount'.tr(),
          color: AppColors.appWhite,
        ),
        actions: [
          TextButton(
            onPressed: onDiscountSave,
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
            width: Dimensions.height10,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, paddingTop, 0, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(paddingAll),
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.circular(Dimensions.borderRadius10),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(143, 148, 251, .2),
                            blurRadius: Dimensions.borderRadius10 * 2,
                            offset: Offset(0, 10))
                      ]),
                  child: Column(
                    children: [
                      //name data
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: paddingHorizontal,
                              vertical: paddingVertical),
                          child: TextFormField(
                            controller: nameContraller,
                            style: const TextStyle(color: AppColors.appBlack),
                            decoration: InputDecoration(
                              border: const UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppColors.appPurple),
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppColors.appPurple),
                              ),
                              enabledBorder: const UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppColors.appLightBlack),
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
                                          text: 'nameOfDiscount'.tr(),
                                          style: TextStyle(
                                            color: AppColors.appLightBlack,
                                            fontSize: Dimensions.font16,
                                          ))
                                    ]),
                              ),
                              labelStyle: TextStyle(
                                color: AppColors.appLightBlack,
                                fontSize: Dimensions.font16,
                              ),
                            ),
                          )),

                      //typeData get
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: paddingHorizontal,
                              vertical: paddingVertical),
                          child: DropdownButtonFormField(
                              iconEnabledColor: AppColors.appCoral,
                              decoration: InputDecoration(
                                border: const UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColors.appPurple),
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
                                        fontSize: Dimensions.font16,
                                      ),
                                      children: [
                                        TextSpan(
                                            text: 'typeOfDiscount'.tr(),
                                            style: TextStyle(
                                              color: AppColors.appLightBlack,
                                              fontSize: Dimensions.font16,
                                            ))
                                      ]),
                                ),
                                labelStyle: TextStyle(
                                  color: AppColors.appLightBlack,
                                  fontSize: Dimensions.font16,
                                ),
                              ),
                              value: typeContraller.text,
                              onChanged: (String? newValue) {
                                setState(() {
                                  typeContraller.text = newValue!;
                                });
                              },
                              items: typeOfDiscount)),

                      //ValueData get
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: paddingHorizontal,
                              vertical: paddingVertical),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller: valueContraller,
                            style: const TextStyle(color: AppColors.appBlack),
                            decoration: InputDecoration(
                              border: const UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppColors.appPurple),
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppColors.appPurple),
                              ),
                              enabledBorder: const UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppColors.appLightBlack),
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
                                          text: 'valueOfDiscount'.tr(),
                                          style: TextStyle(
                                            color: AppColors.appLightBlack,
                                            fontSize: Dimensions.font16,
                                          ))
                                    ]),
                              ),
                              labelStyle: TextStyle(
                                color: AppColors.appLightBlack,
                                fontSize: Dimensions.font16,
                              ),
                            ),
                          )),

                      const SizedBox(
                        height: 40,
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: paddingHorizontal,
                              vertical: paddingVertical),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              BigText(
                                text: "actived".tr(),
                              ),
                              Checkbox(
                                checkColor: Colors.white,
                                fillColor:
                                    MaterialStateProperty.resolveWith(getColor),
                                value: isChecked,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isChecked = value!;
                                    if (status == 1) {
                                      _statusController = 0;
                                    } else {
                                      _statusController = 1;
                                    }
                                  });
                                },
                              ),
                            ],
                          ))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  onDiscountSave() async {
    if (valueContraller.text == '' || nameContraller.text == '') {
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
                onPressed: router.pop,
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

      try {
        await getDiscount.saveDiscounts(
            id: 0,
            id_d: getDiscount.discountInfo.first.id,
            name: nameContraller.text,
            tip: typeContraller.text,
            val: valueContraller.text,
            status: _statusController,
            rejim: '-');
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

      setState(() {
        isLoading = false;
        Navigator.pop(context);
      });
    }
  }
}
