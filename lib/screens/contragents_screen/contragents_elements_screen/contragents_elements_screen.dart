// ignore_for_file: prefer_typing_uninitialized_variables, use_build_context_synchronously, sort_child_properties_last, unrelated_type_equality_checks
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pcassa_retail/constants/app_themes/app_icons/app_icons.dart';
import 'package:pcassa_retail/constants/dimensions/dimensions.dart';
import 'package:pcassa_retail/constants/paddings_constants/padding_constants.dart';
import 'package:pcassa_retail/router/router.gr.dart';
import 'package:pcassa_retail/screens/contragents_screen/contragent_add_and_edit_widget/contragent_edit_widget.dart';
import 'package:pcassa_retail/screens/products_screen/product_elements_screen/product_element_create_widget/product_element_create_widget.dart';
import 'package:pcassa_retail/screens/products_screen/product_elements_screen/product_element_edit_widget/product_element_edit_widget.dart';
import 'package:pcassa_retail/widgets/middle_text.dart';
//import 'package:scan/scan.dart';
import '../../../constants/app_themes/app_colors/app_colors.dart';
import '../../../router/services.dart';
import '../../../store/contragent_state/contragent_state.dart';
import '../../../store/product_state/product_state.dart';
import 'contragent_element_create_widget/contragent_element_create_widget.dart';
import 'contragents_elements_edit_widget/contragents_elements_edit_widget.dart';

class ContragentElementScreen extends StatefulWidget {
  const ContragentElementScreen({
    Key? key,
    required this.mainCategoryName,
    required this.isRoot,
    required this.mainCategoryGuid,
  }) : super(key: key);
  //Group Guid
  final mainCategoryName;
  final isRoot;
  final mainCategoryGuid;
  @override
  State<ContragentElementScreen> createState() =>
      _ContragentElementScreenState();
}

class _ContragentElementScreenState extends State<ContragentElementScreen> {
  //getproducts State
  final getContragent = GetIt.I<ContragentState>();

  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        //trigger leaving and use own data

        router.replace(const Contragents());

        //we need to return a future
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.appPurple,
          leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: AppColors.appWhite,
              ),
              onPressed: () {
                router.replace(const Contragents());
              }),
          actions: [
            Padding(
              padding: const EdgeInsets.all(paddingAll),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MiddleText(
                    text: widget.mainCategoryName,
                    color: AppColors.appWhite,
                  )
                ],
              ),
            )
          ],
        ),
        body: Observer(
            builder: (_) => getContragent.groupContragents.isEmpty
                ? Center(
                    child: MiddleText(
                      text: "emptyContragentList".tr(),
                      color: AppColors.appBlack,
                    ),
                  )
                : GridView.count(
                    controller: _scrollController,
                    crossAxisCount: 2,
                    childAspectRatio: 2,
                    children: [
                        for (int i = 0;
                            i < getContragent.groupContragents.length;
                            i++)
                          Padding(
                            padding: const EdgeInsets.all(5),
                            child: InkWell(
                              onTap: () {
                                showGeneralDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  transitionBuilder: (context, animation,
                                      secondaryAnimation, child) {
                                    return FadeTransition(
                                      opacity: animation,
                                      child: ScaleTransition(
                                        scale: animation,
                                        child: child,
                                      ),
                                    );
                                  },
                                  pageBuilder:
                                      (context, animation, secondaryAnimation) {
                                    return ContragentElementEdit(
                                      element:
                                          getContragent.groupContragents[i],
                                      isRoot: widget.isRoot,
                                      mainCategoryGuid: widget.mainCategoryGuid,
                                      mainCategoryName: widget.mainCategoryName,
                                    );
                                  },
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: AppColors.appCoral),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            paddingLeft, 0, 0, 0),
                                        child: Padding(
                                          padding: const EdgeInsets.all(2),
                                          child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  height: Dimensions.height10,
                                                ),
                                                MiddleText(
                                                  text:
                                                      "${getContragent.groupContragents[i].name}",
                                                  color: AppColors.appWhite,
                                                )
                                              ]),
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          ),
                      ])),
        persistentFooterButtons: [
          Padding(
            padding: const EdgeInsets.all(paddingAll),
            child: Stack(
              children: [
                FloatingActionButton(
                  backgroundColor: AppColors.appCoral,
                  onPressed: () {
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
                        return CreateContragentElement(
                          isRoot: widget.isRoot,
                          mainCategoryGuid: widget.mainCategoryGuid,
                          mainCategoryName: widget.mainCategoryName,
                          barCode: null,
                        );
                      },
                    );
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

  //display dialog

}
