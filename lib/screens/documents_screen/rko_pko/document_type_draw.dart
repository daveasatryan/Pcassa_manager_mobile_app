import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pcassa_retail/constants/app_themes/app_colors/app_colors.dart';
import 'package:pcassa_retail/constants/app_themes/app_icons/app_icons.dart';
import 'package:pcassa_retail/constants/dimensions/dimensions.dart';
import 'package:pcassa_retail/router/router.gr.dart';
import 'package:pcassa_retail/router/services.dart';
import 'package:pcassa_retail/screens/documents_screen/rko_pko/pko.dart';
import 'package:pcassa_retail/screens/documents_screen/rko_pko/rko.dart';
import 'package:pcassa_retail/store/cash_order_state/cash_order_state.dart';
import 'package:pcassa_retail/widgets/app_icons.dart';
import 'package:pcassa_retail/widgets/big_text.dart';
import 'package:pcassa_retail/widgets/middle_text.dart';

class DocumentTypeDraw extends StatefulWidget {
  final int documentCod;
  final String documentName;
  const DocumentTypeDraw(
      {Key? key, required this.documentCod, required this.documentName})
      : super(key: key);

  @override
  State<DocumentTypeDraw> createState() => _DocumentTypeDrawState();
}

final cashOrderState = GetIt.I<CashOrderState>();

class _DocumentTypeDrawState extends State<DocumentTypeDraw> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        //trigger leaving and use own data
        
        showDialog<bool?>(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return SimpleDialog(
              title: MiddleText(
                text: "saveDocumentOrWillBeDelete".tr(),
              ),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () async {
                        await cashOrderState.delteCashOrdersByFilter(
                            id: cashOrderState.resultCashOrderModel!.id);
                        router.pop();
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
  Navigator.pop;
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
              onPressed: () async {
                await showDialog<bool?>(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return SimpleDialog(
                      title: MiddleText(
                        text: "saveDocumentOrWillBeDelete".tr(),
                      ),
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () async {
                                await cashOrderState.delteCashOrdersByFilter(
                                    id: cashOrderState
                                        .resultCashOrderModel!.id);
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
              text: widget.documentName,
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
                          text: "saveDocumentOrWillBeDelete".tr(),
                        ),
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                onPressed: () async {
                                  await cashOrderState.delteCashOrdersByFilter(
                                      id: cashOrderState
                                          .resultCashOrderModel!.id);
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
          body: Observer(
              builder: (_) => ListView(children: [
                    if (widget.documentCod == 22)
                      ExpendableCashOrder(
                        justClose: true,
                      )
                    else
                      IncomingCashOreder(
                        justClose: true,
                      )
                  ]))),
    );
  }
}
