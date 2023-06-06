// ignore_for_file: prefer_typing_uninitialized_variables, use_build_context_synchronously

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:pcassa_retail/constants/app_themes/app_icons/app_icons.dart';
import 'package:pcassa_retail/constants/dimensions/dimensions.dart';
import 'package:pcassa_retail/constants/paddings_constants/padding_constants.dart';
import 'package:pcassa_retail/widgets/middle_text.dart';

import '../../../../constants/app_assets/app_assets.dart';
import '../../../../constants/app_themes/app_colors/app_colors.dart';
import '../../../../error_handler/error_handler.dart';
import '../../../../models/create_user_model/create_user_model.dart';
import '../../../../router/services.dart';
import '../../../../store/access_type_state/access_state.dart';
import '../../../../store/user_state/user_state.dart';

class UserEditWidget extends StatefulWidget {
  const UserEditWidget(
      {Key? key,
      required this.card,
      required this.fio,
      required this.id,
      required this.login,
      required this.password,
      required this.pin,
      required this.userInfo})
      : super(key: key);
  final String login;
  final password;
  final pin;
  final String fio;
  final card;
  final int id;
  final CreateUserModel userInfo;

  @override
  State<UserEditWidget> createState() => _UserEditWidgetState();
}

class _UserEditWidgetState extends State<UserEditWidget> {
  final usersState = GetIt.I<CreatedUsers>();
  final getAccessTypeState = GetIt.I<AccessState>();
  //Contraller Defination
  var loginController = TextEditingController();
  var passwordController = TextEditingController();
  var pinController = TextEditingController();
  var fioController = TextEditingController();
  var cardContraller = TextEditingController();
  var languageSelectContraller = TextEditingController();
  var accessTypeContraller = TextEditingController();
  var accessSelectContraller = TextEditingController();

  //Is Loading Check
  bool isLoading = false;
  //Pin Length Check
  int pinLength = 4;

  //Status Check
  bool? isChecked;
  //lists
  List<DropdownMenuItem<String>> languageList = [];
  List<DropdownMenuItem<String>> accessRightsList = [];
//Set
  Set<String> accessTypeDropdownSet = Set();

//Text Contraller DefinationaccessRightsList

  @override
  void initState() {
    loginController.text = widget.login;
    passwordController.text = widget.password.toString().replaceAll('null', '');
    pinController.text = widget.pin.toString();
    fioController.text = widget.fio;
    cardContraller.text = widget.card.toString();
    languageSelectContraller.text = widget.userInfo.language;
    accessTypeContraller.text =
        widget.userInfo.tipdostup.toString().replaceAll("null", "");
    accessSelectContraller.text = widget.userInfo.tip.toString();

    for (int i = 0; i < getAccessTypeState.accessTypesList.length; i++) {
      accessTypeDropdownSet
          .add(getAccessTypeState.accessTypesList[i].name.toString());
    }

    Map<String, String> accessTypeMap = {};
    var index = 0;
    for (var element in getAccessTypeState.accessTypesList) {
      accessTypeMap["name: " + '${index}'] = element.name;
      index++;
    }

    if (accessTypeMap.containsValue(widget.userInfo.tipdostup)) {
      accessTypeContraller.text = widget.userInfo.tipdostup!;
    } else {
      accessTypeContraller.text = "notSelected".tr();
    }
    super.initState();

    //Dropdown logic Groups

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

  final userState = GetIt.I<CreatedUsers>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MiddleText(
          text: widget.fio,
          color: AppColors.appWhite,
        ),
        backgroundColor: AppColors.appPurple,
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
          SizedBox(
            width: Dimensions.width15,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, paddingTop, 0, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(paddingAll),
                //Box Shadow Container for TextForm Fields
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
                      //Login data
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
                                      fontSize: Dimensions.font16,
                                    ),
                                    children: [
                                      TextSpan(
                                          text: 'login'.tr(),
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

                      //password data
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
                                    text: ''.tr(),
                                    style: TextStyle(
                                      color: AppColors.appCoral,
                                      fontSize: Dimensions.font16,
                                    ),
                                    children: [
                                      TextSpan(
                                          text: 'password'.tr(),
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

                      //pin data
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: paddingHorizontal,
                              vertical: paddingVertical),
                          child: TextFormField(
                            maxLength: pinLength,
                            maxLengthEnforcement: MaxLengthEnforcement.enforced,
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
                                    text: '* '.tr(),
                                    style: TextStyle(
                                      color: AppColors.appCoral,
                                      fontSize: Dimensions.font16,
                                    ),
                                    children: [
                                      TextSpan(
                                          text: 'pin'.tr(),
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

                      //fio data
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
                                      fontSize: Dimensions.font16,
                                    ),
                                    children: [
                                      TextSpan(
                                          text: 'fio'.tr(),
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
                                fontSize: Dimensions.font16,
                              ),
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
                                labelStyle: TextStyle(
                                    color: AppColors.appLightBlack,
                                    fontSize: Dimensions.font16),
                              ),
                              value: languageSelectContraller.text,
                              onChanged: (String? newValue) async {
                                setState(() {
                                  languageSelectContraller.text = newValue!;
                                });
                                await userState.changeUserLanguage(
                                    id: userState.authState.currentUser!.id,
                                    language: languageSelectContraller.text,
                                    tip: 'manager');
                                context.setLocale(
                                    Locale(languageSelectContraller.text));
                              },
                              items: languageList)),
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
                                  fontSize: Dimensions.font16,
                                ),
                              ),
                              value: accessSelectContraller.text,
                              onChanged: (String? newValue) {
                                setState(() {
                                  accessSelectContraller.text = newValue!;
                                });
                              },
                              items: accessRightsList)),
                      const SizedBox(
                        height: 10,
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
                                              MiddleText(
                                                  text: accessTypeContraller
                                                      .text),
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
                                                child: Text(getAccessTypeState
                                                    .accessTypesList[i].name)),
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
        pinController.text == '' ||
        accessTypeContraller.text == "notSelected".tr() ||
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
      try {
        setState(() {
          isLoading = true;
        });

        await usersState.saveCreatedUser(
            cod: cardContraller.text,
            fio: fioController.text,
            id: widget.id,
            tipdostupa: accessTypeContraller.text,
            language: languageSelectContraller.text,
            tip: int.parse(accessSelectContraller.text),
            login: loginController.text,
            paswword: passwordController.text,
            pin: int.parse(pinController.text),
            shtrix: '');
        usersState.usersInfo.clear();
        await usersState.getCreatedUsers();
        setState(() {
          isLoading = false;
        });
        router.pop();
      } catch (e) {
        if (e is DioError) {
          print(e);
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
