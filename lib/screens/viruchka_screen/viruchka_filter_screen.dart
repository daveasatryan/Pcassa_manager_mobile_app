import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pcassa_retail/constants/app_themes/app_colors/app_colors.dart';
import 'package:pcassa_retail/constants/dimensions/dimensions.dart';
import 'package:pcassa_retail/constants/paddings_constants/padding_constants.dart';
import 'package:pcassa_retail/router/services.dart';
import 'package:pcassa_retail/screens/viruchka_screen/viruchka_screen.dart';
import 'package:pcassa_retail/store/user_state/user_state.dart';
import 'package:pcassa_retail/store/viruchka_state/viruchka_state.dart';
import 'package:pcassa_retail/widgets/app_icons.dart';
import 'package:pcassa_retail/widgets/middle_text.dart';
import 'package:pcassa_retail/widgets/text_form_field.dart';

class ViruchkaFilter extends StatefulWidget {
  static var firstDatacontraller = TextEditingController();
  static var secondDateContraller = TextEditingController();
  static var checkNumber = TextEditingController();
  static var n_smena = TextEditingController();
  static String cashier_name = "notSelected";
  static bool isLoading = false;
  const ViruchkaFilter({Key? key}) : super(key: key);

  @override
  State<ViruchkaFilter> createState() => _ViruchkaFilterState();
}

class _ViruchkaFilterState extends State<ViruchkaFilter> {
  //Contrallers
  var userState = GetIt.I<CreatedUsers>();
  var viruchkaState = GetIt.I<ViruchkaState>();
  //Variables

  DateTime? pickedDate1;
  DateTime? pickedDate2;

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
            text: "setFilter",
            color: AppColors.appWhite,
          ),
          backgroundColor: AppColors.appPurple,
          actions: [
            TextButton(
                onPressed: () async {
                  await searchDocument();
                  await viruchkaState.makeSummary();
                  router.pop();
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
                  await viruchkaState.makeSummary();
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
                                      ViruchkaFilter.firstDatacontraller.text =
                                          "";
                                    });
                                    showFirstDate();
                                  },
                                  textInputType: TextInputType.number,
                                  contraller:
                                      ViruchkaFilter.firstDatacontraller,
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
                                      ViruchkaFilter.secondDateContraller.text =
                                          "";
                                    });
                                    showSecondDate();
                                  },
                                  textInputType: TextInputType.number,
                                  contraller:
                                      ViruchkaFilter.secondDateContraller,
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
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: paddingVertical),
                        child: ListTile(
                          title: Row(
                            children: [
                              Expanded(
                                child: MiddleText(
                                  text: 'chouseUser',
                                  color: AppColors.appLightBlack,
                                ),
                              ),
                            ],
                          ),
                          subtitle: DropdownButton2(
                            itemPadding: EdgeInsets.only(left: 0),
                            dropdownPadding: EdgeInsets.only(left: 10),
                            isExpanded: true,
                            items: userState.usersFio
                                .map((item) => DropdownMenuItem(
                                      value: item,
                                      child: MiddleText(text: item),
                                    ))
                                .toList(),
                            value: ViruchkaFilter.cashier_name,
                            onChanged: (value) {
                              setState(() {
                                ViruchkaFilter.cashier_name = value!;
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
                          ),
                        ),
                      ),
                      //Document number
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: paddingHorizontal,
                              vertical: paddingVertical),
                          child: CreateAndEditForm(
                            textInputType: TextInputType.number,
                            contraller: ViruchkaFilter.n_smena,
                            fildName: MiddleText(
                              text: 'shiftNumber'.tr(),
                            ),
                            requiredFildMark: "",
                          )),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: paddingHorizontal,
                              vertical: paddingVertical),
                          child: CreateAndEditForm(
                            textInputType: TextInputType.number,
                            contraller: ViruchkaFilter.checkNumber,
                            fildName: MiddleText(
                              text: 'chequenumber'.tr(),
                            ),
                            requiredFildMark: "",
                          )),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      //First data

                      SizedBox(
                        height: Dimensions.height20,
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
    await viruchkaState.getViruchka(
        chequenumber: ViruchkaFilter.checkNumber.text,
        data_e: ViruchkaFilter.secondDateContraller.text,
        data_s: ViruchkaFilter.firstDatacontraller.text,
        n_smena: ViruchkaFilter.n_smena.text,
        waiter_name: ViruchkaFilter.cashier_name == "notSelected"
            ? ""
            : ViruchkaFilter.cashier_name,
        order_by: "");
  }

  resetFilter() async {
    setState(() {
      ViruchkaFilter.checkNumber.text = "";
      ViruchkaFilter.secondDateContraller.text = DateFormat("dd.MM.yyyy")
          .format(DateTime.now().subtract(Duration(days: 1)))
          .toString();
      ViruchkaFilter.firstDatacontraller.text = DateFormat("dd.MM.yyyy")
          .format(DateTime.now().subtract(Duration(days: 1)))
          .toString();
      ViruchkaFilter.n_smena.text = "";
      ViruchkaFilter.cashier_name == "notSelected";
    });
    await viruchkaState.getViruchka(
        chequenumber: ViruchkaFilter.checkNumber.text,
        data_e: ViruchkaFilter.secondDateContraller.text,
        data_s: ViruchkaFilter.firstDatacontraller.text,
        n_smena: ViruchkaFilter.n_smena.text,
        waiter_name: ViruchkaFilter.cashier_name == "notSelected"
            ? ""
            : ViruchkaFilter.cashier_name,
        order_by: "");
    router.pop();
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
              ViruchkaFilter.firstDatacontraller.text = formattedDate;
            });
          }
        } else {
          setState(() {
            ViruchkaFilter.firstDatacontraller.text = formattedDate;
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
              ViruchkaFilter.secondDateContraller.text = formattedDate;
            });
          }
        } else {
          setState(() {
            ViruchkaFilter.secondDateContraller.text = formattedDate;
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
        ViruchkaFilter.isLoading = true;
      });
    }

//Stop Delete Loading
    endLoad(setState) {
      setState(() {
        ViruchkaFilter.isLoading = false;
        router.pop();
      });
    }
  }
}
