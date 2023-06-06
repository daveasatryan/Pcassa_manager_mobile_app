import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pcassa_retail/constants/app_themes/app_icons/app_icons.dart';
import 'package:pcassa_retail/constants/dimensions/dimensions.dart';
import 'package:pcassa_retail/constants/paddings_constants/padding_constants.dart';

import '../../../../constants/app_themes/app_colors/app_colors.dart';
import '../../../../error_handler/error_handler.dart';
import '../../../../router/services.dart';
import '../../../../store/access_type_state/access_state.dart';
import '../../../../store/user_state/user_state.dart';
import '../../../../widgets/middle_text.dart';

class UserCreateWidget extends StatefulWidget {
  const UserCreateWidget({Key? key}) : super(key: key);

  @override
  State<UserCreateWidget> createState() => _UserCreateWidgetState();
}

class _UserCreateWidgetState extends State<UserCreateWidget> {
  //GetUserState
  final usersState = GetIt.I<CreatedUsers>();
  //pinLength
  int pinLength = 4;
  //Controllers Defination
  var loginController = TextEditingController();
  var passwordController = TextEditingController();
  var pinController = TextEditingController();
  var fioController = TextEditingController();
  var cardContraller = TextEditingController();
  var languageSelectContraller = TextEditingController();
  var accessTypeContraller = TextEditingController();
  var accessSelectContraller = TextEditingController();

  List<DropdownMenuItem<String>> languageList = [];
  List<DropdownMenuItem<String>> accessRightsList = [];
//Contrallers initialization
  @override
  void initState() {
    loginController.text = '';
    passwordController.text = '';
    pinController.text = '';
    fioController.text = '';
    cardContraller.text = '';
    languageSelectContraller.text = "ru";
    accessTypeContraller.text = "notSelected".tr();
    accessSelectContraller.text = "0";

    super.initState();
    languageList = [
      DropdownMenuItem(value: "hy", child: MiddleText(text: 'armenian'.tr())),
      DropdownMenuItem(value: "ru", child: MiddleText(text: 'russian'.tr())),
      DropdownMenuItem(value: "en", child: MiddleText(text: 'english'.tr())),
    ];

    accessRightsList = [
      DropdownMenuItem(
          value: '0', child: MiddleText(text: 'cashAndManager'.tr())),
      DropdownMenuItem(value: '1', child: MiddleText(text: 'manager'.tr())),
      DropdownMenuItem(value: '2', child: MiddleText(text: 'cashStation'.tr())),
    ];
  }

//Is Loading check
  bool isLoading = false;
  final getAccessTypeState = GetIt.I<AccessState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appPurple,
        title: MiddleText(
          text: "newUser".tr(),
          color: AppColors.appWhite,
        ),
        actions: [
          TextButton(
            onPressed: onSave,
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
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 60, 0, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Container with Box Shadow
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
                      //Lodin Data
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: paddingHorizontal,
                              vertical: paddingVertical),
                          child: TextFormField(
                            controller: loginController,
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
                                    text: '* '.tr(),
                                    style: TextStyle(
                                        color: AppColors.appCoral,
                                        fontSize: Dimensions.font16),
                                    children: [
                                      TextSpan(
                                          text: 'login'.tr(),
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

                      //Password data
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: paddingHorizontal,
                              vertical: paddingVertical),
                          child: TextFormField(
                            controller: passwordController,
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
                                        fontSize: Dimensions.font16),
                                    children: [
                                      TextSpan(
                                          text: 'password'.tr(),
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

                      //Pincode data
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: paddingHorizontal,
                              vertical: paddingVertical),
                          child: TextFormField(
                            maxLength: pinLength,
                            keyboardType: TextInputType.number,
                            controller: pinController,
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
                                          text: 'pin'.tr(),
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

                      //Fio data
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: paddingHorizontal,
                              vertical: paddingVertical),
                          child: TextFormField(
                            controller: fioController,
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
                                    text: '* '.tr(),
                                    style: TextStyle(
                                        color: AppColors.appCoral,
                                        fontSize: Dimensions.font16),
                                    children: [
                                      TextSpan(
                                          text: 'fio'.tr(),
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

                      //Card data
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: paddingHorizontal,
                              vertical: paddingVertical),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller: cardContraller,
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
                              labelText: "card".tr(),
                              labelStyle: TextStyle(
                                  color: AppColors.appLightBlack,
                                  fontSize: Dimensions.font16),
                            ),
                          )),
                      SizedBox(
                        height: Dimensions.width15,
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: paddingHorizontal,
                              vertical: paddingVertical),
                          child: DropdownButtonFormField(
                              iconEnabledColor: AppColors.appCoral,
                              decoration: InputDecoration(
                                border: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.appLightBlack),
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColors.appCoral),
                                ),
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.appLightBlack),
                                ),
                                label: Row(
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                          text: '',
                                          style: TextStyle(
                                              color: AppColors.appCoral,
                                              fontSize: Dimensions.font16),
                                          children: [
                                            TextSpan(
                                                text: 'userLanguage'.tr(),
                                                style: TextStyle(
                                                  fontSize: Dimensions.font16,
                                                  color:
                                                      AppColors.appLightBlack,
                                                ))
                                          ]),
                                    ),
                                  ],
                                ),
                                labelStyle: const TextStyle(
                                    color: AppColors.appLightBlack),
                              ),
                              value: languageSelectContraller.text,
                              onChanged: (String? newValue) {
                                setState(() {
                                  languageSelectContraller.text = newValue!;
                                });
                              },
                              items: languageList)),
                      SizedBox(
                        height: Dimensions.height10,
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: paddingHorizontal,
                              vertical: paddingVertical),
                          child: DropdownButtonFormField(
                              iconEnabledColor: AppColors.appCoral,
                              decoration: InputDecoration(
                                border: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.appLightBlack),
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColors.appCoral),
                                ),
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.appLightBlack),
                                ),
                                label: Row(
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                          text: '',
                                          style: TextStyle(
                                              color: AppColors.appCoral,
                                              fontSize: Dimensions.font16),
                                          children: [
                                            TextSpan(
                                                text: 'accessRights'.tr(),
                                                style: TextStyle(
                                                  fontSize: Dimensions.font16,
                                                  color:
                                                      AppColors.appLightBlack,
                                                ))
                                          ]),
                                    ),
                                  ],
                                ),
                                labelStyle: TextStyle(
                                    color: AppColors.appLightBlack,
                                    fontSize: Dimensions.font16),
                              ),
                              value: accessSelectContraller.text,
                              onChanged: (String? newValue) {
                                setState(() {
                                  accessSelectContraller.text = newValue!;
                                });
                              },
                              items: accessRightsList)),
                      SizedBox(
                        height: Dimensions.height10,
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: paddingHorizontal,
                              vertical: paddingVertical),
                          child: Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                      width: 1.0,
                                      color: AppColors.appLightBlack),
                                ),
                              ),
                              child: Column(
                                children: [
                                  PopupMenuButton(

                                      // add icon, by default "3 dot" icon
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          RichText(
                                            text: TextSpan(
                                                text: '* ',
                                                style: TextStyle(
                                                    color: AppColors.appCoral,
                                                    fontSize:
                                                        Dimensions.font12),
                                                children: [
                                                  TextSpan(
                                                    text: "accessType".tr(),
                                                    style: TextStyle(
                                                        color: AppColors
                                                            .appLightBlack,
                                                        fontSize:
                                                            Dimensions.font12),
                                                  )
                                                ]),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(accessTypeContraller.text),
                                              CustomIcons.arrowDropDown,
                                            ],
                                          ),
                                        ],
                                      ),
                                      itemBuilder: (context) {
                                        return [
                                          for (int i = 0;
                                              i <
                                                  getAccessTypeState
                                                      .accessTypesList.length;
                                              i++)
                                            PopupMenuItem<int>(
                                                value: i,
                                                child: MiddleText(
                                                    text: getAccessTypeState
                                                        .accessTypesList[i]
                                                        .name)),
                                        ];
                                      },
                                      onSelected: (value) {
                                        for (int i = 0;
                                            i <
                                                getAccessTypeState
                                                    .accessTypesList.length;
                                            i++) {
                                          if (value == i) {
                                            setState(() {
                                              accessTypeContraller.text =
                                                  getAccessTypeState
                                                      .accessTypesList[i].name;
                                            });
                                          }
                                        }
                                      }),
                                  const SizedBox(
                                    height: 5,
                                  )
                                ],
                              ))),
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

  onSave() async {
    if (loginController.text == '' ||
        fioController.text == '' ||
        accessTypeContraller.text == 'notSelected'.tr() ||
        pinController.text == '' ||
        pinController.text.length != 4) {
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
      setState(() {
        isLoading = true;
      });

      try {
        await usersState.saveCreatedUser(
            cod: cardContraller.text,
            fio: fioController.text,
            id: 0,
            login: loginController.text,
            paswword: passwordController.text,
            pin: int.parse(pinController.text),
            shtrix: '',
            language: languageSelectContraller.text,
            tip: int.parse(accessSelectContraller.text),
            tipdostupa: accessTypeContraller.text);

        setState(() {
          isLoading = false;
        });
        router.pop();
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
}
