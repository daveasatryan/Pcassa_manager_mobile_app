import 'package:dio/dio.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pcassa_retail/constants/paddings_constants/padding_constants.dart';
import 'package:pcassa_retail/error_handler/error_handler.dart';
import 'package:pcassa_retail/router/services.dart';
import 'package:pcassa_retail/store/nakl_info_state/nakl_info_state.dart';
import 'package:pcassa_retail/widgets/app_icons.dart';
import 'package:pcassa_retail/widgets/big_text.dart';
import 'package:pcassa_retail/widgets/middle_text.dart';
import 'package:pcassa_retail/widgets/small_text_widget.dart';
import 'package:pcassa_retail/widgets/text_form_field.dart';

import '../../constants/app_themes/app_colors/app_colors.dart';
import '../../constants/dimensions/dimensions.dart';
import '../../models/naklinfo_items_model/naklinfo_items_model.dart';
import '../../store/contragent_state/contragent_state.dart';
import '../../store/currency_state/currency_state.dart';
import '../../store/warehouse_state/warehouse_state.dart';

class WriteOff extends StatefulWidget {
  const WriteOff({Key? key, required this.documentType}) : super(key: key);
  final String documentType;
  @override
  State<WriteOff> createState() => _WriteOffState();
}

//CurrencyList
List<String> currencys = ["AMD", "RUB", "USD"];

//States getting
var warehouseState = GetIt.I<WarehouseState>();
var contragentState = GetIt.I<ContragentState>();
var currencyState = GetIt.I<CreatedCurrencys>();
var naklInfoState = GetIt.I<NaklInfoState>();

class _WriteOffState extends State<WriteOff> {
  //Contrallers
  var documentNumberContraller = TextEditingController();
  var descriptionContraller = TextEditingController();
  var firstDatacontraller = TextEditingController();
  var secondDateContraller = TextEditingController();
  String? currencyContraller;
  String? contragentContraller;
  String? discountTypeContraller;
  String? firstWarehouseContraller;
  int? idContraller;
  int? statusCheck;
  bool? statusChecked;
  bool isLoading = true;
  //Variables

  int? contragentCode;
  int? warehouseCode;
  DateTime? pickedDate1;
  DateTime? pickedDate2;
  var statusContraller;
  //Contraller initialisation
  @override
  void initState() {
    super.initState();
    //Contraller initialisation
    idContraller = naklInfoState.naklInfoItems!.id;
    documentNumberContraller.text =
        naklInfoState.naklInfoItems!.n_dok.toString();
    firstDatacontraller.text = DateFormat('dd.MM.yyyy')
        .format(DateTime.parse(naklInfoState.naklInfoItems!.data_d.toString()));
    secondDateContraller.text = DateFormat('dd.MM.yyyy').format(
        DateTime.parse(naklInfoState.naklInfoItems!.srok_oplati.toString()));
    currencyContraller = naklInfoState.naklInfoItems!.val;
    contragentCode = naklInfoState.naklInfoItems!.kodpost;
    contragentContraller = naklInfoState.naklInfoItems!.namepost;
    warehouseCode = naklInfoState.naklInfoItems!.skl1;
    firstWarehouseContraller = naklInfoState.naklInfoItems!.skl1name;
    descriptionContraller.text = naklInfoState.naklInfoItems!.prim == "null"
        ? ""
        : naklInfoState.naklInfoItems!.prim.toString();

    //Status Checking
    if (naklInfoState.naklInfoItems!.aktiv == 1) {
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

    //Main
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            SizedBox(
                              width: Dimensions.width20,
                            ),
                            //Second Date
                            Expanded(
                              child: CreateAndEditForm(
                                onTap: () {
                                  setState(() {
                                    secondDateContraller.text = "";
                                  });
                                  showSecondDate();
                                },
                                textInputType: TextInputType.number,
                                contraller: secondDateContraller,
                                fildName: MiddleText(
                                  text: 'secondDate'.tr(),
                                ),
                                requiredFildMark: "* ",
                                sufixIcon: IconButton(
                                    icon: AppIcons(
                                      icon: Icons.calendar_month,
                                      size: Dimensions.iconSize24,
                                    ),
                                    onPressed: () async {
                                      showSecondDate();
                                    }), //icon of text field
                                //label text of field
                              ),
                            )
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
                          itemPadding: EdgeInsets.only(left: 0),
                          dropdownPadding: EdgeInsets.only(left: 10),
                          isExpanded: true,
                          items: currencyState.currencyShortNames
                              .map((item) => DropdownMenuItem<String>(
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
                          buttonPadding:
                              const EdgeInsets.only(left: 0, right: 0),
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
                              text: 'selectBuyer',
                              color: AppColors.appLightBlack,
                            ),
                          ],
                        ),
                        subtitle: DropdownButton2(
                          isExpanded: true,
                          itemPadding: EdgeInsets.only(left: 0),
                          dropdownPadding: EdgeInsets.only(left: 10),
                          items: contragentState.contragentsElements
                              .map((item) => DropdownMenuItem<String>(
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
                                          .contragentsElements.length;
                                  i++) {
                                if (contragentContraller ==
                                    contragentState
                                        .contragentsElements[i].name) {
                                  contragentCode = int.tryParse(contragentState
                                      .contragentsElements[i].kod!);
                                }
                              }
                            });
                          },
                          icon: AppIcons(
                            icon: Icons.arrow_drop_down,
                            size: Dimensions.iconSize24,
                          ),
                          buttonPadding:
                              const EdgeInsets.only(left: 0, right: 0),
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
                              text: 'warehouse',
                              color: AppColors.appLightBlack,
                            ),
                          ],
                        ),
                        subtitle: DropdownButton2(
                            isExpanded: true,
                            itemPadding: EdgeInsets.only(left: 0),
                            dropdownPadding: EdgeInsets.only(left: 10),
                            items: warehouseState.warehouseNames
                                .map((item) => DropdownMenuItem(
                                      value: item,
                                      child: MiddleText(text: item),
                                    ))
                                .toList(),
                            value: !warehouseState.warehouseNames
                                    .contains(firstWarehouseContraller)
                                ? "notSelected"
                                : firstWarehouseContraller,
                            onChanged: (value) {
                              setState(() {
                                firstWarehouseContraller = value!;
                              });
                              for (int i = 0;
                                  i < warehouseState.warehouseList.length;
                                  i++) {
                                if (warehouseState.warehouseList[i].name ==
                                    firstWarehouseContraller) {
                                  warehouseCode =
                                      warehouseState.warehouseList[i].cod;
                                }
                              }
                            },
                            icon: AppIcons(
                              icon: Icons.arrow_drop_down,
                              size: Dimensions.iconSize24,
                            ),
                            buttonPadding:
                                const EdgeInsets.only(left: 0, right: 0),
                            dropdownMaxHeight: Dimensions.height50 * 4,
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
                              value: statusChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  statusChecked = value!;
                                  if (naklInfoState.naklInfoItems!.aktiv == 1) {
                                    statusContraller = 0;
                                  } else {
                                    statusContraller = 1;
                                  }
                                });
                              },
                            ),
                          ]),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    print(naklInfoState.savedDocument);
    if (naklInfoState.savedDocument == false) {
      try {
        saveDocument();
      } catch (e) {
        if (e is DioError) {
          ErrorHandler.errorModal(
            context: context,
            errorCode: e.response,
          );
        } else {
          print(e.toString());
        }
      }
    } else {
      print("ok");
    }
    super.dispose();
  }

  saveDocument() async {
    await naklInfoState.createDocument(
      context: context,
      naklinfo_items_model: NaklInfoItemsModel(
          id: idContraller,
          typ_d: int.parse(widget.documentType),
          n_dok: documentNumberContraller.text,
          data_d: firstDatacontraller.text,
          kodpost: contragentCode,
          namepost: contragentContraller,
          skl1: 0,
          skl2: warehouseCode,
          skl1name: "",
          skl2name: firstWarehouseContraller,
          srok_oplati: secondDateContraller.text,
          prim: descriptionContraller.text == ""
              ? "null"
              : descriptionContraller.text,
          aktiv: statusContraller,
          val: currencyContraller,
          skidka: 0,
          tip_skidki: "%",
          contact_litso: "",
          kurs: 0,
          pr_ras: 0),
    );
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

  showSecondDate() async {
    pickedDate2 = await showDatePicker(
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
    if (pickedDate2 != null) {
      String formattedDate = DateFormat('dd.MM.yyyy').format(
          pickedDate2!); // format date in required form here we use yyyy-MM-dd that means time is removed

      setState(() {
        if (pickedDate1 != null) {
          if (pickedDate2!.isBefore(pickedDate1!)) {
            showDialog<bool?>(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return SimpleDialog(
                  title: MiddleText(
                    text: "${"secondDateCantBeBeforeFirstDate".tr()}",
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
              secondDateContraller.text = formattedDate;
            });
          }
        } else {
          setState(() {
            secondDateContraller.text = formattedDate;
          });
        }
        //set foratted date to TextField value.
      });
    } else {
      print("Date is not selected");
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
        router.pop();
      });
    }
  }
}
