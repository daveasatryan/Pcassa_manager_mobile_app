import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pcassa_retail/constants/paddings_constants/padding_constants.dart';
import 'package:pcassa_retail/models/act_model/act_model.dart';
import 'package:pcassa_retail/router/router.gr.dart';
import 'package:pcassa_retail/router/services.dart';
import 'package:pcassa_retail/store/act_state/act_state.dart';
import 'package:pcassa_retail/store/act_view_state/act_view_state.dart';
import 'package:pcassa_retail/store/spent_state/spent_state.dart';
import 'package:pcassa_retail/widgets/big_text.dart';
import 'package:pcassa_retail/widgets/small_text_widget.dart';

import '../../../constants/app_themes/app_colors/app_colors.dart';
import '../../../constants/dimensions/dimensions.dart';
import '../../../store/contragent_state/contragent_state.dart';
import '../../../store/currency_state/currency_state.dart';
import '../../../widgets/app_icons.dart';
import '../../../widgets/middle_text.dart';
import '../../../widgets/text_form_field.dart';

class ActCreateScreen extends StatefulWidget {
  bool justClose;
  ActCreateScreen({Key? key, required this.justClose}) : super(key: key);

  @override
  State<ActCreateScreen> createState() => _ActCreateScreenState();
}

class _ActCreateScreenState extends State<ActCreateScreen> {
  var contragentState = GetIt.I<ContragentState>();
  var currencyState = GetIt.I<CreatedCurrencys>();
  var actViewState = GetIt.I<ActViewState>();
  //final stationType = GetIt.I<StationTypeState>();
  //final cashOrderState = GetIt.I<CashOrderState>();

  final spentState = GetIt.I<SpentState>();
  final actOrderState = GetIt.I<ActState>();
  var documentNumberContraller = TextEditingController();
  var descriptionContraller = TextEditingController();
  var firstDatacontraller = TextEditingController();

  var summaContraller = TextEditingController();

  String? currencyContraller;
  String? contragentContraller;
  String? spentController;
  int? idContraller;
  int? statusCheck;
  bool? statusChecked;
  bool isLoading = true;
  int? contragentCode;
  int? zatratkod;

  var statusContraller;
  DateTime? pickedDate1;

  DateTime? pickedDate2;

  @override
  void initState() {
    super.initState();

    //Contraller initialisation
    idContraller = actOrderState.actInfoForCreate!.id;
    documentNumberContraller.text =
        actOrderState.actInfoForCreate!.n_dok.toString();
    firstDatacontraller.text = DateFormat('dd.MM.yyyy').format(
        DateTime.parse(actOrderState.actInfoForCreate!.data_d.toString()));
    summaContraller.text =
        actOrderState.actInfoForCreate!.summa!.toInt().toString();
    currencyContraller = actOrderState.actInfoForCreate!.val;
    contragentCode = actOrderState.actInfoForCreate!.kodpost;
    contragentContraller = actOrderState.actInfoForCreate!.namepost;
    zatratkod = actOrderState.actInfoForCreate!.kodzatrat;
    for (int i = 0; i < spentState.spentList.length; i++) {
      if (actOrderState.actInfoForCreate!.kodzatrat ==
          spentState.spentList[i].id) {
        spentController = spentState.spentList[i].name;
      }
    }

    descriptionContraller.text =
        actOrderState.actInfoForCreate!.prim == "null" ||
                actOrderState.actInfoForCreate!.prim == null
            ? ""
            : actOrderState.actInfoForCreate!.prim.toString();

    //Status Checking
    if (actOrderState.actInfoForCreate!.aktiv == 1) {
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
                                    dense: true,

                                    //contentPadding: EdgeInsets.all(0),
                                    title: Row(
                                      children: [
                                        SmallText(
                                          text: "* ",
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
                                      dropdownPadding:
                                          EdgeInsets.only(left: 10),
                                      // barrierLabel: 'EHFRB',
                                      // barrierDismissible: true,
                                      isExpanded: true,
                                      // hint: Row(
                                      //   children: [
                                      //     Expanded(
                                      //       child: MiddleText(
                                      //         text: 'selectCurrency',
                                      //         color: AppColors.appLightBlack,
                                      //       ),
                                      //     ),
                                      //   ],
                                      // ),
                                      items: currencyState.currencyShortNames
                                          .map((item) =>
                                              DropdownMenuItem<String>(
                                                alignment: Alignment.centerLeft,
                                                value: item,
                                                child: MiddleText(
                                                  text: item,
                                                ),
                                              ))
                                          .toList(),
                                      value: currencyContraller,
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
                                          text: "* ",
                                          color: AppColors.appCoral,
                                        ),
                                        SmallText(
                                          text: 'selectContragent',
                                          color: AppColors.appLightBlack,
                                        ),
                                      ],
                                    ),
                                    subtitle: DropdownButton2(
                                      isExpanded: true,
                                      itemPadding: EdgeInsets.only(left: 0),
                                      dropdownPadding:
                                          EdgeInsets.only(left: 10),
                                      // hint: Row(
                                      //   children: [
                                      //     Expanded(
                                      //       child: MiddleText(
                                      //         text: 'selectContragent',
                                      //         color: AppColors.appLightBlack,
                                      //       ),
                                      //     ),
                                      //   ],
                                      // ),
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
                                          text: 'spentName',
                                          color: AppColors.appLightBlack,
                                        ),
                                      ],
                                    ),
                                    subtitle: DropdownButton2(
                                        itemPadding: EdgeInsets.only(left: 0),
                                        dropdownPadding:
                                            EdgeInsets.only(left: 10),
                                        isExpanded: true,
                                        items: spentState.spentListNames
                                            .map((item) => DropdownMenuItem(
                                                  value: item,
                                                  child: MiddleText(text: item),
                                                ))
                                            .toList(),
                                        value: !spentState.spentListNames
                                                .contains(spentController)
                                            ? "notSelected"
                                            : spentController,
                                        onChanged: (value) {
                                          setState(() {
                                            spentController = value!;
                                          });
                                          for (int i = 0;
                                              i < spentState.spentList.length;
                                              i++) {
                                            if (spentState.spentList[i].name ==
                                                spentController) {
                                              zatratkod =
                                                  spentState.spentList[i].id;
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
                                      onTap: () {
                                        summaContraller.text = "";
                                      },
                                      textInputType: TextInputType.number,
                                      contraller: summaContraller,
                                      fildName: MiddleText(
                                        text: 'summ'.tr(),
                                      ),
                                      requiredFildMark: "* ",
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
                                              if (actOrderState
                                                      .actInfoForCreate!
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
                              try {
                                await saveDocument();
                              } catch (e) {
                                print(e);
                                // ErrorHandler();
                              }
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
//                                showDialog<bool?>(
//                                  context: context,
//                                  barrierDismissible: false,
//                                  builder: (BuildContext context) {
//                                    return SimpleDialog(
//                                      title: MiddleText(
//                                        text: "saveDocumentOrWillBeDelete",
//                                      ),
//                                      children: [
//                                        Row(
//                                          mainAxisAlignment:
//                                              MainAxisAlignment.center,
//                                          children: [
//                                            TextButton(
//                                              onPressed: () async {
//                                                await actViewState
//                                                    .delActFromList(
//                                                        id: actOrderState
//                                                            .actInfoForCreate!
//                                                            .id!);
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
//
//                            },
//                            child: MiddleText(
//                              text: "close",
//                            )),
//                      ),
                    ]))));
  }

  saveDocument() async {
    if (documentNumberContraller.text == "" ||
        firstDatacontraller.text == "" ||
        summaContraller.text.isEmpty ||
        contragentContraller == null ||
        currencyContraller == null ||
        spentController == null ||
        spentController == "notSelected" ||
        currencyContraller == "notSelected" ||
        spentController == "notSelected") {
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
      await actOrderState.getActMainInfo(
          actInfo_: ActModel(
              id: actOrderState.actInfoForCreate!.id,
              n_dok: documentNumberContraller.text,
              data_d: firstDatacontraller.text,
              typ_d: 24,
              summa: double.parse(summaContraller.text),
              id_osn: 0,
              t_osn: 0,
              prim: descriptionContraller.text,
              kodpost: contragentCode,
              namepost: contragentContraller,
              val: currencyContraller,
              aktiv: statusContraller,
              kurs: 0.0,
              summa_val: 0,
              kodzatrat: zatratkod,
              namezatrat: spentController,
              srok_oplati: actOrderState.actInfoForCreate!.srok_oplati));
      router.replace(MainRoute());
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
