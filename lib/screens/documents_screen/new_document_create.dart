import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:get_it/get_it.dart';
import 'package:pcassa_retail/constants/app_themes/app_colors/app_colors.dart';
import 'package:pcassa_retail/constants/app_themes/app_icons/app_icons.dart';
import 'package:pcassa_retail/router/router.gr.dart';
import 'package:pcassa_retail/router/services.dart';
import 'package:pcassa_retail/screens/documents_screen/filter_document_dialog.dart';
import 'package:pcassa_retail/screens/documents_screen/product_add.dart';
import 'package:pcassa_retail/store/contragent_state/contragent_state.dart';
import 'package:pcassa_retail/store/currency_state/currency_state.dart';
import 'package:pcassa_retail/store/document_view_state/document_view_state.dart';
import 'package:pcassa_retail/store/warehouse_state/warehouse_state.dart';
import 'package:pcassa_retail/widgets/app_icons.dart';
import 'package:pcassa_retail/widgets/big_text.dart';
import 'package:pcassa_retail/widgets/documents_types/inward_movement.dart';
import 'package:pcassa_retail/widgets/documents_types/purchase_invoice.dart';
import 'package:pcassa_retail/widgets/documents_types/return_to_supplier.dart';
import 'package:pcassa_retail/widgets/documents_types/sales_invoice.dart';
import 'package:pcassa_retail/widgets/documents_types/write_off.dart';
import 'package:pcassa_retail/widgets/middle_text.dart';

import '../../constants/dimensions/dimensions.dart';
import '../../store/nakl_info_state/nakl_info_state.dart';
import '../../store/search_state/search_state.dart';
import '../../widgets/documents_types/return_from_buyer.dart';

class NewDocumentCreate extends StatefulWidget {
  const NewDocumentCreate(
      {Key? key, required this.documentCode, required this.documentName})
      : super(key: key);
  final int documentCode;
  final String documentName;
  @override
  State<NewDocumentCreate> createState() => _NewDocumentCreateState();
}

var documentViewState = GetIt.I<DocumentViewState>();

class _NewDocumentCreateState extends State<NewDocumentCreate>
    with TickerProviderStateMixin {
  late TabController _tabController;
  final getSearchedProduct = GetIt.I<SearchState>();
  final naklInfoItems = GetIt.I<NaklInfoState>();
  var currencyState = GetIt.I<CreatedCurrencys>();
  var contragemtState = GetIt.I<ContragentState>();
  var warehouseState = GetIt.I<WarehouseState>();
  var searchByNameContraller = TextEditingController();
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        //trigger leaving and use own data
        if (naklinfo.naklInfoTovars.isEmpty) {
          await showDialog<bool?>(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return SimpleDialog(
                title: MiddleText(
                  text: "documentWillBeDelete".tr(),
                ),
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () async {
                          naklinfo.savedDocument = true;
                          await documentViewState.deleteDocument(
                              id: naklinfo.naklInfoItems!.id);
                              router.pop();
                        },
                        child: Text('done'.tr()),
                      ),
                      TextButton(
                        onPressed: () {
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
        } else {
          naklinfo.naklInfoTovars.clear();
              Navigator.pop;
        }
   Navigator.pop(context);
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
                if (naklInfoItems.naklInfoTovars.isEmpty) {
                  await showDialog<bool?>(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return SimpleDialog(
                        title: MiddleText(
                          text: "documentWillBeDelete".tr(),
                        ),
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                onPressed: () async {
                                  naklInfoItems.savedDocument = true;
                                  await documentViewState.deleteDocument(
                                      id: naklInfoItems.naklInfoItems!.id);
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
                } else {
                  naklInfoItems.naklInfoTovars.clear();
                  Navigator.pop;
                }
               
                Navigator.pop(context);
              },
            ),
            bottom: TabBar(
              controller: _tabController,
              tabs: [
                Tab(
                  child: MiddleText(
                    text: "header".tr(),
                    color: AppColors.appWhite,
                  ),
                ),
                Tab(
                  child: MiddleText(
                    text: "products".tr(),
                    color: AppColors.appWhite,
                  ),
                ),
              ],
            ),
            title: BigText(
              text: widget.documentName,
              color: AppColors.appWhite,
            ),
            backgroundColor: AppColors.appPurple,
            actions: [
              IconButton(
                onPressed: () async {
                  if (naklInfoItems.naklInfoTovars.isEmpty) {
                    await showDialog<bool?>(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) {
                        return SimpleDialog(
                          title: MiddleText(
                            text: "documentWillBeDelete".tr(),
                          ),
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    naklInfoItems.savedDocument = true;
                                    documentViewState.deleteDocument(
                                        id: naklInfoItems.naklInfoItems!.id);
                                    router.replace(
                                      const MainRoute(),
                                    );
                                  },
                                  child: Text('done'.tr()),
                                ),
                                TextButton(
                                  onPressed: () async {
                                    router.pop();
                                  },
                                  child: Text('cancle'.tr()),
                                ),
                              ],
                            )
                          ],
                        );
                      },
                    );
                  } else {
                    naklInfoItems.naklInfoTovars.clear();
                    router.replace(
                      const MainRoute(),
                    );
                  }
                },
                icon: (CustomIcons.home),
              ),
            ],
          ),
          body: Observer(
              builder: (_) => TabBarView(controller: _tabController, children: [
                    ListView(
                      children: [
                        if (widget.documentCode == 15)
                          PurchaseInvoice(
                              documentType: widget.documentCode.toString())
                        else if (widget.documentCode == 16)
                          SalesInvoice(
                              documentType: widget.documentCode.toString())
                        else if (widget.documentCode == 17)
                          WriteOff(documentType: widget.documentCode.toString())
                        else if (widget.documentCode == 18)
                          InvardMovment(
                              documentType: widget.documentCode.toString())
                        else if (widget.documentCode == 19)
                          ReturnFromBuyer(
                              documentType: widget.documentCode.toString())
                        else if (widget.documentCode == 20)
                          ReturnToSupplier(
                              documentType: widget.documentCode.toString())
                      ],
                    ),
                    ProductAdd(
                      naklInfoItemstems: naklInfoItems.naklInfoItems,
                    )
                  ]))),
    );
  }
 @override
  void dispose() async{
    
    super.dispose();
    await updateDocument();
  }
    updateDocument() async {
  
    
    await documentViewState.getDocument(
          n_dok: FilterDocument.documentNumberContraller.text,
        data_s: FilterDocument.firstDatacontraller.text,
        data_e: FilterDocument.secondDateContraller.text,
        tip_name: FilterDocument.typeContraller == "notSelected"
            ? ""
            : FilterDocument.typeContraller,
        kontname: FilterDocument.contragentContraller == "notSelected"
            ? ""
            : FilterDocument.contragentContraller,
        skl1name: FilterDocument.firstWarehouseContraller == "notSelected"
            ? ""
            : FilterDocument.firstWarehouseContraller,
        skl2name: FilterDocument.secondWarehouseContraller == "notSelected"
            ? ""
            : FilterDocument.secondWarehouseContraller,
        aktiv: FilterDocument.statusContraller
    );
  }
}
