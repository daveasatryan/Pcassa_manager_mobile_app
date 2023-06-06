import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pcassa_retail/constants/app_themes/app_colors/app_colors.dart';
import 'package:pcassa_retail/constants/dimensions/dimensions.dart';
import 'package:pcassa_retail/constants/paddings_constants/padding_constants.dart';
import 'package:pcassa_retail/error_handler/error_handler.dart';
import 'package:pcassa_retail/router/services.dart';
import 'package:pcassa_retail/store/act_view_state/act_view_state.dart';
import 'package:pcassa_retail/store/loading_state/loading_state.dart';
import 'package:pcassa_retail/store/spent_state/spent_state.dart';
import 'package:pcassa_retail/widgets/app_icons.dart';

import '../../store/contragent_state/contragent_state.dart';
import '../../store/currency_state/currency_state.dart';
import '../../store/document_view_state/document_view_state.dart';
import '../../store/nakl_info_state/nakl_info_state.dart';
import '../../store/warehouse_state/warehouse_state.dart';
import '../../widgets/big_text.dart';
import '../../widgets/middle_text.dart';
import '../../widgets/text_form_field.dart';

class FilterAct extends StatefulWidget {
  const FilterAct({Key? key}) : super(key: key);
  static String? contragentContraller;
  static var documentNumberContraller = TextEditingController();
  static String? zatratNameContraller;
  static var firstDatacontraller = TextEditingController();
  static var secondDateContraller = TextEditingController();
  @override
  State<FilterAct> createState() => _FilterActState();
}

//CurrencyList
// List<String> currencys = ["AMD", "RUB", "USD"];
// List<String> documentTypes = ["p/n", "r/n", "spis", "vp", "v/t", "v/tpos"];
//States getting
//var warehouseState = GetIt.I<WarehouseState>();
var contragentState = GetIt.I<ContragentState>();
//var currencyState = GetIt.I<CreatedCurrencys>();
//var naklInfoState = GetIt.I<NaklInfoState>();
var spensState = GetIt.I<SpentState>();

var actViewState = GetIt.I<ActViewState>();

class _FilterActState extends State<FilterAct> {
  //Contrallers

  //String? currencyContraller;

  //String? firstWarehouseContraller;

  //String? typeContraller;
  //bool? statusChecked;
  bool isLoading = false;
  //Variables

  DateTime? pickedDate1;
  DateTime? pickedDate2;
  //var statusContraller;
  int statusCheck = 1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //Status Checking
    // if (statusCheck == 1) {
    //   statusContraller = 1;
    //   statusChecked = true;
    // } else {
    //   statusContraller = 0;
    //   statusChecked = false;
    // }
  }

  getInfo() async {
    try {
      await contragentState.getContragents(context: context);
      await spensState.getSpent();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    loadingState.startLoading();
    getInfo();
    loadingState.stopLoading();
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
                            contraller: FilterAct.documentNumberContraller,
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
                                      FilterAct.firstDatacontraller.text = "";
                                    });
                                    showFirstDate();
                                  },
                                  textInputType: TextInputType.number,
                                  contraller: FilterAct.firstDatacontraller,
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
                                      FilterAct.secondDateContraller.text = "";
                                    });
                                    showSecondDate();
                                  },
                                  textInputType: TextInputType.number,
                                  contraller: FilterAct.secondDateContraller,
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
                            horizontal: paddingHorizontal,
                            vertical: paddingVertical),
                        child: DropdownButton2(
                          isExpanded: true,
                          hint: Row(
                            children: [
                              Expanded(
                                child: MiddleText(
                                  text: 'selectContragent',
                                  color: AppColors.appLightBlack,
                                ),
                              ),
                            ],
                          ),
                          items: contragentState.contragentNames
                              .map((item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: MiddleText(
                                      text: item.toString(),
                                    ),
                                  ))
                              .toList(),
                          value: FilterAct.contragentContraller,
                          onChanged: (value) {
                            setState(() {
                              FilterAct.contragentContraller = value!;
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

                      // Padding(
                      //   padding: const EdgeInsets.symmetric(
                      //       horizontal: paddingHorizontal,
                      //       vertical: paddingVertical),
                      //   child: DropdownButton2(
                      //       isExpanded: true,
                      //       hint: Row(
                      //         children: [
                      //           Expanded(
                      //             child: MiddleText(
                      //               text: 'warehouse',
                      //               color: AppColors.appLightBlack,
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //       items: warehouseState.warehouseList
                      //           .map((item) => DropdownMenuItem(
                      //                 value: item.name,
                      //                 child: MiddleText(text: item.name),
                      //               ))
                      //           .toList(),
                      //       value: firstWarehouseContraller,
                      //       onChanged: (value) {
                      //         setState(() {
                      //           firstWarehouseContraller = value!;
                      //         });
                      //       },
                      //       icon: AppIcons(
                      //         icon: Icons.arrow_drop_down,
                      //         size: Dimensions.iconSize24,
                      //       ),
                      //       buttonPadding:
                      //           const EdgeInsets.only(left: 0, right: 0),
                      //       dropdownMaxHeight: Dimensions.height50 * 4,
                      //       scrollbarAlwaysShow: true,
                      //       buttonHeight: Dimensions.height66),
                      // ),

                      // Padding(
                      //   padding: const EdgeInsets.symmetric(
                      //       horizontal: paddingHorizontal,
                      //       vertical: paddingVertical),
                      //   child: DropdownButton2(
                      //       isExpanded: true,
                      //       hint: Row(
                      //         children: [
                      //           Expanded(
                      //             child: MiddleText(
                      //               text: 'documentType',
                      //               color: AppColors.appLightBlack,
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //       items: documentTypes
                      //           .map((item) => DropdownMenuItem(
                      //                 value: item,
                      //                 child: MiddleText(text: item),
                      //               ))
                      //           .toList(),
                      //       value: typeContraller,
                      //       onChanged: (value) {
                      //         setState(() {
                      //           typeContraller = value!;
                      //         });
                      //       },
                      //       icon: AppIcons(
                      //         icon: Icons.arrow_drop_down,
                      //         size: Dimensions.iconSize24,
                      //       ),
                      //       buttonPadding:
                      //           const EdgeInsets.only(left: 0, right: 0),
                      //       dropdownMaxHeight: Dimensions.height50 * 4,
                      //       scrollbarAlwaysShow: true,
                      //       buttonHeight: Dimensions.height66),
                      // ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: paddingHorizontal,
                            vertical: paddingVertical),
                        child: DropdownButton2(
                            isExpanded: true,
                            hint: Row(
                              children: [
                                Expanded(
                                  child: MiddleText(
                                    text: 'spentName',
                                    color: AppColors.appLightBlack,
                                  ),
                                ),
                              ],
                            ),
                            items: spensState.spentListNames
                                .map((item) => DropdownMenuItem(
                                      value: item,
                                      child: MiddleText(text: item),
                                    ))
                                .toList(),
                            value: FilterAct.zatratNameContraller,
                            onChanged: (value) {
                              setState(() {
                                FilterAct.zatratNameContraller = value!;
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
                      // SizedBox(
                      //   height: Dimensions.height10,
                      // ),

                      // Padding(
                      //   padding: const EdgeInsets.symmetric(
                      //       horizontal: paddingHorizontal,
                      //       vertical: paddingVertical),
                      //   child: Row(
                      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //       children: [
                      //         BigText(
                      //           text: "actived".tr(),
                      //         ),
                      //         Checkbox(
                      //           checkColor: Colors.white,
                      //           fillColor:
                      //               MaterialStateProperty.resolveWith(getColor),
                      //           value: statusChecked,
                      //           onChanged: (bool? value) {
                      //             setState(() {
                      //               statusChecked = value!;
                      //               if (naklInfoState.naklInfoItems!.aktiv ==
                      //                   1) {
                      //                 statusContraller = 0;
                      //               } else {
                      //                 statusContraller = 1;
                      //               }
                      //             });
                      //           },
                      //         ),
                      //       ]),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    ;
  }

  resetFilter() async {
    setState(() {
      FilterAct.contragentContraller = "notSelected";
      FilterAct.documentNumberContraller.text = "";
      FilterAct.firstDatacontraller.text = "";
      FilterAct.secondDateContraller.text = "";
      FilterAct.zatratNameContraller = "notSelected";
    });
    await actViewState.getActList(
        n_dok:  FilterAct.documentNumberContraller.text,
        data_s:  FilterAct.firstDatacontraller.text,
        data_e:  FilterAct.secondDateContraller.text,
    
        kontname: FilterAct.contragentContraller == "notSelected"
            ? ""
            : FilterAct.contragentContraller,
        zatratname: FilterAct.zatratNameContraller == "notSelected"
            ? ""
            : FilterAct.zatratNameContraller!);
  }

  searchDocument() async {
    //documentViewState.naklViewInfo.clear();
    print(FilterAct.firstDatacontraller.text);
    try {
      await actViewState.getActList(
          n_dok: FilterAct.documentNumberContraller.text,
          data_s: FilterAct.firstDatacontraller.text,
          data_e: FilterAct.secondDateContraller.text,
        
          kontname: FilterAct.contragentContraller == "notSelected"
              ? ""
              : FilterAct.contragentContraller,
          zatratname: FilterAct.zatratNameContraller == "notSelected"
              ? ""
              : FilterAct.zatratNameContraller
          );

      router.pop();
    } catch (e) {
      print(e);
      //ErrorHandler();
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
              print(formattedDate);
              FilterAct.firstDatacontraller.text = formattedDate;
            });
          }
        } else {
          setState(() {
            print(formattedDate);
            FilterAct.firstDatacontraller.text = formattedDate;
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
              FilterAct.secondDateContraller.text = formattedDate;
            });
          }
        } else {
          setState(() {
            FilterAct.secondDateContraller.text = formattedDate;
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
