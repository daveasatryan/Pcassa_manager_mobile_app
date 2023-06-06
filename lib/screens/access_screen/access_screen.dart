import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pcassa_retail/constants/paddings_constants/padding_constants.dart';
import 'package:pcassa_retail/screens/access_screen/access_screen_create_widget/access_screen_create_widget.dart';
import 'package:pcassa_retail/store/access_type_state/access_state.dart';

import '../../constants/app_themes/app_colors/app_colors.dart';
import '../../constants/app_themes/app_icons/app_icons.dart';
import '../../constants/dimensions/dimensions.dart';
import '../../error_handler/error_handler.dart';
import '../../router/router.gr.dart';
import '../../router/services.dart';
import '../../widgets/app_icons.dart';
import '../../widgets/big_text.dart';
import '../../widgets/middle_text.dart';
import '../main_screen/widgets/navigation_bar_widget/navigation_bar.dart';
import 'access_screen_edit_widget/access_screen_edit_widget.dart';

class AccessScreen extends StatefulWidget {
  const AccessScreen({Key? key}) : super(key: key);

  @override
  State<AccessScreen> createState() => _AccessScreenState();
}

class _AccessScreenState extends State<AccessScreen> {
  final getAccessType = GetIt.I<AccessState>();

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        //trigger leaving and use own data
        router.replace(
          const SettingsRoute(),
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
              router.replace(
                const SettingsRoute(),
              );
            },
          ),
          title: BigText(
            text: "accessType".tr(),
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
              GridView.count(crossAxisCount: 1, childAspectRatio: 4, children: [
            for (var i = 0; i < getAccessType.accessTypesList.length; i++)
              Padding(
                  padding: EdgeInsets.all(paddingAll),
                  child: InkWell(
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: AppColors.appCoral,
                        borderRadius:
                            BorderRadius.circular(Dimensions.borderRadius10),
                      ),
                      child: Row(
                        children: [
                          //Category
                          Expanded(
                              child: AppIcons(
                            icon: Icons.settings,
                            iconColor: AppColors.appWhite,
                            size: Dimensions.iconSize24,
                          )),
                          //CategoryName
                          Expanded(
                            child: BigText(
                              text: getAccessType.accessTypesList[i].name,
                              color: AppColors.appWhite,
                            ),
                          ),
                          //Unit Edit and Delete
                          Expanded(
                            child: PopupMenuButton(
                                // add icon, by default "3 dot" icon
                                icon: CustomIcons.more_vert_white,
                                itemBuilder: (context) {
                                  return [
                                    PopupMenuItem<int>(
                                        value: 0,
                                        child: Row(
                                          children: [
                                            isLoading == true
                                                ? const CircularProgressIndicator(
                                                    color: AppColors.appCoral,
                                                  )
                                                : CustomIcons.access,
                                            SizedBox(
                                              width: Dimensions.width15,
                                            ),
                                            MiddleText(
                                              text: "access".tr(),
                                            )
                                          ],
                                        )),
                                    PopupMenuItem<int>(
                                        value: 1,
                                        child: Row(
                                          children: [
                                            CustomIcons.edit,
                                            SizedBox(
                                              width: Dimensions.width15,
                                            ),
                                            MiddleText(
                                              text: "edit".tr(),
                                            )
                                          ],
                                        )),
                                    PopupMenuItem<int>(
                                        value: 2,
                                        child: Row(
                                          children: [
                                            CustomIcons.delete,
                                            SizedBox(
                                              width: Dimensions.width15,
                                            ),
                                            MiddleText(text: "delete".tr())
                                          ],
                                        )),
                                  ];
                                },
                                onSelected: (value) async {
                                  if (value == 0) {
                                    try {
                                      await getAccessType.getAcessNotes(
                                          id: getAccessType
                                              .accessTypesList[i].id);
                                    } on DioError catch (e) {
                                      await ErrorHandler.errorModal(
                                        context: context,
                                        errorCode: e.response,
                                      );
                                    }

                                    router.replace(AccessTypeConfigRoute(
                                        id: getAccessType
                                            .accessTypesList[i].id));
                                  } else if (value == 1) {
                                    //Edit Screen Route
                                    showModalBottomSheet(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              Dimensions.borderRadius10),
                                        ),
                                        context: context,
                                        isScrollControlled: true,
                                        builder: (BuildContext context) {
                                          return SingleChildScrollView(
                                            child: Container(
                                              padding: EdgeInsets.only(
                                                  bottom: MediaQuery.of(context)
                                                      .viewInsets
                                                      .bottom),
                                              child: Padding(
                                                padding:
                                                    EdgeInsets.all(paddingAll),
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.all(5),
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius: BorderRadius
                                                          .circular(Dimensions
                                                              .borderRadius10),
                                                      boxShadow: [
                                                        BoxShadow(
                                                            color:
                                                                Color.fromRGBO(
                                                                    143,
                                                                    148,
                                                                    251,
                                                                    .2),
                                                            blurRadius: Dimensions
                                                                    .borderRadius10 *
                                                                2,
                                                            offset:
                                                                Offset(0, 10))
                                                      ]),
                                                  child: Column(
                                                    children: [
                                                      EditAccessType(
                                                        accessTypeName:
                                                            getAccessType
                                                                .accessTypesList[
                                                                    i]
                                                                .name,
                                                        id: getAccessType
                                                            .accessTypesList[i]
                                                            .id,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        });
                                  } else if (value == 2) {
                                    //Delete Functionality
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
                                                          "${'deleteAccessGroup'.tr()} ?",
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
                                                                await getAccessType
                                                                    .deleteAcessTypes(
                                                                        id: getAccessType
                                                                            .accessTypesList[i]
                                                                            .id);

                                                                endLoad(
                                                                    setState);
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
                                                                text: 'cancle'
                                                                    .tr(),
                                                                color: AppColors
                                                                    .appCoral,
                                                              )),
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
                                  }
                                }),
                          ),
                        ],
                      ),
                    ),
                  )),
          ]),
        ),
        //Add User Button
        persistentFooterButtons: [
          Padding(
            padding: EdgeInsets.all(paddingAll),
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
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Padding(
                padding: const EdgeInsets.all(paddingAll),
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                            color: Color.fromRGBO(143, 148, 251, .2),
                            blurRadius: 20.0,
                            offset: Offset(0, 10))
                      ]),
                  child: Column(
                    children: const [CreateAccessType()],
                  ),
                ),
              ),
            ),
          );
        });
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
