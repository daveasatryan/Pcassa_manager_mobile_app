import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pcassa_retail/constants/dimensions/dimensions.dart';
import 'package:pcassa_retail/router/router.gr.dart';
import 'package:pcassa_retail/widgets/app_icons.dart';
import 'package:pcassa_retail/widgets/middle_text.dart';

import '../../../../constants/app_themes/app_colors/app_colors.dart';
import '../../../../error_handler/error_handler.dart';
import '../../../../router/services.dart';
import '../../../store/contragent_state/contragent_state.dart';
import '../contragent_add_and_edit_widget/contragent_create_widget.dart';
import '../contragent_add_and_edit_widget/contragent_edit_widget.dart';
import '../contragent_subcategory_part/contragent_subcategory_part.dart';
import '../contragents_elements_screen/contragents_elements_screen.dart';

class ContragentCategoryPart extends StatefulWidget {
  const ContragentCategoryPart({Key? key}) : super(key: key);

  @override
  State<ContragentCategoryPart> createState() => _ContragentCategoryPartState();
}

final getContragent = GetIt.I<ContragentState>();

class _ContragentCategoryPartState extends State<ContragentCategoryPart> {
  //StatusCheck
  bool isExpanded = true;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          //trigger leaving and use own data
          //router.replace(const MainRoute());
          //we need to return a future
          return Future.value(false);
        },
        child: Scaffold(
          //Draw Categories
          body: Observer(
            builder: (_) => ListView(
              children: [
                for (int i = 0;
                    i < getContragent.contragentsFirstLevel.length;
                    i++)
                  LayoutBuilder(
                    builder: (context, constraints) => InkWell(
                      child: ExpansionTile(
                        initiallyExpanded: true,
                        leading: AppIcons(
                          icon: Icons.arrow_drop_down,
                          size: Dimensions.iconSize24,
                        ),
                        trailing: SizedBox(
                          height: MediaQuery.of(context).size.height / 8.44,
                          width: MediaQuery.of(context).size.height / 8.44,
                          child: Row(
                            children: [
                              // Expanded(
                              //   child: PopupMenuButton(
                              //       // add icon, by default "3 dot" icon
                              //       icon: AppIcons(
                              //         icon: Icons.more_vert,
                              //         size: Dimensions.iconSize24,
                              //       ),
                              //       itemBuilder: (context) {
                              //         return [
                              //           PopupMenuItem<int>(
                              //               value: 0,
                              //               child: Row(
                              //                 children: [
                              //                   AppIcons(
                              //                     icon: Icons.edit,
                              //                     size: Dimensions.iconSize24,
                              //                   ),
                              //                   SizedBox(
                              //                     width: Dimensions.width15,
                              //                   ),
                              //                   MiddleText(
                              //                     text: "edit".tr(),
                              //                     size: Dimensions.font16,
                              //                   )
                              //                 ],
                              //               )),
                              //           PopupMenuItem<int>(
                              //               value: 1,
                              //               child: Row(
                              //                 children: [
                              //                   AppIcons(
                              //                     icon: Icons.delete,
                              //                     size: Dimensions.iconSize24,
                              //                   ),
                              //                   SizedBox(
                              //                     width: Dimensions.width15,
                              //                   ),
                              //                   MiddleText(
                              //                     text: "delete".tr(),
                              //                     size: Dimensions.font16,
                              //                   )
                              //                 ],
                              //               )),
                              //         ];
                              //       },
                              //       onSelected: (value) {
                              //         if (value == 0) {
                              //           //Category Edit sheet
                              //           showGeneralDialog(
                              //             context: context,
                              //             barrierDismissible: false,
                              //             transitionBuilder: (context,
                              //                 animation,
                              //                 secondaryAnimation,
                              //                 child) {
                              //               return FadeTransition(
                              //                 opacity: animation,
                              //                 child: ScaleTransition(
                              //                   scale: animation,
                              //                   child: child,
                              //                 ),
                              //               );
                              //             },
                              //             pageBuilder: (context, animation,
                              //                 secondaryAnimation) {
                              //               return Scaffold(
                              //                   appBar: AppBar(
                              //                     backgroundColor:
                              //                         AppColors.appPurple,
                              //                     title: MiddleText(
                              //                       text: getContragent
                              //                           .contragentsFirstLevel[
                              //                               i]
                              //                           .caption,
                              //                       color: AppColors.appWhite,
                              //                     ),
                              //                   ),
                              //                   body: EditContragent(
                              //                     guidOfCategories: getContragent
                              //                         .contragentsFirstLevel[i]
                              //                         .guid,
                              //                     isRoot: getContragent
                              //                         .contragentsFirstLevel[i]
                              //                         .isroot,
                              //                     nameOfCategories: getContragent
                              //                         .contragentsFirstLevel[i]
                              //                         .caption,
                              //                     parentGuidOfCategories:
                              //                         getContragent
                              //                             .contragentsFirstLevel[
                              //                                 i]
                              //                             .parentguid,
                              //                   ));
                              //             },
                              //           );
                              //         } else if (value == 1) {
                              //           //Delete category sheet
                              //           showDialog<void>(
                              //             context: context,
                              //             builder: (BuildContext context) {
                              //               return StatefulBuilder(
                              //                 builder: (BuildContext context,
                              //                     StateSetter setState) {
                              //                   return Row(
                              //                     mainAxisAlignment:
                              //                         MainAxisAlignment.center,
                              //                     children: [
                              //                       SizedBox(
                              //                         height: Dimensions
                              //                             .deletePopUpHeight,
                              //                         width: Dimensions
                              //                             .deletePopwidth,
                              //                         child: SimpleDialog(
                              //                           title: Text(
                              //                             "${'deleteContragentGroup'.tr()} ?",
                              //                             style:
                              //                                 Theme.of(context)
                              //                                     .textTheme
                              //                                     .subtitle1!
                              //                                     .copyWith(
                              //                                       color: AppColors
                              //                                           .appBlack,
                              //                                     ),
                              //                           ),
                              //                           children: [
                              //                             Row(
                              //                               mainAxisAlignment:
                              //                                   MainAxisAlignment
                              //                                       .center,
                              //                               children: [
                              //                                 TextButton(
                              //                                     onPressed:
                              //                                         () async {
                              //                                       startLoad(
                              //                                           setState);

                              //                                       try {
                              //                                         await getContragent.delGroup(
                              //                                             context:
                              //                                                 context,
                              //                                             guid: getContragent
                              //                                                 .contragentsFirstLevel[i]
                              //                                                 .guid);
                              //                                       } on DioError catch (e) {
                              //                                         await ErrorHandler
                              //                                             .errorModal(
                              //                                           context:
                              //                                               context,
                              //                                           errorCode:
                              //                                               e.response,
                              //                                         );
                              //                                       }

                              //                                       endLoad(
                              //                                           setState);
                              //                                     },
                              //                                     child: isLoading
                              //                                         ? const CircularProgressIndicator(
                              //                                             color:
                              //                                                 AppColors.appCoral,
                              //                                           )
                              //                                         : MiddleText(
                              //                                             text:
                              //                                                 'delete'.tr(),
                              //                                             color:
                              //                                                 AppColors.appCoral,
                              //                                           )),
                              //                                 TextButton(
                              //                                   onPressed: () {
                              //                                     Navigator.pop(
                              //                                         context);
                              //                                   },
                              //                                   child:
                              //                                       MiddleText(
                              //                                     text: 'cancle'
                              //                                         .tr(),
                              //                                     color: AppColors
                              //                                         .appCoral,
                              //                                   ),
                              //                                 ),
                              //                               ],
                              //                             )
                              //                           ],
                              //                         ),
                              //                       )
                              //                     ],
                              //                   );
                              //                 },
                              //               );
                              //             },
                              //           );
                              //         }
                              //       }),
                              // ),
                              // Expanded(
                              //   //Go to Products
                              //   child: IconButton(
                              //       onPressed: () {
                              //         openContragentElement(
                              //           mainCategoryGuid: getContragent
                              //               .contragentsFirstLevel[i].guid,
                              //           mainCategoryName: getContragent
                              //               .contragentsFirstLevel[i].caption,
                              //           isRoot: getContragent
                              //               .contragentsFirstLevel[i].isroot,
                              //         );
                              //       },
                              //       icon: AppIcons(
                              //         icon: Icons.note_alt_outlined,
                              //         size: Dimensions.iconSize24,
                              //       )),
                              // ),
                              Expanded(
                                  child: TextButton(
                                //Create Categories
                                onPressed: () {
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
                                              padding: const EdgeInsets.all(16),
                                              child: Container(
                                                  padding:
                                                      const EdgeInsets.all(5),
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius: BorderRadius
                                                          .circular(Dimensions
                                                              .borderRadius10),
                                                      boxShadow: const [
                                                        BoxShadow(
                                                            color:
                                                                Color.fromRGBO(
                                                                    143,
                                                                    148,
                                                                    251,
                                                                    .2),
                                                            blurRadius: 20.0,
                                                            offset:
                                                                Offset(0, 10))
                                                      ]),
                                                  child: CreateContragent(
                                                    isRoot: getContragent
                                                        .contragentsFirstLevel[
                                                            i]
                                                        .isroot,
                                                    parentGuid: getContragent
                                                        .contragentsFirstLevel[
                                                            i]
                                                        .guid,
                                                    title: 'nameOfContragent',
                                                  )),
                                            ),
                                          ),
                                        );
                                      });
                                },
                                child: MiddleText(
                                  text: "addGroup".tr(),
                                  color: AppColors.appCoral,
                                ),
                              )),
                            ],
                          ),
                        ),

                        onExpansionChanged: (value) {
                          isExpanded = value;
                          setState(() {});
                        },

                        title: MiddleText(
                          text: "all".tr(),
                        ),
                        children: [
                          SizedBox(
                            child: ContragentSubcategoryPart(
                                parentGuid: getContragent
                                    .contragentsFirstLevel[i].guid),
                          ),
                        ],
                        // ignore: prefer_const_literals_to_create_immutables
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ));
  }

//Route to Menu Elements
  Future<void> openContragentElement(
      {required mainCategoryGuid,
      required mainCategoryName,
      required isRoot}) async {
    await getContragent.groupingContragents(
        mainCategoryGuid: mainCategoryGuid, mainCategoryName: mainCategoryName);

    router.replace(ContragentElementRoute(
      mainCategoryName: mainCategoryName,
      isRoot: isRoot,
      mainCategoryGuid: mainCategoryGuid,
    ));
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
