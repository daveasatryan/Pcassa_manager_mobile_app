// ignore_for_file: prefer_typing_uninitialized_variables, non_constant_identifier_names, unused_field

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

class CurrencyEdit extends StatefulWidget {
  const CurrencyEdit({
    Key? key,
    required this.guid,
    required this.cod,
    required this.gguid,
    required this.name,
    required this.short_name,
    required this.tip,
    required this.tip_oplati,
    required this.b_valyuta,
    required this.status,
    required this.spisanie,
    required this.method_round,
  }) : super(key: key);
  final guid;
  final cod;
  final gguid;
  final name;
  final short_name;
  final tip;
  final tip_oplati;
  final b_valyuta;
  final status;
  final spisanie;
  final method_round;
  @override
  State<CurrencyEdit> createState() => _CurrencyEditState();
}

class _CurrencyEditState extends State<CurrencyEdit> {
  final currencyState = GetIt.I<CreatedCurrencys>();

  //Text Contraller defination

  var nameContraller = TextEditingController();
  var shortNameContraller = TextEditingController();
  var methodRoundContraller = TextEditingController();
  var typeContraller = TextEditingController();

  //CheckBox Contrallers defination
  var _statusController;
  var _spisanieController;
  var _b_valyutaController;
  var _tipOplatiController;

  //Status Checked
  bool? statusChecked;
  bool? tipOplatiChecked;
  bool? spisanieChecked;
  bool? b_valyutaChecked;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    nameContraller.text = widget.name;
    shortNameContraller.text = widget.short_name;
    methodRoundContraller.text = widget.method_round;
    typeContraller.text = widget.tip.toString();

    //Status Control
    if (widget.status == 1) {
      _statusController = 1;
      statusChecked = true;
    } else {
      _statusController = 0;
      statusChecked = false;
    }

    //Payment Type Control
    if (widget.tip_oplati == 1) {
      _tipOplatiController = 1;
      tipOplatiChecked = true;
    } else {
      _tipOplatiController = 0;
      tipOplatiChecked = false;
    }

    //Minus Type Control
    if (widget.spisanie == 1) {
      _spisanieController = 1;
      spisanieChecked = true;
    } else {
      _spisanieController = 0;
      spisanieChecked = false;
    }

    //Base Currency Type Control
    if (widget.b_valyuta == 1) {
      _b_valyutaController = 1;
      b_valyutaChecked = true;
    } else {
      _b_valyutaController = 0;
      b_valyutaChecked = false;
    }
  }

  //Payment Type tems
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
          backgroundColor: AppColors.appPurple,
          title: MiddleText(
            text: widget.name,
            color: AppColors.appWhite,
          ),
          actions: [
            TextButton(
              onPressed: onCurrencySave,
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
                                        fontSize: Dimensions.font16),
                                    children: [
                                      TextSpan(
                                          text: 'nameOfCurrency'.tr(),
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
                                        fontSize: Dimensions.font16),
                                    children: [
                                      TextSpan(
                                          text: 'shortNameOfCurrency'.tr(),
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
                                            text: 'typeOfCurrency'.tr(),
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
                              items: typeItems)),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: paddingHorizontal,
                              vertical: paddingVertical),
                          child: TextFormField(
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
                                    text: '* ',
                                    style: TextStyle(
                                        color: AppColors.appCoral,
                                        fontSize: Dimensions.font16),
                                    children: [
                                      TextSpan(
                                          text: 'methodRound'.tr(),
                                          style: TextStyle(
                                              color: AppColors.appLightBlack,
                                              fontSize: Dimensions.font16))
                                    ]),
                              ),
                              labelStyle: TextStyle(
                                  color: AppColors.appLightBlack,
                                  fontSize: Dimensions.font16),
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
                                      if (widget.spisanie == 1) {
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
                                      if (widget.b_valyuta == 1) {
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
                                      if (widget.tip_oplati == 1) {
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
                                      if (widget.status == 1) {
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

  onCurrencySave() async {
    if (nameContraller.text == '' ||
        shortNameContraller.text == '' ||
        typeContraller.text == '') {
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
      methodRoundContraller.text == '';
      setState(() {
        methodRoundContraller.text = 0.0.toString();
      });
      setState(() {
        isLoading = true;
      });
      try {
        await currencyState.updateCurencys(
          cod: widget.cod,
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
