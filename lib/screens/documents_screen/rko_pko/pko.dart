import 'package:dio/dio.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pcassa_retail/constants/paddings_constants/padding_constants.dart';
import 'package:pcassa_retail/error_handler/error_handler.dart';
import 'package:pcassa_retail/models/cashorders/cash_order_model.dart';
import 'package:pcassa_retail/router/router.gr.dart';
import 'package:pcassa_retail/router/services.dart';
import 'package:pcassa_retail/widgets/big_text.dart';
import 'package:pcassa_retail/widgets/small_text_widget.dart';

import '../../../constants/app_themes/app_colors/app_colors.dart';
import '../../../constants/dimensions/dimensions.dart';
import '../../../store/cash_order_state/cash_order_state.dart';
import '../../../store/contragent_state/contragent_state.dart';
import '../../../store/currency_state/currency_state.dart';
import '../../../store/station_type_state/station_type_state.dart';
import '../../../widgets/app_icons.dart';
import '../../../widgets/middle_text.dart';
import '../../../widgets/text_form_field.dart';

class IncomingCashOreder extends StatefulWidget {
  IncomingCashOreder({Key? key, required this.justClose}) : super(key: key);
  bool justClose;
  @override
  State<IncomingCashOreder> createState() => _IncomingCashOrederState();
}

class _IncomingCashOrederState extends State<IncomingCashOreder> {
  var contragentState = GetIt.I<ContragentState>();
  var currencyState = GetIt.I<CreatedCurrencys>();
  final stationType = GetIt.I<StationTypeState>();
  final cashOrderState = GetIt.I<CashOrderState>();
  var documentNumberContraller = TextEditingController();
  var descriptionContraller = TextEditingController();
  var firstDatacontraller = TextEditingController();

  var summaContraller = TextEditingController();

  String? stationContraller;

  String? currencyContraller;
  String? contragentContraller;
  int? idContraller;
  int? statusCheck;
  bool? statusChecked;
  bool isLoading = true;
  int? contragentCode;
  int? stationTypeCod;
  var statusContraller;
  DateTime? pickedDate1;

  DateTime? pickedDate2;
  @override
  void initState() {
    super.initState();
    print(stationType.stationTypeNameList);
    //Contraller initialisation
    idContraller = cashOrderState.resultCashOrderModel!.id;
    documentNumberContraller.text =
        cashOrderState.resultCashOrderModel!.n_dok.toString();
    firstDatacontraller.text = DateFormat('dd.MM.yyyy').format(
        DateTime.parse(cashOrderState.resultCashOrderModel!.data_d.toString()));
    summaContraller.text =
        cashOrderState.resultCashOrderModel!.summa.toString();
    currencyContraller = cashOrderState.resultCashOrderModel!.val;
    contragentCode = cashOrderState.resultCashOrderModel!.kodpost;
    contragentContraller = cashOrderState.resultCashOrderModel!.namepost;
    stationTypeCod = cashOrderState.resultCashOrderModel!.id_vidkas;
    for (int i = 0; i < stationType.stationTypeList.length; i++) {
      if (cashOrderState.resultCashOrderModel!.id_vidkas ==
          stationType.stationTypeList[i].id) {
        stationContraller = stationType.stationTypeList[i].name;
      }
    }

    descriptionContraller.text =
        cashOrderState.resultCashOrderModel!.prim == "null" ||
                cashOrderState.resultCashOrderModel!.prim == null
            ? ""
            : cashOrderState.resultCashOrderModel!.prim.toString();

    //Status Checking
    if (cashOrderState.resultCashOrderModel!.aktiv == 1) {
      statusContraller = 1;
      statusChecked = true;
    } else {
      statusContraller = 0;
      statusChecked = false;
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

    return Center(
        child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
                padding: const EdgeInsets.all(paddingAll),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                  Dimensions.borderRadius10),
                              boxShadow: const [
                                BoxShadow(
                                    color: Color.fromRGBO(143, 148, 251, .2),
                                    blurRadius: 20.0,
                                    offset: Offset(0, 10))
                              ]),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                //Document number
                                Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: paddingHorizontal,
                                        vertical: paddingVertical),
                                    child: CreateAndEditForm(
                                      textInputType: TextInputType.number,
                                      contraller: documentNumberContraller,
                                      fildName: MiddleText(
                                        text: 'numberOfDocument'.tr(),
                                      ),
                                      requiredFildMark: "* ",
                                    )),
                                SizedBox(
                                  height: Dimensions.height20,
                                ),

                                //First data
                                Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: paddingHorizontal,
                                        vertical: paddingVertical),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: CreateAndEditForm(
                                            onTap: () {
                                              setState(() {
                                                firstDatacontraller.text = "";
                                              });
                                              showFirstDate();
                                            },
                                            textInputType: TextInputType.number,
                                            contraller: firstDatacontraller,
                                            fildName: MiddleText(
                                              text: 'firstDate'.tr(),
                                            ),
                                            requiredFildMark: "* ",
                                            sufixIcon: IconButton(
                                                icon: AppIcons(
                                                  icon: Icons.calendar_month,
                                                  size: Dimensions.iconSize24,
                                                ),
                                                onPressed: () {
                                                  showFirstDate();
                                                }), //icon of text field
                                            //label text of field
                                          ),
                                        ),
                                      ],
                                    )),
                                SizedBox(
                                  height: Dimensions.height20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 0, vertical: paddingVertical),
                                  child: ListTile(
                                    title: Row(
                                      children: [
                                        SmallText(
                                          text: '* ',
                                          color: AppColors.appCoral,
                                        ),
                                        SmallText(
                                          text: 'selectCurrency',
                                          color: AppColors.appLightBlack,
                                        ),
                                      ],
                                    ),
                                    subtitle: DropdownButton2(
                                      isExpanded: true,
                                      itemPadding: EdgeInsets.only(left: 0),
                                      dropdownPadding:
                                          EdgeInsets.only(left: 10),
                                      items: currencyState.currencyShortNames
                                          .map((item) =>
                                              DropdownMenuItem<String>(
                                                value: item,
                                                child: MiddleText(
                                                  text: item,
                                                ),
                                              ))
                                          .toList(),
                                      value: !currencyState.currencyShortNames
                                              .contains(currencyContraller)
                                          ? "notSelected"
                                          : currencyContraller,
                                      onChanged: (value) {
                                        setState(() {
                                          currencyContraller = value.toString();
                                        });
                                      },
                                      icon: AppIcons(
                                        icon: Icons.arrow_drop_down,
                                        size: Dimensions.iconSize24,
                                      ),
                                      buttonPadding: const EdgeInsets.only(
                                          left: 0, right: 0),
                                      dropdownMaxHeight: 200,
                                      scrollbarAlwaysShow: true,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 0, vertical: paddingVertical),
                                  child: ListTile(
                                    title: Row(
                                      children: [
                                        SmallText(
                                          text: '* ',
                                          color: AppColors.appCoral,
                                        ),
                                        SmallText(
                                          text: 'selectContragent',
                                          color: AppColors.appLightBlack,
                                        ),
                                      ],
                                    ),
                                    subtitle: DropdownButton2(
                                      itemPadding: EdgeInsets.only(left: 0),
                                      dropdownPadding:
                                          EdgeInsets.only(left: 10),
                                      isExpanded: true,
                                      items: contragentState.contragentsElements
                                          .map((item) =>
                                              DropdownMenuItem<String>(
                                                value: item.name,
                                                child: MiddleText(
                                                  text: item.name.toString(),
                                                ),
                                              ))
                                          .toList(),
                                      value: contragentContraller,
                                      onChanged: (value) {
                                        setState(() {
                                          contragentContraller = value!;
                                          print(contragentContraller);
                                          for (int i = 0;
                                              i <
                                                  contragentState
                                                      .contragentsElements
                                                      .length;
                                              i++) {
                                            if (contragentContraller ==
                                                contragentState
                                                    .contragentsElements[i]
                                                    .name) {
                                              contragentCode = int.tryParse(
                                                  contragentState
                                                      .contragentsElements[i]
                                                      .kod!);
                                            }
                                          }
                                        });
                                      },
                                      icon: AppIcons(
                                        icon: Icons.arrow_drop_down,
                                        size: Dimensions.iconSize24,
                                      ),
                                      buttonPadding: const EdgeInsets.only(
                                          left: 0, right: 0),
                                      dropdownMaxHeight: 200,
                                      scrollbarAlwaysShow: true,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 0, vertical: paddingVertical),
                                  child: ListTile(
                                    title: Row(
                                      children: [
                                        SmallText(
                                          text: '* ',
                                          color: AppColors.appCoral,
                                        ),
                                        SmallText(
                                          text: 'selectStationType',
                                          color: AppColors.appLightBlack,
                                        ),
                                      ],
                                    ),
                                    subtitle: DropdownButton2(
                                        itemPadding: EdgeInsets.only(left: 0),
                                        dropdownPadding:
                                            EdgeInsets.only(left: 10),
                                        isExpanded: true,
                                        items: stationType.stationTypeNameList
                                            .map((item) => DropdownMenuItem(
                                                  value: item,
                                                  child: MiddleText(text: item),
                                                ))
                                            .toList(),
                                        value: !stationType.stationTypeNameList
                                                .contains(stationContraller)
                                            ? "notSelected"
                                            : stationContraller,
                                        onChanged: (value) {
                                          setState(() {
                                            stationContraller = value!;
                                          });
                                          for (int i = 0;
                                              i <
                                                  stationType
                                                      .stationTypeList.length;
                                              i++) {
                                            if (stationType
                                                    .stationTypeList[i].name ==
                                                stationContraller) {
                                              stationTypeCod = stationType
                                                  .stationTypeList[i].id;
                                            }
                                          }
                                        },
                                        icon: AppIcons(
                                          icon: Icons.arrow_drop_down,
                                          size: Dimensions.iconSize24,
                                        ),
                                        buttonPadding: const EdgeInsets.only(
                                            left: 0, right: 0),
                                        dropdownMaxHeight:
                                            Dimensions.height50 * 4,
                                        scrollbarAlwaysShow: true,
                                        buttonHeight: Dimensions.height66),
                                  ),
                                ),
                                SizedBox(
                                  height: Dimensions.height10,
                                ),

                                Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: paddingHorizontal,
                                        vertical: paddingVertical),
                                    child: CreateAndEditForm(
                                      contraller: descriptionContraller,
                                      fildName: MiddleText(
                                        text: 'description'.tr(),
                                      ),
                                      requiredFildMark: "",
                                    )),
                                SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: paddingHorizontal,
                                        vertical: paddingVertical),
                                    child: CreateAndEditForm(
                                      textInputType: TextInputType.number,
                                      contraller: summaContraller,
                                      fildName: MiddleText(
                                        text: 'summ'.tr(),
                                      ),
                                      requiredFildMark: "* ",
                                      onTap: () {
                                        setState(() {
                                          summaContraller.clear();
                                        });
                                      },
                                    )),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: paddingHorizontal,
                                      vertical: paddingVertical),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        BigText(
                                          text: "actived".tr(),
                                        ),
                                        Checkbox(
                                          checkColor: Colors.white,
                                          fillColor:
                                              MaterialStateProperty.resolveWith(
                                                  getColor),
                                          value: statusChecked,
                                          onChanged: (bool? value) {
                                            setState(() {
                                              statusChecked = value!;
                                              if (cashOrderState
                                                      .resultCashOrderModel!
                                                      .aktiv ==
                                                  1) {
                                                statusContraller = 0;
                                              } else {
                                                statusContraller = 1;
                                              }
                                            });
                                          },
                                        ),
                                      ]),
                                ),
                              ])),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      Center(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: AppColors.appPurple,
                                minimumSize: const Size.fromHeight(50)),
                            onPressed: () async {
                              await saveDocument();
                            },
                            child: MiddleText(
                              color: AppColors.appWhite,
                              text: "save",
                            )),
                      ),
//                      Center(
//                        child: TextButton(
//                            onPressed: () async {
//                              if (widget.justClose == true) {
//                                await showDialog<bool?>(
//                                  context: context,
//                                  barrierDismissible: false,
//                                  builder: (BuildContext context) {
//                                    return SimpleDialog(
//                                      title: MiddleText(
//                                        text: "saveDocumentOrWillBeDelete".tr(),
//                                      ),
//                                      children: [
//                                        Row(
//                                          mainAxisAlignment:
//                                              MainAxisAlignment.center,
//                                          children: [
//                                            TextButton(
//                                              onPressed: () async {
//                                                await cashOrderState
//                                                    .delteCashOrdersByFilter(
//                                                        id: cashOrderState
//                                                            .resultCashOrderModel!
//                                                            .id);
//                                                router.pop();
//                                              },
//                                              child: Text('done'.tr()),
//                                            ),
//                                            TextButton(
//                                              onPressed: () async {
//                                                router.pop();
//                                              },
//                                              child: Text('close'.tr()),
//                                            ),
//                                          ],
//                                        )
//                                      ],
//                                    );
//                                  },
//                                );
//                              } else {
//                                router.pop();
//                              }
//                            },
//                            child: MiddleText(
//                              text: "close",
//                              color: AppColors.appPurple,
//                            )),
//                      ),
                    ]))));
  }

  saveDocument() async {
    if (documentNumberContraller.text == "" ||
        firstDatacontraller.text == "" ||
        summaContraller == null ||
        summaContraller == "" ||
        contragentContraller == null ||
        currencyContraller == null ||
        stationContraller == null ||
        stationContraller == "notSelected" ||
        currencyContraller == "notSelected" ||
        stationContraller == "notSelected") {
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
                child: Text('done'.tr()),
              ),
            ],
          );
        },
      );
    } else {
      try {
        await cashOrderState.createCahsOrderDocument(
            cashOrderModel: CashOrderModel(
                id: idContraller,
                n_dok: documentNumberContraller.text,
                data_d: firstDatacontraller.text,
                typ_d: cashOrderState.resultCashOrderModel!.typ_d,
                summa: int.parse(summaContraller.text),
                id_osn: 0,
                t_osn: 0,
                prim: descriptionContraller.text,
                kodpost: contragentCode,
                namepost: contragentContraller,
                val: currencyContraller,
                aktiv: statusContraller,
                kurs: 0.0,
                summa_v: 0,
                pr_kassa: 0.0,
                id_vidkas: stationTypeCod));
        router.replace(MainRoute());
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
    }
  }

  //DATE TIME SELECT FUNCTIONAL
  showFirstDate() async {
    pickedDate1 = await showDatePicker(
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      context: context,
      initialDate: DateTime.now(), //get today's date
      firstDate: DateTime(
          2000), //DateTime.now() - not to allow to choose before today.
      lastDate: DateTime(2101),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.appPurple, // <-- SEE HERE
              onPrimary: AppColors.appWhite, // <-- SEE HERE
              onSurface: AppColors.appBlack, // <-- SEE HERE
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                  primary: AppColors.appCoral // button text color
                  ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (pickedDate1 != null) {
      String formattedDate = DateFormat('dd.MM.yyyy').format(
          pickedDate1!); // format date in required form here we use yyyy-MM-dd that means time is removed

      setState(() {
        if (pickedDate2 != null) {
          if (pickedDate1!.isAfter(pickedDate2!)) {
            showDialog<bool?>(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return SimpleDialog(
                  title: MiddleText(
                    text: "${"firstDateCantBeAfterSecondDate".tr()}",
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
              firstDatacontraller.text = formattedDate;
            });
          }
        } else {
          setState(() {
            firstDatacontraller.text = formattedDate;
          });
        }
        //set foratted date to TextField value.
      });
    } else {
      print("Date is not selected");
    }
  }
}
