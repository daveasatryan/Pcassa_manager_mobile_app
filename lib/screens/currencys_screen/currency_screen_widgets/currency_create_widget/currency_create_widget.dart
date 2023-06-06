// ignore_for_file: unrelated_type_equality_checks, non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pcassa_retail/constants/app_themes/app_icons/app_icons.dart';
import 'package:pcassa_retail/constants/dimensions/dimensions.dart';
import 'package:pcassa_retail/constants/paddings_constants/padding_constants.dart';
import 'package:pcassa_retail/widgets/big_text.dart';

import '../../../../constants/app_themes/app_colors/app_colors.dart';
import '../../../../error_handler/error_handler.dart';
import '../../../../router/services.dart';
import '../../../../store/currency_state/currency_state.dart';
import '../../../../widgets/middle_text.dart';

class CreateCurrency extends StatefulWidget {
  const CreateCurrency({
    Key? key,
    required this.guid,
  }) : super(key: key);
  final guid;

  @override
  State<CreateCurrency> createState() => _CreateCurrencyState();
}

class _CreateCurrencyState extends State<CreateCurrency> {
  final currencyState = GetIt.I<CreatedCurrencys>();
  //Contraller Defination
  var nameContraller = TextEditingController();
  var shortNameContraller = TextEditingController();
  var methodRoundContraller = TextEditingController();
  var typeContraller = TextEditingController();

  //StatusContrallers Initilaization
  var _statusController = 1;
  var _spisanieController = 0;
  var _b_valyutaController = 0;
  var _tipOplatiController = 0;

  //Statuss Checked
  bool? statusChecked;
  bool? tipOplatiChecked;
  bool? spisanieChecked;
  bool? b_valyutaChecked;
  bool isLoading = false;

  //Contrallers Initilaization
  @override
  void initState() {
    super.initState();
    nameContraller.text = "";
    shortNameContraller.text = "";
    methodRoundContraller.text = "0.0";
    typeContraller.text = '0';

    //Statuss initializations in SetState
    if (_statusController == 1) {
      _statusController = 1;
      statusChecked = true;
    } else {
      _statusController = 0;
      statusChecked = false;
    }

    if (_tipOplatiController == 1) {
      _tipOplatiController = 1;
      tipOplatiChecked = true;
    } else {
      _tipOplatiController = 0;
      tipOplatiChecked = false;
    }

    if (_spisanieController == 1) {
      _spisanieController = 1;
      spisanieChecked = true;
    } else {
      _spisanieController = 0;
      spisanieChecked = false;
    }

    if (_tipOplatiController == 1) {
      _b_valyutaController = 1;
      b_valyutaChecked = true;
    } else {
      _b_valyutaController = 0;
      b_valyutaChecked = false;
    }
  }

  List<DropdownMenuItem<String>> typeItems = [
    DropdownMenuItem(value: "1", child: MiddleText(text: "cashless".tr())),
    DropdownMenuItem(value: "2", child: MiddleText(text: "debt".tr())),
    DropdownMenuItem(value: "0", child: MiddleText(text: "cash".tr())),
  ];

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
            text: "newCurrency".tr(),
            color: AppColors.appWhite,
          ),
          backgroundColor: AppColors.appPurple,
          actions: [
            TextButton(
              onPressed: onCurencyCreate,
              child: isLoading
                  ? const CircularProgressIndicator(
                      color: AppColors.appWhite,
                    )
                  : MiddleText(
                      text: "save".tr(),
                      color: AppColors.appWhite,
                    ),
            ),
            const SizedBox(
              width: 16,
            )
          ]),
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
                                          text: 'nameOfCurrency'.tr(),
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
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: paddingHorizontal,
                              vertical: paddingVertical),
                          child: TextFormField(
                            controller: shortNameContraller,
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
                                          text: 'shortNameOfCurrency'.tr(),
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
                                            text: 'typeOfCurrency'.tr(),
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
                              items: typeItems)),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: paddingHorizontal,
                              vertical: paddingVertical),
                          child: TextFormField(
                            onTap: () {
                              methodRoundContraller.text = '0';
                            },
                            keyboardType: TextInputType.number,
                            controller: methodRoundContraller,
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
                                    text: '',
                                    style: TextStyle(
                                      color: AppColors.appCoral,
                                      fontSize: Dimensions.font16,
                                    ),
                                    children: [
                                      TextSpan(
                                          text: 'methodRound'.tr(),
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
                            onSaved: (String? value) {},
                          )),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                BigText(
                                  text: "selfCurrency".tr(),
                                ),
                                Checkbox(
                                  checkColor: Colors.white,
                                  fillColor: MaterialStateProperty.resolveWith(
                                      getColor),
                                  value: spisanieChecked,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      spisanieChecked = value!;
                                      if (spisanieChecked == 1) {
                                        _spisanieController = 0;
                                      } else {
                                        _spisanieController = 1;
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
                                  text: "mainCurrency".tr(),
                                ),
                                Checkbox(
                                  checkColor: Colors.white,
                                  fillColor: MaterialStateProperty.resolveWith(
                                      getColor),
                                  value: b_valyutaChecked,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      b_valyutaChecked = value!;
                                      if (b_valyutaChecked == 1) {
                                        _b_valyutaController = 0;
                                      } else {
                                        _b_valyutaController = 1;
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
                                  text: "fiscal".tr(),
                                ),
                                Checkbox(
                                  checkColor: Colors.white,
                                  fillColor: MaterialStateProperty.resolveWith(
                                      getColor),
                                  value: tipOplatiChecked,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      tipOplatiChecked = value!;
                                      if (tipOplatiChecked == 1) {
                                        _tipOplatiController = 0;
                                      } else {
                                        _tipOplatiController = 1;
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
                                  fillColor: MaterialStateProperty.resolveWith(
                                      getColor),
                                  value: statusChecked,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      statusChecked = value!;
                                      if (statusChecked == 1) {
                                        _statusController = 0;
                                      } else {
                                        _statusController = 1;
                                      }
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
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

  onCurencyCreate() async {
    if (nameContraller.text == '' ||
        shortNameContraller.text == '' ||
        typeContraller.text == '') {
      showDialog<bool?>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: MiddleText(
              text: "card is not full".tr(),
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
      methodRoundContraller.text == '';
      setState(() {
        methodRoundContraller.text = 0.0.toString();
      });
      setState(() {
        isLoading = true;
      });
      if (methodRoundContraller.text == '') {
        methodRoundContraller.text = '0';
      }
      try {
        await currencyState.updateCurencys(
          cod: 0,
          gguid: widget.guid,
          name: nameContraller.text,
          short_name: shortNameContraller.text,
          tip: int.parse(typeContraller.text),
          tip_oplati: _tipOplatiController,
          b_valyuta: _b_valyutaController,
          status: _statusController,
          spisanie: _spisanieController,
          method_round: double.parse(methodRoundContraller.text),
        );
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
