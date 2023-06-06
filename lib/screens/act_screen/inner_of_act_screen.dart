import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pcassa_retail/constants/app_themes/app_colors/app_colors.dart';
import 'package:pcassa_retail/constants/app_themes/app_icons/app_icons.dart';
import 'package:pcassa_retail/constants/dimensions/dimensions.dart';
import 'package:pcassa_retail/router/router.gr.dart';
import 'package:pcassa_retail/router/services.dart';
import 'package:pcassa_retail/screens/act_screen/act_create.dart';
import 'package:pcassa_retail/screens/documents_screen/rko_pko/pko.dart';
import 'package:pcassa_retail/screens/documents_screen/rko_pko/rko.dart';
import 'package:pcassa_retail/store/act_view_state/act_view_state.dart';
import 'package:pcassa_retail/widgets/app_icons.dart';
import 'package:pcassa_retail/widgets/big_text.dart';
import 'package:pcassa_retail/widgets/middle_text.dart';

import '../../store/act_state/act_state.dart';

class InnerContentOfAct extends StatefulWidget {
  // final int documentCod;
  //  final String documentName;
  const InnerContentOfAct({
    Key? key,
  }) : super(key: key);

  @override
  State<InnerContentOfAct> createState() => _InnerContentOfActState();
}

final actOrderState = GetIt.I<ActState>();
final actViewState = GetIt.I<ActViewState>();

class _InnerContentOfActState extends State<InnerContentOfAct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: AppIcons(
              icon: Icons.arrow_back,
              iconColor: AppColors.appWhite,
              size: Dimensions.iconSize24,
            ),
            onPressed: () async {
              await showDialog<bool?>(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return SimpleDialog(
                    title: MiddleText(
                      text: "saveDocumentOrWillBeDelete",
                    ),
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () async {
                              await actViewState.delActFromList(
                                  id: actOrderState.actInfoForCreate!.id!);
                              router.replace(MainRoute());
                            },
                            child: Text('done'.tr()),
                          ),
                          TextButton(
                            onPressed: () async {
                              router.pop();
                            },
                            child: Text('close'.tr()),
                          ),
                        ],
                      )
                    ],
                  );
                },
              );
            },
          ),
          title: BigText(
            text: "acts",
            color: AppColors.appWhite,
          ),
          backgroundColor: AppColors.appPurple,
          actions: [
            IconButton(
              onPressed: () {
                showDialog<bool?>(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return SimpleDialog(
                      title: MiddleText(
                        text: "saveDocumentOrWillBeDelete",
                      ),
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () async {
                                await actViewState.delActFromList(
                                    id: actOrderState.actInfoForCreate!.id!);
                                router.replace(MainRoute());
                              },
                              child: Text('done'.tr()),
                            ),
                            TextButton(
                              onPressed: () async {
                                router.pop();
                              },
                              child: Text('close'.tr()),
                            ),
                          ],
                        )
                      ],
                    );
                  },
                );
              },
              icon: (CustomIcons.home),
            ),
          ],
        ),
        body:
            Observer(builder: (_) => ListView(children: [ActCreateScreen(justClose:true)])));
  }
}
