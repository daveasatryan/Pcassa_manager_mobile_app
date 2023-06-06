import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pcassa_retail/constants/dimensions/dimensions.dart';
import 'package:pcassa_retail/router/router.gr.dart';
import 'package:pcassa_retail/screens/products_screen/products_group_screen/products_subcategory_part/producrs_subcategory_part.dart';
import 'package:pcassa_retail/widgets/app_icons.dart';
import 'package:pcassa_retail/widgets/middle_text.dart';
import '../../../../constants/app_themes/app_colors/app_colors.dart';
import '../../../../router/services.dart';
import '../../../../store/authorization_state/authorization_state.dart';
import '../../../../store/product_state/product_state.dart';
import '../products_categories_add_and_edit_wigdets/products_categories_create_widget.dart';

class ProductsCategoryPart extends StatefulWidget {
  const ProductsCategoryPart({Key? key}) : super(key: key);

  @override
  State<ProductsCategoryPart> createState() => _ProductsCategoryPartState();
}

final getProducts = GetIt.I<CreatedProducts>();
final authState = GetIt.I<AuthorizationState>();

class _ProductsCategoryPartState extends State<ProductsCategoryPart> {
  //StatusCheck
  bool isExpanded = true;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          //trigger leaving and use own data
          router.replace(const MainRoute());
          //we need to return a future
          return Future.value(false);
        },
        child: Scaffold(
          //Draw Categories
          body: Observer(
            builder: (_) => getProducts.productsCategoryList.isEmpty
                ? Center(
                    child: MiddleText(
                      text: "addCategory".tr(),
                      color: AppColors.appBlack,
                    ),
                  )
                : ListView(
                    children: [
                      for (int i = 0;
                          i < getProducts.categoriesFirstLevel.length;
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
                                height:
                                    MediaQuery.of(context).size.height / 8.44,
                                width:
                                    MediaQuery.of(context).size.height / 8.44,
                                child: Row(
                                  children: [
                                    // if (!authState.currentUser!.dostup
                                    //         .productgroupaccess
                                    //         .contains('editgroup') &&
                                    //     !authState.currentUser!.dostup
                                    //         .productgroupaccess
                                    //         .contains('deletegroup'))
                                    // Expanded(
                                    //   child: PopupMenuButton(
                                    //       // add icon, by default "3 dot" icon
                                    //       icon: CustomIcons.more_vert,
                                    //       itemBuilder: (context) {
                                    //         return [
                                    //           if (!authState.currentUser!
                                    //               .dostup.productgroupaccess
                                    //               .contains('editgroup'))
                                    //             PopupMenuItem<int>(
                                    //                 value: 0,
                                    //                 child: Row(
                                    //                   children: [
                                    //                     const Icon(Icons.edit,
                                    //                         size: 26,
                                    //                         color: AppColors
                                    //                             .appCoral),
                                    //                     const SizedBox(
                                    //                       width: 15,
                                    //                     ),
                                    //                     const Text("edit")
                                    //                         .tr()
                                    //                   ],
                                    //                 )),
                                    //           // if (!authState.currentUser!
                                    //           //     .dostup.productgroupaccess
                                    //           //     .contains('deletegroup'))
                                    //           //   PopupMenuItem<int>(
                                    //           //       value: 1,
                                    //           //       child: Row(
                                    //           //         children: [
                                    //           //           CustomIcons.delete,
                                    //           //           const SizedBox(
                                    //           //             width: 15,
                                    //           //           ),
                                    //           //           const Text("delete")
                                    //           //               .tr()
                                    //           //         ],
                                    //           //       )),
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
                                    //             pageBuilder: (context,
                                    //                 animation,
                                    //                 secondaryAnimation) {
                                    //               return Scaffold(
                                    //                   appBar: AppBar(
                                    //                     backgroundColor:
                                    //                         AppColors
                                    //                             .appPurple,
                                    //                     title: Text(getProducts
                                    //                         .categoriesFirstLevel[
                                    //                             i]
                                    //                         .caption),
                                    //                   ),
                                    //                   body: EditCategories(
                                    //                     guidOfCategories:
                                    //                         getProducts
                                    //                             .categoriesFirstLevel[
                                    //                                 i]
                                    //                             .guid,
                                    //                     isRoot: getProducts
                                    //                         .categoriesFirstLevel[
                                    //                             i]
                                    //                         .isroot,
                                    //                     nameOfCategories:
                                    //                         getProducts
                                    //                             .categoriesFirstLevel[
                                    //                                 i]
                                    //                             .caption,
                                    //                     parentGuidOfCategories:
                                    //                         getProducts
                                    //                             .categoriesFirstLevel[
                                    //                                 i]
                                    //                             .parentguid,
                                    //                   ));
                                    //             },
                                    //           );
                                    //         } else if (value == 1) {
                                    //           //Delete category sheet
                                    //           showDialog<void>(
                                    //             context: context,
                                    //             builder:
                                    //                 (BuildContext context) {
                                    //               return StatefulBuilder(
                                    //                 builder:
                                    //                     (BuildContext context,
                                    //                         StateSetter
                                    //                             setState) {
                                    //                   return Row(
                                    //                     mainAxisAlignment:
                                    //                         MainAxisAlignment
                                    //                             .center,
                                    //                     children: [
                                    //                       SimpleDialog(
                                    //                         title: Text(
                                    //                           "${'deleteGroup'.tr()} ?",
                                    //                           style: Theme.of(
                                    //                                   context)
                                    //                               .textTheme
                                    //                               .subtitle1!
                                    //                               .copyWith(
                                    //                                 color: AppColors
                                    //                                     .appBlack,
                                    //                               ),
                                    //                         ),
                                    //                         children: [
                                    //                           Row(
                                    //                             mainAxisAlignment:
                                    //                                 MainAxisAlignment
                                    //                                     .center,
                                    //                             children: [
                                    //                               TextButton(
                                    //                                   onPressed:
                                    //                                       () async {
                                    //                                     startLoad(
                                    //                                         setState);

                                    //                                     try {
                                    //                                       await getProducts.delGroup(
                                    //                                           context: context,
                                    //                                           guid: getProducts.categoriesFirstLevel[i].guid);
                                    //                                     } on DioError catch (e) {
                                    //                                       await ErrorHandler.errorModal(
                                    //                                         context: context,
                                    //                                         errorCode: e.response,
                                    //                                       );
                                    //                                     }

                                    //                                     endLoad(
                                    //                                         setState);
                                    //                                   },
                                    //                                   child: isLoading
                                    //                                       ? const CircularProgressIndicator(
                                    //                                           color: AppColors.appCoral,
                                    //                                         )
                                    //                                       : Text(
                                    //                                           'delete'.tr(),
                                    //                                           style: Theme.of(context).textTheme.subtitle2!.copyWith(color: AppColors.appCoral),
                                    //                                         )),
                                    //                               TextButton(
                                    //                                 onPressed:
                                    //                                     () {
                                    //                                   Navigator.pop(
                                    //                                       context);
                                    //                                 },
                                    //                                 child:
                                    //                                     Text(
                                    //                                   'cancle'
                                    //                                       .tr(),
                                    //                                   style: Theme.of(context)
                                    //                                       .textTheme
                                    //                                       .subtitle2!
                                    //                                       .copyWith(
                                    //                                         color: AppColors.appCoral,
                                    //                                       ),
                                    //                                 ),
                                    //                               ),
                                    //                             ],
                                    //                           )
                                    //                         ],
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
                                    //         openMenuElement(
                                    //           mainCategoryGuid: getProducts
                                    //               .categoriesFirstLevel[i].guid,
                                    //           mainCategoryName: getProducts
                                    //               .categoriesFirstLevel[i]
                                    //               .caption,
                                    //           isRoot: getProducts
                                    //               .categoriesFirstLevel[i]
                                    //               .isroot,
                                    //         );
                                    //       },
                                    //       icon: CustomIcons.productSmall),
                                    // ),
                                    if (!authState
                                        .currentUser!.dostup.productgroupaccess
                                        .contains('addgroup'))
                                      Expanded(
                                          child: TextButton(
                                        //Create Categories
                                        onPressed: () {
                                          showModalBottomSheet(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        Dimensions
                                                            .borderRadius10),
                                              ),
                                              context: context,
                                              isScrollControlled: true,
                                              builder: (BuildContext context) {
                                                return SingleChildScrollView(
                                                  child: Container(
                                                    padding: EdgeInsets.only(
                                                        bottom: MediaQuery.of(
                                                                context)
                                                            .viewInsets
                                                            .bottom),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              16),
                                                      child: Container(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(5),
                                                          decoration: BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                              borderRadius:
                                                                  BorderRadius.circular(
                                                                      Dimensions
                                                                          .borderRadius10),
                                                              boxShadow: const [
                                                                BoxShadow(
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            143,
                                                                            148,
                                                                            251,
                                                                            .2),
                                                                    blurRadius:
                                                                        20.0,
                                                                    offset:
                                                                        Offset(
                                                                            0,
                                                                            10))
                                                              ]),
                                                          child: CreateGroup(
                                                            isRoot: getProducts
                                                                .categoriesFirstLevel[
                                                                    i]
                                                                .isroot,
                                                            parentGuid: getProducts
                                                                .categoriesFirstLevel[
                                                                    i]
                                                                .guid,
                                                            title:
                                                                'nameOfCategory',
                                                          )),
                                                    ),
                                                  ),
                                                );
                                              });
                                        },
                                        child: MiddleText(
                                          text: "addgroup".tr(),
                                          color: AppColors.appCoral,
                                        ),
                                      )),
                                  ],
                                ),
                              ),

                              title: MiddleText(
                                text: "all".tr(),
                              ),
                              onExpansionChanged: (value) {
                                isExpanded = value;
                                setState(() {});
                              },

                              children: [
                                SizedBox(
                                  child: ProductSubcategoryPart(
                                      parentGuid: getProducts
                                          .categoriesFirstLevel[i].guid),
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
  Future<void> openMenuElement(
      {required mainCategoryGuid,
      required mainCategoryName,
      required isRoot}) async {
    await getProducts.groupingProduct(
        mainCategoryGuid: mainCategoryGuid, mainCategoryName: mainCategoryName);
    await getCategoryType.getCategory();
    await getUnitType.getUnit();
 
 
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
