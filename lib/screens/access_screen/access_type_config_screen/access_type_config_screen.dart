import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pcassa_retail/constants/dimensions/dimensions.dart';
import 'package:pcassa_retail/constants/paddings_constants/padding_constants.dart';
import 'package:pcassa_retail/router/router.gr.dart';
import 'package:pcassa_retail/store/access_type_state/access_state.dart';
import 'package:pcassa_retail/widgets/app_icons.dart';
import 'package:pcassa_retail/widgets/big_text.dart';
import 'package:pcassa_retail/widgets/middle_text.dart';

import '../../../constants/app_themes/app_colors/app_colors.dart';
import '../../../constants/app_themes/app_icons/app_icons.dart';
import '../../../router/services.dart';
import '../../../store/authorization_state/authorization_state.dart';
import '../../main_screen/widgets/navigation_bar_widget/navigation_bar.dart';

class AccessTypeConfigScreen extends StatefulWidget {
  const AccessTypeConfigScreen({Key? key, required this.id})
      : super(
          key: key,
        );
  final id;

  @override
  State<AccessTypeConfigScreen> createState() => _AccessTypeConfigScreenState();
}

class _AccessTypeConfigScreenState extends State<AccessTypeConfigScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  final getAccessType = GetIt.I<AccessState>();
  final getLoginInfo = GetIt.I<AuthorizationState>();
  //DataStatuss
  //ManagerStatuss

  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    context.setLocale(Locale(getLoginInfo.currentUser!.language.toString()));
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

    return WillPopScope(
        onWillPop: () {
          //trigger leaving and use own data
          router.replace(
            //
            const AccessRoute(),
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
                    const AccessRoute(),
                  );
                },
              ),
              bottom: TabBar(
                controller: _tabController,
                tabs: [
                  Tab(
                    child: MiddleText(
                      text: "manager".tr(),
                      color: AppColors.appWhite,
                    ),
                  ),
                  Tab(
                    child: MiddleText(
                      text: "cashStation".tr(),
                      color: AppColors.appWhite,
                    ),
                  ),
                ],
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
                      const AccessRoute(),
                    );
                  },
                  icon: (CustomIcons.home),
                ),
              ],
            ),
            body: Observer(
              builder: (_) => TabBarView(
                controller: _tabController,
                children: [
                  //manager
                  ListView(children: [
                    ExpansionTile(
                      title: BigText(
                        text: "productgroupaccess".tr(),
                      ),
                      children: [
                        Column(children: [
                          for (int i = 0;
                              i <
                                  getAccessType.configCategoty!.mananger
                                      .productgroupaccess.length;
                              i++)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(paddingAll),
                                  child: MiddleText(
                                    text: getAccessType.configCategoty!.mananger
                                        .productgroupaccess[i].name!
                                        .tr()
                                        .toString(),
                                  ),
                                ),
                                Expanded(
                                  child: CheckboxListTile(
                                      activeColor: AppColors.appCoral,
                                      value: getAccessType
                                          .configCategoty!
                                          .mananger
                                          .productgroupaccess[i]
                                          .status,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          getAccessType
                                              .configCategoty!
                                              .mananger
                                              .productgroupaccess[i]
                                              .status = value!;
                                        });
                                        sendData(
                                          name_component: getAccessType
                                              .configCategoty!
                                              .mananger
                                              .productgroupaccess[i]
                                              .name
                                              .toString(),
                                          value: value!,
                                          name_form: 'productgroupaccess',
                                          tip: 'mananger',
                                        );
                                      }),
                                ),
                              ],
                            ),
                        ])
                      ],
                    ),
                    ExpansionTile(
                      title: BigText(
                        text: "settingsaccess".tr(),
                      ),
                      children: [
                        Column(children: [
                          for (int i = 0;
                              i <
                                  getAccessType.configCategoty!.mananger
                                      .settingsaccess.length;
                              i++)
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(paddingAll),
                                  child: MiddleText(
                                    text: getAccessType.configCategoty!.mananger
                                        .settingsaccess[i].name!
                                        .tr()
                                        .toString(),
                                  ),
                                ),
                                Expanded(
                                  child: CheckboxListTile(
                                      activeColor: AppColors.appCoral,
                                      value: getAccessType.configCategoty!
                                          .mananger.settingsaccess[i].status,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          getAccessType
                                              .configCategoty!
                                              .mananger
                                              .settingsaccess[i]
                                              .status = value!;
                                        });
                                        sendData(
                                          name_component: getAccessType
                                              .configCategoty!
                                              .mananger
                                              .settingsaccess[i]
                                              .name
                                              .toString(),
                                          value: value!,
                                          name_form: 'settingsaccess',
                                          tip: 'mananger',
                                        );
                                      }),
                                ),
                              ],
                            ),
                        ])
                      ],
                    )
                  ]),
                  ListView(children: [
                    ExpansionTile(
                      title: BigText(text: "quick_check".tr()),
                      children: [
                        Column(children: [
                          for (int i = 0;
                              i <
                                  getAccessType
                                      .configCategoty!.kassa.quick_check.length;
                              i++)
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(paddingAll),
                                  child: MiddleText(
                                    text: getAccessType.configCategoty!.kassa
                                        .quick_check[i].name!
                                        .tr()
                                        .toString(),
                                  ),
                                ),
                                Expanded(
                                  child: CheckboxListTile(
                                      activeColor: AppColors.appCoral,
                                      value: getAccessType.configCategoty!.kassa
                                          .quick_check[i].status,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          getAccessType.configCategoty!.kassa
                                              .quick_check[i].status = value!;
                                        });
                                        sendData(
                                          name_component: getAccessType
                                              .configCategoty!
                                              .kassa
                                              .quick_check[i]
                                              .name
                                              .toString(),
                                          value: value!,
                                          name_form: 'quick_check',
                                          tip: 'kassa',
                                        );
                                      }),
                                ),
                              ],
                            ),
                        ])
                      ],
                    ),
                    ExpansionTile(
                      title: BigText(text: "TablesScreen".tr()),
                      children: [
                        Column(children: [
                          for (int i = 0;
                              i <
                                  getAccessType.configCategoty!.kassa
                                      .TablesScreen.length;
                              i++)
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(paddingAll),
                                  child: MiddleText(
                                    text: getAccessType.configCategoty!.kassa
                                        .TablesScreen[i].name!
                                        .tr()
                                        .toString(),
                                  ),
                                ),
                                Expanded(
                                  child: CheckboxListTile(
                                      activeColor: AppColors.appCoral,
                                      value: getAccessType.configCategoty!.kassa
                                          .TablesScreen[i].status,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          getAccessType.configCategoty!.kassa
                                              .TablesScreen[i].status = value!;
                                        });
                                        sendData(
                                          name_component: getAccessType
                                              .configCategoty!
                                              .kassa
                                              .TablesScreen[i]
                                              .name
                                              .toString(),
                                          value: value!,
                                          name_form: 'TablesScreen',
                                          tip: 'kassa',
                                        );
                                      }),
                                ),
                              ],
                            ),
                        ])
                      ],
                    )
                  ]),
                ],
              ),
            )));
  }

  sendData(
      {required String name_component,
      required bool value,
      required String name_form,
      required String tip}) async {
    await getAccessType.postAccessNotes(
        id_d: widget.id.toString(),
        name_form: name_form,
        name_component: name_component,
        tip: tip,
        status: value);
  }
}
