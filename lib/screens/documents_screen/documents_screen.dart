import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import '../../constants/app_themes/app_colors/app_colors.dart';
import '../../constants/app_themes/app_icons/app_icons.dart';
import '../../enums/main_screen_navigation_enum/documents_screen_enum.dart';
import '../../router/router.gr.dart';
import '../../router/services.dart';
import '../../store/currency_state/currency_state.dart';
import '../../store/nakl_info_state/nakl_info_state.dart';
import '../../widgets/documents_type_draw.dart';
import '../../widgets/middle_text.dart';

class DocumentScreen extends StatefulWidget {
  final DocumentsScreenType documentsScreenType;
  const DocumentScreen({Key? key, required this.documentsScreenType})
      : super(key: key);

  @override
  State<DocumentScreen> createState() => _DocumentScreenState();
}

  final naklInfoState = GetIt.I<NaklInfoState>();
var currencyState = GetIt.I<CreatedCurrencys>();
class _DocumentScreenState extends State<DocumentScreen> {
  @override
  void initState() {
    super.initState();
    naklInfoState.naklInfoTovars.clear();
  }
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
            appBar: AppBar(
              title: MiddleText(
                text: "${widget.documentsScreenType}".tr(),
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
                    icon: CustomIcons.home)
              ],
              leading: IconButton(
                  onPressed: () {
                    router.pop();
                  },
                  icon: const Icon(Icons.arrow_back_sharp)),
            ),
            body: Observer(
                builder: (_) => GridView.count(
                      crossAxisCount: 1,
                      childAspectRatio: 6,
                      children: [
                        DocumentsTypeDraw(
                          title: "purchaseInvoice".tr(),
                          documentsScreenType: widget.documentsScreenType,
                          documentCode: 15,
                        ),
                        DocumentsTypeDraw(
                          title: "salesInvoice".tr(),
                          documentsScreenType: widget.documentsScreenType,
                          documentCode: 16,
                        ),
                        DocumentsTypeDraw(
                          title: "writeOff".tr(),
                          documentsScreenType: widget.documentsScreenType,
                          documentCode: 17,
                        ),
                        DocumentsTypeDraw(
                          title: "inwardMovement".tr(),
                          documentsScreenType: widget.documentsScreenType,
                          documentCode: 18,
                        ),
                        DocumentsTypeDraw(
                          title: "returnOfGoodsFromTheBuyer".tr(),
                          documentsScreenType: widget.documentsScreenType,
                          documentCode: 19,
                        ),
                        // DocumentsTypeDraw(
                        //   title: "collationStatement".tr(),
                        //   documentsScreenType: widget.documentsScreenType,
                        //   documentCode: 20,
                        // ),
                        DocumentsTypeDraw(
                          title: "returnOfGoodsToTheSupplier".tr(),
                          documentsScreenType: widget.documentsScreenType,
                          documentCode: 20,
                        ),
                        
                      ],
                    ))));
  }
  
}
