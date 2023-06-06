import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pcassa_retail/constants/dimensions/dimensions.dart';
import 'package:pcassa_retail/enums/main_screen_navigation_enum/documents_screen_enum.dart';
import 'package:pcassa_retail/error_handler/error_handler.dart';
import 'package:pcassa_retail/models/naklinfo_items_model/naklinfo_items_model.dart';
import 'package:pcassa_retail/screens/documents_screen/new_document_create.dart';
import 'package:pcassa_retail/store/currency_state/currency_state.dart';
import 'package:pcassa_retail/store/document_view_state/document_view_state.dart';
import 'package:pcassa_retail/store/nakl_info_state/nakl_info_state.dart';
import 'package:pcassa_retail/widgets/app_icons.dart';
import 'package:pcassa_retail/widgets/main_screen_loading_widget.dart';
import 'package:pcassa_retail/widgets/middle_text.dart';

import '../constants/app_themes/app_colors/app_colors.dart';
import '../store/contragent_state/contragent_state.dart';
import '../store/warehouse_state/warehouse_state.dart';

class DocumentsTypeDraw extends StatefulWidget {
  final DocumentsScreenType documentsScreenType;
  final String title;
  final int documentCode;
  DocumentsTypeDraw(
      {Key? key,
      required this.documentsScreenType,
      required this.title,
      required this.documentCode})
      : super(key: key);
  var contragemtState = GetIt.I<ContragentState>();
  var warehouseState = GetIt.I<WarehouseState>();
  var documentViewState = GetIt.I<DocumentViewState>();
  var naklInfo = GetIt.I<NaklInfoState>();
  var currencyState = GetIt.I<CreatedCurrencys>();

  @override
  State<DocumentsTypeDraw> createState() => _DocumentsTypeDrawState();
}

class _DocumentsTypeDrawState extends State<DocumentsTypeDraw> {
  var contragemtState = GetIt.I<ContragentState>();
  var warehouseState = GetIt.I<WarehouseState>();
  var documentViewState = GetIt.I<DocumentViewState>();
  var naklInfo = GetIt.I<NaklInfoState>();
  var currencyState = GetIt.I<CreatedCurrencys>();

  late BuildContext dialogContext;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: Dimensions.paddingLeft12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              AppIcons(
                icon: Icons.difference_outlined,
                iconColor: AppColors.appCoral,
                size: Dimensions.iconSize24,
              ),
              SizedBox(
                width: Dimensions.width15,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.height / 3.22,
                child: InkWell(
                  onTap: () async {
                    await goToDocument(context: context);
                  },
                  child: Container(
                    height: Dimensions.height20,
                    child: MiddleText(text: widget.title),
                  ),
                ),
              ),
            ],
          ),
          TextButton(
            onPressed: () async {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  dialogContext = context;
                  return const MainScreenLoadingWidget();
                },
              );

              await goToDocument(context: context);
            },
            child: const Icon(
              Icons.add,
              color: AppColors.appCoral,
            ),
          ),
        ],
      ),
    );
  }

  goToDocument({required context}) async {
    try {
      currencyState.currencyShortNames.clear();
      warehouseState.warehouseNames.clear();
      naklInfo.savedDocument = false;
      await warehouseState.getWarehouse();
      await warehouseState.getWarehouseNames();
      await contragemtState.getContragents(context: context);
      await contragemtState.categoryFirstMade();
      await currencyState.getCreatedCurencys();
      await currencyState.getShortNames();
      await naklInfo.createDocument(
        context: context,
        naklinfo_items_model: NaklInfoItemsModel(
            id: 0,
            typ_d: widget.documentCode,
            n_dok: "",
            data_d: "",
            kodpost: 0,
            namepost: "",
            skl1: 0,
            skl2: 0,
            skl1name: "",
            skl2name: "",
            srok_oplati: "",
            prim: "null",
            aktiv: 1,
            val: currencyState.currencyShortNames.last,
            skidka: 0,
            tip_skidki: "%",
            contact_litso: "",
            kurs: 0,
            pr_ras: 0),
      );
    } catch (e) {
      if (e is DioError) {
        await ErrorHandler.errorModal(
          context: context,
          errorCode: e.response,
        );
      } else {
        print(e.toString());
      }
    }
    Navigator.pop(dialogContext);
    showGeneralDialog(
      context: context,
      barrierDismissible: false,
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: ScaleTransition(
            scale: animation,
            child: child,
          ),
        );
      },
      pageBuilder: (context, animation, secondaryAnimation) {
        return Scaffold(
            body: NewDocumentCreate(
          documentCode: widget.documentCode,
          documentName: widget.title,
        ));
        // CreatedDocumentView());
      },
    );
  }
}
