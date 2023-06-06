import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pcassa_retail/constants/app_themes/app_icons/app_icons.dart';
import 'package:pcassa_retail/constants/dimensions/dimensions.dart';
import 'package:pcassa_retail/widgets/app_icons.dart';
import 'package:pcassa_retail/widgets/middle_text.dart';
import '../../../constants/app_themes/app_colors/app_colors.dart';
import '../../../router/router.gr.dart';
import '../../../router/services.dart';
import '../../store/contragent_state/contragent_state.dart';
import 'contragent_category_part/contragent_category_part.dart';

class Contragents extends StatefulWidget {
  const Contragents({
    Key? key,
  }) : super(key: key);
  @override
  State<Contragents> createState() => _ContragentsState();
}

class _ContragentsState extends State<Contragents> {
  //ScrolContraller
  final ScrollController _scrollController = ScrollController();
  final getContragents = GetIt.I<ContragentState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getContragents.groupContragents.clear();
  }

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
          title: MiddleText(
            text: 'contragents'.tr(),
            color: AppColors.appWhite,
          ),
          backgroundColor: AppColors.appPurple,
          actions: [
            IconButton(
                onPressed: () {
                  router.replace(const MainRoute());
                },
                icon: CustomIcons.home),
          ],
          leading: IconButton(
              onPressed: () {
                router.replace(const SettingsRoute());
              },
              icon: AppIcons(
                icon: Icons.arrow_back_sharp,
                iconColor: AppColors.appWhite,
                size: Dimensions.iconSize24,
              )),
        ),

        //ProductCategorysExpansion
        body: Observer(
          builder: (_) => getContragents.contragentCategoryList.isEmpty
              ? Center(
                  child: MiddleText(
                    text: "addContragentsGroup".tr(),
                    color: AppColors.appBlack,
                  ),
                )
              : Scrollable(
                  controller: _scrollController,
                  viewportBuilder:
                      (BuildContext context, ViewportOffset position) {
                    return const ContragentCategoryPart();
                  },
                ),
        )));

  //       persistentFooterButtons: [
  //         Padding(
  //           padding: const EdgeInsets.all(10),
  //           child: Stack(
  //             children: [
  //               FloatingActionButton(
  //                 backgroundColor: AppColors.appCoral,
  //                 onPressed: () {
  //                   _displayDialog(context);
  //                 },
  //                 child: const Icon(Icons.add),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // _displayDialog(BuildContext context) {
  //   showModalBottomSheet(
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(10.0),
  //       ),
  //       context: context,
  //       isScrollControlled: true,
  //       builder: (BuildContext context) {
  //         return SingleChildScrollView(
  //           child: Container(
  //             padding: EdgeInsets.only(
  //                 bottom: MediaQuery.of(context).viewInsets.bottom),
  //             child: Padding(
  //               padding: const EdgeInsets.all(paddingAll),
  //               child: Container(
  //                 padding: const EdgeInsets.all(5),
  //                 decoration: BoxDecoration(
  //                     color: Colors.white,
  //                     borderRadius: BorderRadius.circular(10),
  //                     boxShadow: const [
  //                       BoxShadow(
  //                           color: Color.fromRGBO(143, 148, 251, .2),
  //                           blurRadius: 20.0,
  //                           offset: Offset(0, 10))
  //                     ]),
  //                 child: Column(
  //                   children: const [
  //                     //Create Group Sheet
  //                     CreateContragent(
  //                       isRoot: 0,
  //                       parentGuid: "9d160d60-4c16-4ff7-b9f4-459c93313d14",
  //                       title: 'nameOfContragentsGroup',
  //                     )
  //                   ],
  //                 ),
  //               ),
  //             ),
  //           ),
  //         );
  //       });
  // }
      
  }
}
