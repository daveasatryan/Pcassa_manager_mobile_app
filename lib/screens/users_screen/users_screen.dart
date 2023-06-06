import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pcassa_retail/constants/dimensions/dimensions.dart';
import 'package:pcassa_retail/constants/paddings_constants/padding_constants.dart';
import 'package:pcassa_retail/enums/main_screen_navigation_enum/main_screen_navigations.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pcassa_retail/screens/users_screen/users_screen_widgets/user_create_widget/user_create_widget.dart';
import 'package:pcassa_retail/screens/users_screen/users_screen_widgets/user_edit_widget/user_edit_wiget.dart';
import 'package:pcassa_retail/widgets/app_icons.dart';
import 'package:pcassa_retail/widgets/big_text.dart';
import 'package:pcassa_retail/widgets/middle_text.dart';
import '../../constants/app_themes/app_colors/app_colors.dart';
import '../../constants/app_themes/app_icons/app_icons.dart';
import '../../error_handler/error_handler.dart';
import '../../router/router.gr.dart';
import '../../router/services.dart';
import '../../store/user_state/user_state.dart';
import '../main_screen/widgets/navigation_bar_widget/navigation_bar.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({Key? key, required this.quickMenuPagesType})
      : super(key: key);
  final QuickMenuPagesType quickMenuPagesType;
  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  final userState = GetIt.I<CreatedUsers>();

  bool isLoading = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        //trigger leaving and use own data
        router.replace(
          const MainRoute(),
        );
        //we need to return a future
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: AppIcons(
              icon: Icons.arrow_back,
              iconColor: AppColors.appWhite,
              size: Dimensions.iconSize24,
            ),
            onPressed: () {
              router.pop();
            },
          ),
          title: MiddleText(
            text: "${widget.quickMenuPagesType}".tr(),
            color: AppColors.appWhite,
          ),
          backgroundColor: AppColors.appPurple,
          actions: [
            IconButton(
              onPressed: () {
                router.replace(
                  const MainRoute(),
                );
              },
              icon: (CustomIcons.home),
            ),
          ],
        ),
        body: Observer(
          builder: (_) =>
              GridView.count(crossAxisCount: 1, childAspectRatio: 3, children: [
            for (var i = 0; i < userState.usersInfo.length; i++)
              Padding(
                padding: const EdgeInsets.all(paddingAll),
                child: InkWell(
                  onTap: () {
                    showGeneralDialog(
                      context: context,
                      barrierDismissible: false,
                      transitionBuilder:
                          (context, animation, secondaryAnimation, child) {
                        return FadeTransition(
                          opacity: animation,
                          child: ScaleTransition(
                            scale: animation,
                            child: child,
                          ),
                        );
                      },
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return UserEditWidget(
                          card: userState.usersInfo[i].card.first.cod,
                          id: userState.usersInfo[i].id,
                          login: userState.usersInfo[i].login,
                          fio: userState.usersInfo[i].fio,
                          password: userState.usersInfo[i].paswword,
                          pin: userState.usersInfo[i].pin.toString(),
                          userInfo: userState.usersInfo[i],
                        );
                      },
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                              color: Color.fromARGB(51, 130, 132, 168),
                              blurRadius: 20.0,
                              offset: Offset(0, 10))
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(paddingAll),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //userIcon
                          Expanded(
                              child: AppIcons(
                            icon: Icons.person,
                            size: Dimensions.iconSize48,
                          )),
                          //userName And Card Number
                          Expanded(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  BigText(
                                    text: userState.usersInfo[i].fio,
                                    color: AppColors.appBlack,
                                  ),
                                  //userCard
                                  if (userState.usersInfo[i].card.first.cod ==
                                      "")
                                    MiddleText(
                                      text: 'noCard'.tr(),
                                    )
                                  else
                                    MiddleText(
                                      text:
                                          userState.usersInfo[i].card.first.cod,
                                    ),
                                ]),
                          ),
                          //User Delete
                          Expanded(
                            child: IconButton(
                                onPressed: () {
                                  showDialog<void>(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return StatefulBuilder(
                                        builder: (BuildContext context,
                                            StateSetter setState) {
                                          return Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                height: Dimensions
                                                    .deletePopUpHeight,
                                                width:
                                                    Dimensions.deletePopwidth,
                                                child: SimpleDialog(
                                                  title: MiddleText(
                                                    text:
                                                        "${'deleteUser'.tr()} ?",
                                                  ),
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        TextButton(
                                                            onPressed:
                                                                () async {
                                                              startLoad(
                                                                  setState);
                                                              try {
                                                                await userState
                                                                    .deleteUsers(
                                                                        userId: userState
                                                                            .usersInfo[i]
                                                                            .id);
                                                                await userState
                                                                    .getCreatedUsers();
                                                              } catch (e) {
                                                                if (e
                                                                    is DioError) {
                                                                  await ErrorHandler
                                                                      .errorModal(
                                                                    context:
                                                                        context,
                                                                    errorCode: e
                                                                        .response,
                                                                  );
                                                                } else {
                                                                  print(e
                                                                      .toString());
                                                                }
                                                              }
                                                              endLoad(setState);
                                                              router.pop();
                                                            },
                                                            child: isLoading
                                                                ? const CircularProgressIndicator(
                                                                    color: AppColors
                                                                        .appCoral,
                                                                  )
                                                                : MiddleText(
                                                                    text: 'delete'
                                                                        .tr(),
                                                                    color: AppColors
                                                                        .appCoral,
                                                                  )),
                                                        TextButton(
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: MiddleText(
                                                            text: 'cancle'.tr(),
                                                            color: AppColors
                                                                .appCoral,
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          );
                                        },
                                      );
                                    },
                                  );
                                },
                                icon: AppIcons(
                                  icon: Icons.delete,
                                  size: Dimensions.iconSize24,
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
          ]),
        ),
        //Add User Button
        persistentFooterButtons: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Stack(
              children: [
                FloatingActionButton(
                  backgroundColor: AppColors.appCoral,
                  onPressed: () {
                    _displayDialog(context);
                  },
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _displayDialog(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: false,
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: ScaleTransition(
            scale: animation,
            child: child,
          ),
        );
      },
      pageBuilder: (context, animation, secondaryAnimation) {
        return const UserCreateWidget();
      },
    );
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
    });
  }
}
