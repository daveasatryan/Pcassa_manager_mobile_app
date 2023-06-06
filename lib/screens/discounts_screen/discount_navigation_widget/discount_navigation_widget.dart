import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pcassa_retail/constants/app_themes/app_icons/app_icons.dart';
import 'package:pcassa_retail/constants/dimensions/dimensions.dart';
import 'package:pcassa_retail/constants/paddings_constants/padding_constants.dart';
import 'package:pcassa_retail/widgets/app_icons.dart';
import 'package:pcassa_retail/widgets/middle_text.dart';
import '../../../constants/app_themes/app_colors/app_colors.dart';
import '../../../enums/main_screen_navigation_enum/main_screen_navigations.dart';
import '../../../router/router.gr.dart';
import '../../../router/services.dart';
import '../../../store/currency_state/currency_state.dart';
import '../../../store/discount_state/discount_state.dart';
import '../../main_screen/widgets/navigation_bar_widget/navigation_bar.dart';

class DiscountNavigationPage extends StatefulWidget {
  const DiscountNavigationPage({Key? key, required this.quickMenuPagesType})
      : super(key: key);
  final QuickMenuPagesType quickMenuPagesType;

  @override
  State<DiscountNavigationPage> createState() => _DiscountNavigationPageState();
}

class _DiscountNavigationPageState extends State<DiscountNavigationPage> {
  final discountState = GetIt.I<CreatedDiscounts>();

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
        drawer: const NavDrawer(),
        appBar: AppBar(
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
        body: SingleChildScrollView(
          child: Observer(
            builder: (_) => GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 1,
              shrinkWrap: true,
              children: [
                for (int i = 0; i < discountState.discountInfo.length; i++)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                        paddingLeft, paddingTop, paddingRight, 0),
                    child: InkWell(
                      onTap: () {
                        router.replace(DiscountsRoute(
                            idd: discountState.discountInfo[i].id,
                            quickMenuPagesType: widget.quickMenuPagesType));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                  color: Color.fromARGB(51, 130, 132, 168),
                                  blurRadius: 20.0,
                                  offset: Offset(0, 10))
                            ]),
                        child: Center(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AppIcons(icon: Icons.discount),
                            SizedBox(
                              height: Dimensions.height20,
                            ),
                            MiddleText(
                              text: discountState.discountInfo[i].name,
                            ),
                          ],
                        )),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
