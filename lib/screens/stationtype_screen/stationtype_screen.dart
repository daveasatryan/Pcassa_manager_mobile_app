import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pcassa_retail/router/router.gr.dart';
import 'package:pcassa_retail/screens/stationtype_screen/stationtype_create_widget/stationtype_widget.dart';
import 'package:pcassa_retail/screens/stationtype_screen/stationtype_edit_widget/station_edit_widget.dart';
import 'package:pcassa_retail/widgets/big_text.dart';
import 'package:pcassa_retail/widgets/middle_text.dart';
import '../../constants/app_themes/app_colors/app_colors.dart';
import '../../constants/app_themes/app_icons/app_icons.dart';
import '../../constants/dimensions/dimensions.dart';
import '../../constants/paddings_constants/padding_constants.dart';
import '../../router/services.dart';
import '../../store/station_type_state/station_type_state.dart';
import '../../widgets/app_icons.dart';

//MAIN SCREEN FOR STATIONTYPE ITEMS
class StationTypeScreen extends StatefulWidget {
  const StationTypeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<StationTypeScreen> createState() => _StationTypeScreenState();
}

class _StationTypeScreenState extends State<StationTypeScreen> {
  bool isLoading = false;
  var stationTypeState = GetIt.I<StationTypeState>();

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
            text: "stationType".tr(),
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
            builder: (_) => ListView.builder(
                itemCount: stationTypeState.stationTypeList.length,
                itemBuilder: ((context, index) {
                  return Padding(
                      padding: EdgeInsets.all(5),
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.appWhite,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ExpansionTile(
                          leading: edit(
                              index: index,
                              id: stationTypeState.stationTypeList[index].id!),
                          subtitle: MiddleText(
                            text: stationTypeState
                                            .stationTypeList[index].rshet ==
                                        'null' ||
                                    stationTypeState
                                            .stationTypeList[index].rshet ==
                                        null
                                ? ""
                                : stationTypeState.stationTypeList[index].rshet
                                    .toString(),
                          ),
                          trailing: AppIcons(
                            icon: Icons.arrow_drop_down,
                            iconColor: AppColors.appCoral,
                            size: Dimensions.iconSize24,
                          ),
                          title: BigText(
                              text: stationTypeState.stationTypeList[index].name
                                  .toString()),
                          children: [
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(paddingAll),
                                    child: MiddleText(
                                      text: "description".tr() +
                                          " :"
                                              "   " +
                                          "${stationTypeState.stationTypeList[index].prim == "null" || stationTypeState.stationTypeList[index].prim == null ? "" : stationTypeState.stationTypeList[index].prim.toString()}",
                                    ),
                                  ),
                                ])
                          ],

                          //Unit Edit and Delete
                        ),
                      ));
                }))),
        //Add User Button
        persistentFooterButtons: [
          Padding(
            padding: const EdgeInsets.all(paddingAll),
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

  Widget edit({required int id, required int index}) {
    return PopupMenuButton(
        icon: AppIcons(
          icon: Icons.more_vert_rounded,
          iconColor: AppColors.appCoral,
          size: Dimensions.iconSize24,
        ),
        itemBuilder: (context) {
          return [
            PopupMenuItem<int>(
                value: 0,
                child: Row(
                  children: [
                    AppIcons(
                      icon: Icons.edit,
                      iconColor: AppColors.appCoral,
                      size: Dimensions.iconSize24,
                    ),
                    SizedBox(
                      width: Dimensions.width15,
                    ),
                    MiddleText(text: "edit".tr())
                  ],
                )),
            PopupMenuItem<int>(
                value: 1,
                child: Row(
                  children: [
                    AppIcons(
                      icon: Icons.delete,
                      iconColor: AppColors.appCoral,
                      size: Dimensions.iconSize24,
                    ),
                    SizedBox(
                      width: Dimensions.width15,
                    ),
                    MiddleText(text: "delete".tr())
                  ],
                )),
          ];
        },
        onSelected: (value) {
          if (value == 0) {
            //Edit Screen Route
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
                              borderRadius: BorderRadius.circular(
                                  Dimensions.borderRadius10),
                              boxShadow: const [
                                BoxShadow(
                                    color: Color.fromRGBO(143, 148, 251, .2),
                                    blurRadius: 20.0,
                                    offset: Offset(0, 10))
                              ]),
                          child: EditStationType(
                            cod: stationTypeState.stationTypeList[index].id,
                            stationTypeStateName:
                                stationTypeState.stationTypeList[index].name,
                            stationTypePrim:
                                stationTypeState.stationTypeList[index].prim,
                            stationTypeRshet:
                                stationTypeState.stationTypeList[index].rshet,
                          ),
                        ),
                      ),
                    ),
                  );
                });
          } else if (value == 1) {
            //Delete Functionality
            showDialog<void>(
              context: context,
              builder: (BuildContext context) {
                return StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                    return SizedBox(
                      height: Dimensions.deletePopUpHeight,
                      width: Dimensions.deletePopwidth,
                      child: SimpleDialog(
                        title: MiddleText(
                          text: "${'deleteStationType'.tr()} ?",
                        ),
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                  onPressed: () async {
                                    startLoad(setState);

                                    await stationTypeState.deleteStationType(
                                        id: id);
                                    endLoad(setState);
                                  },
                                  child: isLoading
                                      ? const CircularProgressIndicator(
                                          color: AppColors.appCoral,
                                        )
                                      : MiddleText(
                                          text: 'delete'.tr(),
                                          color: AppColors.appCoral,
                                        )),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: MiddleText(
                                    text: 'cancle'.tr(),
                                    color: AppColors.appCoral,
                                  )),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                );
              },
            );
          }
        });
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
                      borderRadius:
                          BorderRadius.circular(Dimensions.borderRadius10),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(143, 148, 251, .2),
                            blurRadius: Dimensions.borderRadius10 * 2,
                            offset: Offset(0, 10))
                      ]),
                  child: Column(
                    children: const [CreateStationType()],
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
