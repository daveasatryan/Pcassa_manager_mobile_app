import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pcassa_retail/constants/app_themes/app_colors/app_colors.dart';
import 'package:pcassa_retail/constants/dimensions/dimensions.dart';
import 'package:pcassa_retail/constants/paddings_constants/padding_constants.dart';
import 'package:pcassa_retail/router/services.dart';
import 'package:pcassa_retail/store/cash_order_state/cash_order_state.dart';
import 'package:pcassa_retail/store/contragent_state/contragent_state.dart';
import 'package:pcassa_retail/store/currency_state/currency_state.dart';
import 'package:pcassa_retail/store/station_type_state/station_type_state.dart';
import 'package:pcassa_retail/store/warehouse_state/warehouse_state.dart';
import 'package:pcassa_retail/widgets/app_icons.dart';
import 'package:pcassa_retail/widgets/big_text.dart';
import 'package:pcassa_retail/widgets/middle_text.dart';
import 'package:pcassa_retail/widgets/small_text_widget.dart';
import 'package:pcassa_retail/widgets/text_form_field.dart';

class FilterRkoPko extends StatefulWidget {
  static var documentNumberContraller = TextEditingController();
  static var firstDatacontraller = TextEditingController();
  static var secondDateContraller = TextEditingController();
  static String? currencyContraller;
  static String? contragentContraller;
  static String? stationContraller;
  static int? stationTypeCod;
 static int statusCheck   = 1;
  static String? typeContraller;
  static bool? statusChecked;
  static bool isLoading = false;
  const FilterRkoPko({Key? key}) : super(key: key);

  @override
  State<FilterRkoPko> createState() => _FilterRkoPkoState();
}

//CurrencyList
List<String> currencys = ["AMD", "RUB", "USD"];
List<String> documentTypes = ["rko", "pko", "notSelected"];
//States getting

var contragentState = GetIt.I<ContragentState>();
var currencyState = GetIt.I<CreatedCurrencys>();
var stationType = GetIt.I<StationTypeState>();
var cashOrderState = GetIt.I<CashOrderState>();

class _FilterRkoPkoState extends State<FilterRkoPko> {
  //Contrallers

  //Variables

  DateTime? pickedDate1;
  DateTime? pickedDate2;
  var statusContraller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    

    //Status Checking
    if (FilterRkoPko.statusCheck == 1) {
      statusContraller = 1;
      FilterRkoPko.statusChecked = true;
    } else {
      statusContraller = 0;
      FilterRkoPko.statusChecked = false;
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
            text: "searchDocumentByFilter",
            color: AppColors.appWhite,
          ),
          backgroundColor: AppColors.appPurple,
          actions: [
            TextButton(
                onPressed: () async {
                  await searchDocument();
                },
                child: Padding(
                  padding: const EdgeInsets.all(paddingAll),
                  child: MiddleText(
                    text: "search",
                    color: AppColors.appWhite,
                  ),
                )),
                TextButton(
                onPressed: () async {
                  await resetFilter();
                  router.pop();
                },
                child: Padding(
                  padding: const EdgeInsets.all(paddingAll),
                  child: MiddleText(
                    text: "resetFilter",
                    color: AppColors.appWhite,
                  ),
                ))
          ]),
      body: Center(
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
                            contraller: FilterRkoPko.documentNumberContraller,
                            fildName: MiddleText(
                              text: 'numberOfDocument'.tr(),
                            ),
                            requiredFildMark: "",
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
                                      FilterRkoPko.firstDatacontraller.text =
                                          "";
                                    });
                                    showFirstDate();
                                  },
                                  textInputType: TextInputType.number,
                                  contraller: FilterRkoPko.firstDatacontraller,
                                  fildName: MiddleText(
                                    text: 'firstDate'.tr(),
                                  ),
                                  requiredFildMark: "",
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
                                      FilterRkoPko.secondDateContraller.text =
                                          "";
                                    });
                                    showSecondDate();
                                  },
                                  textInputType: TextInputType.number,
                                  contraller: FilterRkoPko.secondDateContraller,
                                  fildName: MiddleText(
                                    text: 'secondDate'.tr(),
                                  ),
                                  requiredFildMark: "",
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
                                text: 'selectContragent',
                                color: AppColors.appLightBlack,
                              ),
                            ],
                          ),
                          subtitle: DropdownButton2(
                            isExpanded: true,
                            itemPadding: EdgeInsets.only(left: 0),
                            dropdownPadding: EdgeInsets.only(left: 10),
                            items: contragentState.contragentNames
                                .map((item) => DropdownMenuItem<String>(
                                      value: item,
                                      child: MiddleText(
                                        text: item.toString(),
                                      ),
                                    ))
                                .toList(),
                            value: FilterRkoPko.contragentContraller,
                            onChanged: (value) {
                              setState(() {
                                FilterRkoPko.contragentContraller = value!;
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
                                text: 'documentType',
                                color: AppColors.appLightBlack,
                              ),
                            ],
                          ),
                          subtitle: DropdownButton2(
                              isExpanded: true,
                              itemPadding: EdgeInsets.only(left: 0),
                              dropdownPadding: EdgeInsets.only(left: 10),
                              items: documentTypes
                                  .map((item) => DropdownMenuItem(
                                        value: item,
                                        child: MiddleText(text: item),
                                      ))
                                  .toList(),
                              value: FilterRkoPko.typeContraller,
                              onChanged: (value) {
                                setState(() {
                                  FilterRkoPko.typeContraller = value!;
                                });
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
                            horizontal: 0, vertical: paddingVertical),
                        child: ListTile(
                          title: Row(
                            children: [
                              SmallText(
                                text: 'selectStationType',
                                color: AppColors.appLightBlack,
                              ),
                            ],
                          ),
                          subtitle: DropdownButton2(
                              isExpanded: true,
                              itemPadding: const EdgeInsets.only(left: 0),
                              dropdownPadding: EdgeInsets.only(left: 10),
                              items: stationType.stationTypeNameList
                                  .map((item) => DropdownMenuItem(
                                        value: item,
                                        child: MiddleText(text: item),
                                      ))
                                  .toList(),
                              value: !stationType.stationTypeNameList
                                      .contains(FilterRkoPko.stationContraller)
                                  ? "notSelected"
                                  : FilterRkoPko.stationContraller,
                              onChanged: (value) {
                                setState(() {
                                  FilterRkoPko.stationContraller = value!;
                                });
                                for (int i = 0;
                                    i < stationType.stationTypeList.length;
                                    i++) {
                                  if (stationType.stationTypeList[i].name ==
                                      FilterRkoPko.stationContraller) {
                                    FilterRkoPko.stationTypeCod =
                                        stationType.stationTypeList[i].id;
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
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  searchDocument() async {
    cashOrderState.resultCashOrder.clear();
    await cashOrderState.getCashOrdersByFilter(
        n_dok: FilterRkoPko.documentNumberContraller.text,
        data_s: FilterRkoPko.firstDatacontraller.text,
        data_e: FilterRkoPko.secondDateContraller.text,
        tip_name: FilterRkoPko.typeContraller == "rko"
            ? "рко"
            : FilterRkoPko.typeContraller == "pko"
                ? "пко"
                : "",
        kontname: FilterRkoPko.contragentContraller == "notSelected"
            ? ""
            : FilterRkoPko.contragentContraller,
        kassname: FilterRkoPko.stationContraller == "notSelected"
            ? ""
            : FilterRkoPko.stationContraller);
    router.pop();
  }

  resetFilter() async {
    setState(() {
      FilterRkoPko.contragentContraller = "notSelected";
      FilterRkoPko.documentNumberContraller.text = "";
      FilterRkoPko.firstDatacontraller.text = "";
      FilterRkoPko.secondDateContraller.text = "";
      FilterRkoPko.stationContraller = "notSelected";
      FilterRkoPko.typeContraller = "notSelected";
    });
    await cashOrderState.getCashOrdersByFilter(
      n_dok: FilterRkoPko.documentNumberContraller.text,
      data_s: FilterRkoPko.firstDatacontraller.text,
      data_e: FilterRkoPko.secondDateContraller.text,
      tip_name: FilterRkoPko.typeContraller == "notSelected"
          ? ""
          : FilterRkoPko.typeContraller,
      kontname: FilterRkoPko.contragentContraller == "notSelected"
          ? ""
          : FilterRkoPko.contragentContraller,
      kassname: FilterRkoPko.stationContraller == "notSelected"
          ? ""
          : FilterRkoPko.stationContraller,
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
              FilterRkoPko.firstDatacontraller.text = formattedDate;
            });
          }
        } else {
          setState(() {
            FilterRkoPko.firstDatacontraller.text = formattedDate;
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
              FilterRkoPko.secondDateContraller.text = formattedDate;
            });
          }
        } else {
          setState(() {
            FilterRkoPko.secondDateContraller.text = formattedDate;
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
        FilterRkoPko.isLoading = true;
      });
    }

//Stop Delete Loading
    endLoad(setState) {
      setState(() {
        FilterRkoPko.isLoading = false;
        router.pop();
      });
    }
  }
}
