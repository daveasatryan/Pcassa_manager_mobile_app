import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pcassa_retail/constants/app_themes/app_colors/app_colors.dart';
import 'package:pcassa_retail/constants/dimensions/dimensions.dart';
import 'package:pcassa_retail/constants/paddings_constants/padding_constants.dart';
import 'package:pcassa_retail/router/services.dart';
import 'package:pcassa_retail/widgets/app_icons.dart';

import '../../store/contragent_state/contragent_state.dart';
import '../../store/currency_state/currency_state.dart';
import '../../store/document_view_state/document_view_state.dart';
import '../../store/nakl_info_state/nakl_info_state.dart';
import '../../store/warehouse_state/warehouse_state.dart';
import '../../widgets/big_text.dart';
import '../../widgets/middle_text.dart';
import '../../widgets/text_form_field.dart';

class FilterDocument extends StatefulWidget {
  FilterDocument({Key? key}) : super(key: key);
  static var documentNumberContraller = TextEditingController();
  static var firstDatacontraller = TextEditingController();
  static var secondDateContraller = TextEditingController();
  static String? firstWarehouseContraller;
  static String? secondWarehouseContraller;
  static String? contragentContraller;
  static var statusContraller;

  static int statusCheck   = 1;
  static String? typeContraller;
  @override
  State<FilterDocument> createState() => _FilterDocumentState();
}

//CurrencyList
List<String> currencys = ["AMD", "RUB", "USD"];
List<String> documentTypes = [
  "p/n",
  "r/n",
  "spis",
  "vp",
  "v/t",
  "v/tpos",
  "notSelected"
];
//States getting
var warehouseState = GetIt.I<WarehouseState>();
var contragentState = GetIt.I<ContragentState>();
var currencyState = GetIt.I<CreatedCurrencys>();
var naklInfoState = GetIt.I<NaklInfoState>();

var documentViewState = GetIt.I<DocumentViewState>();

class _FilterDocumentState extends State<FilterDocument> {
  //Contrallers

  String? currencyContraller;

  bool? statusChecked;
  bool isLoading = false;
  //Variables

  DateTime? pickedDate1;
  DateTime? pickedDate2;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //Status Checking
    if (FilterDocument.statusCheck == 1) {
      FilterDocument.statusContraller = 1;
      statusChecked = true;
    } else {
      FilterDocument.statusContraller = 0;
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
                    text: "filter",
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
                            contraller: FilterDocument.documentNumberContraller,
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
                                      FilterDocument.firstDatacontraller.text =
                                          "";
                                    });
                                    showFirstDate();
                                  },
                                  textInputType: TextInputType.number,
                                  contraller:
                                      FilterDocument.firstDatacontraller,
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
                                      FilterDocument.secondDateContraller.text =
                                          "";
                                    });
                                    showSecondDate();
                                  },
                                  textInputType: TextInputType.number,
                                  contraller:
                                      FilterDocument.secondDateContraller,
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
                              Expanded(
                                child: MiddleText(
                                  text: 'selectContragent',
                                  color: AppColors.appLightBlack,
                                ),
                              ),
                            ],
                          ),
                          subtitle: DropdownButton2(
                            itemPadding: EdgeInsets.only(left: 0),
                            dropdownPadding: EdgeInsets.only(left: 10),
                            isExpanded: true,
                            items: contragentState.contragentNames
                                .map((item) => DropdownMenuItem<String>(
                                      value: item,
                                      child: MiddleText(
                                        text: item.toString(),
                                      ),
                                    ))
                                .toList(),
                            value: FilterDocument.contragentContraller,
                            onChanged: (value) {
                              setState(() {
                                FilterDocument.contragentContraller = value!;
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
                              Expanded(
                                child: MiddleText(
                                  text: 'warehouse',
                                  color: AppColors.appLightBlack,
                                ),
                              ),
                            ],
                          ),
                          subtitle: DropdownButton2(
                              itemPadding: EdgeInsets.only(left: 0),
                              dropdownPadding: EdgeInsets.only(left: 10),
                              isExpanded: true,
                              items: warehouseState.warehouseNames
                                  .map((item) => DropdownMenuItem(
                                        value: item,
                                        child: MiddleText(text: item),
                                      ))
                                  .toList(),
                              value: FilterDocument.firstWarehouseContraller,
                              onChanged: (value) {
                                setState(() {
                                  FilterDocument.firstWarehouseContraller =
                                      value!;
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

                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: paddingVertical),
                        child: ListTile(
                          title: Row(
                            children: [
                              Expanded(
                                child: MiddleText(
                                  text: 'documentType',
                                  color: AppColors.appLightBlack,
                                ),
                              ),
                            ],
                          ),
                          subtitle: DropdownButton2(
                              itemPadding: EdgeInsets.only(left: 0),
                              dropdownPadding: EdgeInsets.only(left: 10),
                              isExpanded: true,
                              items: documentTypes
                                  .map((item) => DropdownMenuItem(
                                        value: item,
                                        child: MiddleText(text: item),
                                      ))
                                  .toList(),
                              value: FilterDocument.typeContraller,
                              onChanged: (value) {
                                setState(() {
                                  FilterDocument.typeContraller = value!;
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
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: paddingVertical),
                        child: ListTile(
                          title: Row(
                            children: [
                              Expanded(
                                child: MiddleText(
                                  text: 'warehouse2',
                                  color: AppColors.appLightBlack,
                                ),
                              ),
                            ],
                          ),
                          subtitle: DropdownButton2(
                              itemPadding: EdgeInsets.only(left: 0),
                              dropdownPadding: EdgeInsets.only(left: 10),
                              isExpanded: true,
                              items: warehouseState.warehouseNames
                                  .map((item) => DropdownMenuItem(
                                        value: item,
                                        child: MiddleText(text: item),
                                      ))
                                  .toList(),
                              value: FilterDocument.secondWarehouseContraller,
                              onChanged: (value) {
                                setState(() {
                                  FilterDocument.secondWarehouseContraller =
                                      value!;
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
                                    if (FilterDocument.statusCheck==1) {
                                      setState(() {
                                        FilterDocument.statusContraller = 0;
                                      });
                                    } else {
                                     setState(() {
                                        FilterDocument.statusContraller = 1;
                                     });
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
      ),
    );
    ;
  }

  searchDocument() async {
    documentViewState.naklViewInfo.clear();
    await documentViewState.getDocument(
      n_dok: FilterDocument.documentNumberContraller.text,
      data_s: FilterDocument.firstDatacontraller.text,
      data_e: FilterDocument.secondDateContraller.text,
      tip_name: FilterDocument.typeContraller == "p/n"
          ? "п/н"
          : FilterDocument.typeContraller == "r/n"
              ? "р/н"
              : FilterDocument.typeContraller == "spis"
                  ? "спис"
                  : FilterDocument.typeContraller == "vp"
                      ? "вп"
                      : FilterDocument.typeContraller == "v/t"
                          ? "в/т"
                          : FilterDocument.typeContraller == "v/tpos"
                              ? "в/тпос"
                              : "",
      kontname: FilterDocument.contragentContraller == "notSelected"
          ? ""
          : FilterDocument.contragentContraller,
      skl1name: FilterDocument.firstWarehouseContraller == "notSelected"
          ? ""
          : FilterDocument.firstWarehouseContraller,
      skl2name: FilterDocument.secondWarehouseContraller == "notSelected"
          ? ""
          : FilterDocument.secondWarehouseContraller,
          aktiv: FilterDocument.statusContraller
    );
    router.pop();
  }

   resetFilter() async {
    setState(() {
      FilterDocument.contragentContraller = "notSelected";
      FilterDocument.documentNumberContraller.text = "";
      FilterDocument.firstDatacontraller.text = "";
      FilterDocument.firstWarehouseContraller = "notSelected";
      FilterDocument.secondDateContraller.text = "";
      FilterDocument.secondWarehouseContraller = "notSelected";
      FilterDocument.statusContraller = 1;
      FilterDocument.typeContraller = "notSelected";
    });
    await documentViewState.getDocument(
        n_dok: FilterDocument.documentNumberContraller.text,
        data_s: FilterDocument.firstDatacontraller.text,
        data_e: FilterDocument.secondDateContraller.text,
        tip_name: FilterDocument.typeContraller == "notSelected"
            ? ""
            : FilterDocument.typeContraller,
        kontname: FilterDocument.contragentContraller == "notSelected"
            ? ""
            : FilterDocument.contragentContraller,
        skl1name: FilterDocument.firstWarehouseContraller == "notSelected"
            ? ""
            : FilterDocument.firstWarehouseContraller,
        skl2name: FilterDocument.secondWarehouseContraller == "notSelected"
            ? ""
            : FilterDocument.secondWarehouseContraller,
        aktiv: FilterDocument.statusContraller);
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
              FilterDocument.firstDatacontraller.text = formattedDate;
            });
          }
        } else {
          setState(() {
            FilterDocument.firstDatacontraller.text = formattedDate;
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
              FilterDocument.secondDateContraller.text = formattedDate;
            });
          }
        } else {
          setState(() {
            FilterDocument.secondDateContraller.text = formattedDate;
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
