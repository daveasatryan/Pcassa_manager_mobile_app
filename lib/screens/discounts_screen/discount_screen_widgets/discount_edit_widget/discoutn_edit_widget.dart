import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pcassa_retail/constants/app_themes/app_icons/app_icons.dart';
import 'package:pcassa_retail/constants/dimensions/dimensions.dart';
import 'package:pcassa_retail/constants/paddings_constants/padding_constants.dart';
import 'package:pcassa_retail/widgets/big_text.dart';
import 'package:pcassa_retail/widgets/middle_text.dart';

import '../../../../constants/app_themes/app_colors/app_colors.dart';
import '../../../../error_handler/error_handler.dart';
import '../../../../router/services.dart';
import '../../../../store/discount_state/discount_state.dart';

class DiscountEditWidget extends StatefulWidget {
  const DiscountEditWidget({
    Key? key,
    required this.id_d,
    required this.status,
    required this.name,
    required this.type,
    required this.value,
    required this.id,
  }) : super(key: key);
  final id_d;
  final name;
  final value;
  final type;
  final id;
  final status;
  @override
  State<DiscountEditWidget> createState() => _DiscountEditWidgetState();
}

class _DiscountEditWidgetState extends State<DiscountEditWidget> {
//TextContrallers
  var nameContraller = TextEditingController();
  var typeContraller = TextEditingController();
  var valueContraller = TextEditingController();
  //Status Contraller
  var _statusController;

//Get discountInfo State
  final getDiscount = GetIt.I<CreatedDiscounts>();

  //isChecked
  bool? isChecked;

  //TextContraller Initialization
  @override
  void initState() {
    super.initState();
    nameContraller.text = widget.name;
    valueContraller.text = widget.value.toString();
    typeContraller.text = widget.type;

    if (widget.status == 1) {
      _statusController = 1;
      isChecked = true;
    } else {
      _statusController = 0;
      isChecked = false;
    }
  }

  //discountType
  List<DropdownMenuItem<String>> typeOfDiscount = [
    DropdownMenuItem(value: "%", child: MiddleText(text: "%".tr())),
    DropdownMenuItem(value: "+", child: MiddleText(text: "summary".tr())),
  ];

//is Loading check

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
        title: Text(widget.name),
        actions: [
          TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(AppColors.appPurple),
            ),
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
            width: Dimensions.width15,
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
                                        fontSize: Dimensions.font16),
                                    children: [
                                      TextSpan(
                                          text: 'nameOfDiscount'.tr(),
                                          style: TextStyle(
                                              color: AppColors.appLightBlack,
                                              fontSize: Dimensions.font16))
                                    ]),
                              ),
                              labelStyle: TextStyle(
                                  color: AppColors.appLightBlack,
                                  fontSize: Dimensions.font16),
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
                                          fontSize: Dimensions.font16),
                                      children: [
                                        TextSpan(
                                            text: 'typeOfDiscount'.tr(),
                                            style: TextStyle(
                                                color: AppColors.appLightBlack,
                                                fontSize: Dimensions.font16))
                                      ]),
                                ),
                                labelStyle: TextStyle(
                                    color: AppColors.appLightBlack,
                                    fontSize: Dimensions.font16),
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
                                        fontSize: Dimensions.font16),
                                    children: [
                                      TextSpan(
                                          text: 'valueOfDiscount'.tr(),
                                          style: TextStyle(
                                              color: AppColors.appLightBlack,
                                              fontSize: Dimensions.font16))
                                    ]),
                              ),
                              labelStyle: TextStyle(
                                  color: AppColors.appLightBlack,
                                  fontSize: Dimensions.font16),
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
                                    if (widget.status == 1) {
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
              text: "cardIsNotfull".tr(),
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
            id: widget.id,
            id_d: widget.id_d,
            name: nameContraller.text,
            rejim: '-',
            status: _statusController,
            tip: typeContraller.text,
            val: valueContraller.text);
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
