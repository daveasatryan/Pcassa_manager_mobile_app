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
import '../../main_screen/widgets/navigation_bar_widget/navigation_bar.dart';

class CurrencyNavigationPage extends StatefulWidget {
  const CurrencyNavigationPage({Key? key, required this.quickMenuPagesType})
      : super(key: key);
  final QuickMenuPagesType quickMenuPagesType;

  @override
  State<CurrencyNavigationPage> createState() => _CurrencyNavigationPageState();
}

class _CurrencyNavigationPageState extends State<CurrencyNavigationPage> {
  final currencyState = GetIt.I<CreatedCurrencys>();

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
                for (int i = 0; i < currencyState.currencyInfo.length; i++)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                        paddingLeft, paddingTop, paddingRight, 0),
                    child: InkWell(
                      onTap: () {
                        router.replace(CurrencysRoute(
                            currencyPageTypeCaption:
                                currencyState.currencyInfo[i].caption,
                            currencyPageTypeGuid:
                                currencyState.currencyInfo[i].guid));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                                Dimensions.borderRadius10),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromARGB(51, 130, 132, 168),
                                  blurRadius: Dimensions.borderRadius10 * 2,
                                  offset: Offset(0, 10))
                            ]),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AppIcons(
                                icon: Icons.currency_exchange,
                                size: Dimensions.iconSize48,
                              ),
                              SizedBox(
                                height: Dimensions.height10,
                              ),
                              MiddleText(
                                text: currencyState.currencyInfo[i].caption,
                              ),
                            ],
                          ),
                        ),
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
