// ignore_for_file: division_optimization

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pcassa_retail/constants/app_themes/app_colors/app_colors.dart';
import 'package:pcassa_retail/constants/app_themes/app_icons/app_icons.dart';
import 'package:pcassa_retail/constants/dimensions/dimensions.dart';
import 'package:pcassa_retail/error_handler/error_handler.dart';
import 'package:pcassa_retail/models/naklinfo_items_model/naklinfo_items_model.dart';
import 'package:pcassa_retail/models/tovar_array_items/tovar_array_items.dart';
import 'package:pcassa_retail/router/router.gr.dart';
import 'package:pcassa_retail/router/services.dart';

import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:pcassa_retail/store/document_view_state/document_view_state.dart';
import 'package:pcassa_retail/widgets/app_icons.dart';
import 'package:scan/scan.dart';
import '../../constants/paddings_constants/padding_constants.dart';
import '../../store/nakl_info_state/nakl_info_state.dart';
import '../../store/search_state/search_state.dart';
import '../../widgets/big_text.dart';
import '../../widgets/middle_text.dart';

class ProductAdd extends StatefulWidget {
  const ProductAdd({Key? key, required this.naklInfoItemstems})
      : super(key: key);

  final NaklInfoItemsModel? naklInfoItemstems;
  @override
  State<ProductAdd> createState() => _ProductAddState();
}

bool load = false;
var naklinfo = GetIt.I<NaklInfoState>();

final documentViewState = GetIt.I<DocumentViewState>();
final getSearchedProduct = GetIt.I<SearchState>();
var searchByNameContraller = TextEditingController();

var barcodeContraller = TextEditingController();
var summContraller = TextEditingController();
var priceContraller = TextEditingController();
var countContraller = TextEditingController();
var titleContralle = "";
bool productNotFound = false;
final ScrollController _scrollController = ScrollController();
//Scan Contraller
ScanController controller = ScanController();

//Scan Result defination
var _scanResult = '';
//Barcode Scanner

class _ProductAddState extends State<ProductAdd> {
  @override
  void initState() {
    super.initState();
    load = false;
    WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
  onWillPop: () async{
    
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
                          onPressed: () async{
                            naklinfo.savedDocument = true;
                     await       documentViewState.deleteDocument(
                                id: naklinfo.naklInfoItems!.id);
                            router.replace(MainRoute());
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
                router.pop();
              }
           
            
        //we need to return a future
        return Future.value(false);
      },
      child: Scaffold(
          body: Observer(
              builder: (_) => SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Container(
                      child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Container(
                            child: Observer(builder: (context) {
                              return DataTable(columns: [
                                DataColumn(
                                    label: IconButton(
                                  icon: AppIcons(
                                    icon: Icons.edit,
                                    iconColor: AppColors.appBlack,
                                    size: Dimensions.iconSize24,
                                  ),
                                  onPressed: () {},
                                )),
                                DataColumn(
                                    label: BigText(
                                  text: "code",
                                )),
                                DataColumn(
                                    label: BigText(
                                  text: "name",
                                )),
                                DataColumn(
                                    label: BigText(
                                  text: "count",
                                )),
                                DataColumn(
                                    label: BigText(
                                  text: "unit",
                                )),
                                DataColumn(
                                    label: BigText(
                                  text: "price",
                                )),
                                DataColumn(
                                    label: BigText(
                                  text: "summaPrice",
                                ))
                              ], rows: [
                                for (int i = 0;
                                    i < naklinfo.naklInfoTovars.length;
                                    i++)
                                  DataRow(cells: [
                                    DataCell(PopupMenuButton(
                                        // add icon, by default "3 dot" icon
                                        icon: AppIcons(
                                          icon: Icons.edit,
                                          iconColor: AppColors.appCoral,
                                        ),
                                        itemBuilder: (context) {
                                          return [
                                            PopupMenuItem<int>(
                                                value: 0,
                                                child: Row(
                                                  children: [
                                                    AppIcons(
                                                      icon: Icons.edit,
                                                      size: Dimensions.iconSize24,
                                                    ),
                                                    SizedBox(
                                                      width: Dimensions.width15,
                                                    ),
                                                    MiddleText(
                                                      text: "open".tr(),
                                                    )
                                                  ],
                                                )),
                                            PopupMenuItem<int>(
                                                value: 1,
                                                child: Row(
                                                  children: [
                                                    CustomIcons.delete,
                                                    SizedBox(
                                                      width: Dimensions.width15,
                                                    ),
                                                    MiddleText(
                                                        text: "delete".tr())
                                                  ],
                                                )),
                                          ];
                                        },
                                        onSelected: (value) async {
                                          if (value == 0) {
                                            setState(() {
                                              summContraller.text = naklinfo
                                                  .naklInfoTovars[i].summa_price!
                                                  .toInt()
                                                  .toString();
                                              countContraller.text = naklinfo
                                                  .naklInfoTovars[i].kol
                                                  .toInt()
                                                  .toString();
                                              priceContraller.text = naklinfo
                                                  .naklInfoTovars[i].price!
                                                  .toInt()
                                                  .toString();
                                            });
                                            showDialog<bool?>(
                                              context: context,
                                              barrierDismissible: true,
                                              builder: (BuildContext context) {
                                                return SimpleDialog(
                                                  title: BigText(
                                                    text: naklinfo
                                                        .naklInfoTovars[i].name,
                                                    color: AppColors.appBlack,
                                                  ),
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .fromLTRB(30, 0, 30, 0),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Expanded(
                                                              child: MiddleText(
                                                                  text: "count")),
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                          Expanded(
                                                            child: TextFormField(
                                                              controller:
                                                                  countContraller,
                                                              onChanged: (value) {
                                                                if (value
                                                                    .isNotEmpty) {
                                                                  setState(() {
                                                                    summContraller
                                                                        .text = (int.parse(
                                                                                value) *
                                                                            int.parse(
                                                                                priceContraller.text))
                                                                        .toString();
                                                                  });
                                                                } else {
                                                                  value == "";
                                                                }
                                                                ;
                                                              },
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                        padding: const EdgeInsets
                                                                .fromLTRB(
                                                            30, 0, 30, 0),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Expanded(
                                                                child: MiddleText(
                                                                    text:
                                                                        "price")),
                                                            const SizedBox(
                                                              width: 10,
                                                            ),
                                                            Expanded(
                                                              child:
                                                                  TextFormField(
                                                                controller:
                                                                    priceContraller,
                                                                onChanged:
                                                                    (value) {
                                                                  if (value
                                                                      .isNotEmpty) {
                                                                    setState(() {
                                                                      summContraller
                                                                          .text = (int.parse(value) *
                                                                              int.parse(countContraller.text))
                                                                          .toString();
                                                                    });
                                                                  } else {
                                                                    value == "";
                                                                  }
                                                                },
                                                              ),
                                                            )
                                                          ],
                                                        )),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .fromLTRB(30, 0, 30, 0),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Expanded(
                                                              child: MiddleText(
                                                                  text:
                                                                      "summaPrice")),
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                          Expanded(
                                                            child: TextFormField(
                                                              controller:
                                                                  summContraller,
                                                              onChanged: (value) {
                                                                if (value
                                                                    .isNotEmpty) {
                                                                  setState(() {
                                                                    priceContraller
                                                                        .text = (int.parse(
                                                                                value) /
                                                                            int.parse(
                                                                                countContraller.text))
                                                                        .toInt()
                                                                        .toString();
                                                                  });
                                                                } else {
                                                                  value == "";
                                                                }
                                                              },
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 30,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .fromLTRB(
                                                                  30, 0, 30, 0),
                                                          child: TextButton(
                                                              onPressed: () {
                                                                router.pop();
                                                              },
                                                              child: MiddleText(
                                                                text: "close",
                                                                color: AppColors
                                                                    .appPurple,
                                                              )),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .fromLTRB(
                                                                  30, 0, 30, 0),
                                                          child: TextButton(
                                                              onPressed:
                                                                  () async {
                                                                await onChangeFunction(
                                                                  i: i,
                                                                  naklInfoItemstems:
                                                                      widget
                                                                          .naklInfoItemstems!,
                                                                  price: double.parse(
                                                                      priceContraller
                                                                          .text),
                                                                  count: double.parse(
                                                                      countContraller
                                                                          .text),
                                                                  summa: double.parse(
                                                                      summContraller
                                                                          .text),
                                                                );
    
                                                                router.pop();
                                                              },
                                                              child: load == true
                                                                  ? CircularProgressIndicator()
                                                                  : MiddleText(
                                                                      text:
                                                                          "save",
                                                                      color: AppColors
                                                                          .appPurple,
                                                                    )),
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                );
                                              },
                                            );
                                          } else if (value == 1) {
                                            //Delete Functionality
                                            showDialog<void>(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return StatefulBuilder(
                                                  builder: (BuildContext context,
                                                      StateSetter setState) {
                                                    return Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        SizedBox(
                                                          height: Dimensions
                                                              .deletePopUpHeight,
                                                          width: Dimensions
                                                              .deletePopwidth,
                                                          child: SimpleDialog(
                                                            title: MiddleText(
                                                              text:
                                                                  "${'deleteProduct'.tr()} ?",
                                                            ),
                                                            children: [
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  TextButton(
                                                                      onPressed:
                                                                          () async {
                                                                        startLoad(
                                                                            setState);
                                                                        await naklinfo.deleteProduct(
                                                                            id: naklinfo
                                                                                .naklInfoTovars[
                                                                                    i]
                                                                                .id,
                                                                            id_d: naklinfo
                                                                                .naklInfoItems!
                                                                                .id!);
                                                                        endLoad(
                                                                            setState);
                                                                      },
                                                                      child: load ==
                                                                              true
                                                                          ? const CircularProgressIndicator(
                                                                              color:
                                                                                  AppColors.appCoral,
                                                                            )
                                                                          : MiddleText(
                                                                              text:
                                                                                  'delete'.tr(),
                                                                              color:
                                                                                  AppColors.appCoral,
                                                                            )),
                                                                  TextButton(
                                                                      onPressed:
                                                                          () {
                                                                        Navigator.pop(
                                                                            context);
                                                                      },
                                                                      child:
                                                                          MiddleText(
                                                                        text: 'cancle'
                                                                            .tr(),
                                                                        color: AppColors
                                                                            .appCoral,
                                                                      )),
                                                                ],
                                                              )
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    );
                                                  },
                                                );
                                              },
                                            );
                                          }
                                        })),
                                    DataCell(MiddleText(
                                        text:
                                            naklinfo.naklInfoTovars[i].kod_tov)),
                                    DataCell(MiddleText(
                                        text: naklinfo.naklInfoTovars[i].name)),
                                    DataCell(Observer(builder: (context) {
                                      return MiddleText(
                                          text: naklinfo.naklInfoTovars[i].kol
                                              .toInt()
                                              .toString());
                                    })),
                                    DataCell(MiddleText(
                                        text: naklinfo.naklInfoTovars[i].ed_izm)),
                                    DataCell(Observer(builder: (context) {
                                      return MiddleText(
                                          text: naklinfo.naklInfoTovars[i].price!
                                              .toInt()
                                              .toString());
                                    })),
                                    DataCell(Observer(builder: (context) {
                                      return Observer(builder: (context) {
                                        return MiddleText(
                                          text: naklinfo
                                              .naklInfoTovars[i].summa_price!
                                              .toInt()
                                              .toString(),
                                        );
                                      });
                                    })),
                                  ]),
                              ]);
                            }),
                          )),
                    ),
                  )),
          persistentFooterButtons: [
            Padding(
              padding: const EdgeInsets.all(paddingAll),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {
                        _showBarcodeScanner(
                            naklInfoItemstems: widget.naklInfoItemstems);
                      },
                      child: BigText(
                        text: "addProduct",
                        color: AppColors.appCoral,
                      )),
                  SpeedDial(
                    icon: Icons.search,
                    activeIcon: Icons.close,
                    spacing: 3,
                    backgroundColor: AppColors.appPurple,
                    childPadding: const EdgeInsets.all(5),
                    spaceBetweenChildren: 4,
                    children: [
                      SpeedDialChild(
                          child: const Icon(Icons.search),
                          backgroundColor: AppColors.appCoral,
                          foregroundColor: Colors.white,
                          label: 'searchByName'.tr(),
                          onTap: () => _displayDialog(
                              naklInfoItemstems: widget.naklInfoItemstems!,
                              context: context,
                              contraller: searchByNameContraller)),
                      SpeedDialChild(
                          child: const Icon(Icons.search),
                          backgroundColor: AppColors.appCoral,
                          foregroundColor: Colors.white,
                          label: 'searchByBarcode'.tr(),
                          onTap: () {
                            showDialog<bool?>(
                              context: context,
                              barrierDismissible: true,
                              builder: (BuildContext context) {
                                return SimpleDialog(
                                  title: MiddleText(text: "writeBarcode"),
                                  children: [
                                    Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            30, 0, 30, 0),
                                        child: TextFormField(
                                          keyboardType: TextInputType.number,
                                          controller: barcodeContraller,
                                        )),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              30, 0, 30, 0),
                                          child: TextButton(
                                              onPressed: () {
                                                barcodeContraller.clear();
                                                router.pop();
                                              },
                                              child: MiddleText(
                                                text: "close",
                                                color: AppColors.appPurple,
                                              )),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              30, 0, 30, 0),
                                          child: TextButton(
                                              onPressed: () async {
                                                await _searchByScanner(
                                                    barcode:
                                                        barcodeContraller.text,
                                                    context: context,
                                                    naklInfoItemstems: widget
                                                        .naklInfoItemstems!);
                                              },
                                              child: load == true
                                                  ? const CircularProgressIndicator()
                                                  : MiddleText(
                                                      text: "save",
                                                      color: AppColors.appPurple,
                                                    )),
                                        )
                                      ],
                                    )
                                  ],
                                );
                              },
                            );
                          }
                          // _showBarcodeScanner(
                          //     naklInfoItemstems: widget.naklInfoItemstems!)
                          ),
                    ],
                  ),
                ],
              ),
            )
          ]),
    );
  }

  onChangeFunction({
    i,
    required NaklInfoItemsModel naklInfoItemstems,
    required double price,
    required double count,
    required double summa,
  }) async {
    try {
      await naklinfo.saveDocument(
          naklinfo_items_model: NaklInfoItemsModel(
              id: naklInfoItemstems.id,
              typ_d: naklInfoItemstems.typ_d,
              n_dok: naklInfoItemstems.n_dok,
              data_d: DateFormat('dd.MM.yyyy')
                  .format(DateTime.parse(naklInfoItemstems.data_d.toString())),
              kodpost: naklInfoItemstems.kodpost,
              namepost: naklInfoItemstems.namepost,
              skl1: naklInfoItemstems.typ_d == 15 || naklInfoItemstems.typ_d == 18 || naklInfoItemstems.typ_d == 19
                  ? naklInfoItemstems.skl1
                  : 0,
              skl2: naklInfoItemstems.typ_d == 16 || naklInfoItemstems.typ_d == 17 || naklInfoItemstems.typ_d == 18 || naklInfoItemstems.typ_d == 20
                  ? naklInfoItemstems.skl2
                  : 0,
              skl1name:
                  naklInfoItemstems.typ_d == 15 || naklInfoItemstems.typ_d == 18 || naklInfoItemstems.typ_d == 19
                      ? naklInfoItemstems.skl1name
                      : "",
              skl2name: naklInfoItemstems.typ_d == 16 ||
                      naklInfoItemstems.typ_d == 17 ||
                      naklInfoItemstems.typ_d == 18 ||
                      naklInfoItemstems.typ_d == 20
                  ? naklInfoItemstems.skl2name
                  : "",
              srok_oplati: DateFormat('dd.MM.yyyy').format(
                  DateTime.parse(naklInfoItemstems.srok_oplati.toString())),
              prim: naklInfoItemstems.prim.toString(),
              aktiv: naklInfoItemstems.aktiv,
              val: naklInfoItemstems.val,
              skidka: naklInfoItemstems.skidka,
              tip_skidki: naklInfoItemstems.tip_skidki,
              contact_litso: naklInfoItemstems.contact_litso,
              kurs: naklInfoItemstems.kurs,
              pr_ras: naklInfoItemstems.pr_ras),
          tovarArrayItems: TovarArrayItems(
              id: naklinfo.naklInfoTovars[i].id,
              id_d: naklInfoItemstems.id!,
              typ_d: naklInfoItemstems.typ_d!,
              kod_tov: naklinfo.naklInfoTovars[i].kod_tov,
              name: naklinfo.naklInfoTovars[i].name,
              kol: count,
              ed_izm: naklinfo.naklInfoTovars[i].ed_izm,
              cena_p: naklInfoItemstems.typ_d == 15 || naklInfoItemstems.typ_d == 18 || naklInfoItemstems.typ_d == 19 ? price : 0,
              cena_o: naklInfoItemstems.typ_d == 16 || naklInfoItemstems.typ_d == 17 || naklInfoItemstems.typ_d == 18 || naklInfoItemstems.typ_d == 20 ? price : 0,
              summa_p: naklInfoItemstems.typ_d == 15 || naklInfoItemstems.typ_d == 18 || naklInfoItemstems.typ_d == 19 ? summa : 0,
              summa_o: naklInfoItemstems.typ_d == 16 || naklInfoItemstems.typ_d == 17 || naklInfoItemstems.typ_d == 18 || naklInfoItemstems.typ_d == 20 ? summa : 0,
              barcode: naklinfo.naklInfoTovars[i].barcode,
              price: price,
              summa_price: summa,
              tip_skidki: naklInfoItemstems.tip_skidki.toString(),
              pr_ras: 0,
              cena_v: 0,
              summa_v: 0,
              idd_rn: 0,
              rn: 0,
              spis: "0",
              data_pr: "",
              kd: 0,
              data_sr: "",
              nds: 0,
              cena_nds: 0,
              summa_nds: 0,
              cena_bez_nds: 0,
              summa_bez_nds: 0,
              cena_nds_prixoda: 0,
              summa_nds_prixoda: 0,
              skidka: 0),
          context: context);
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
    ;
  }

// _showBarcodeScaner Function
  _showBarcodeScanner({required naklInfoItemstems}) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (builder) {
        return StatefulBuilder(builder: (BuildContext scanContext, setState) {
          return SizedBox(
              height: MediaQuery.of(context).size.height / 2,
              child: Scaffold(
                appBar: _buildBarcodeScannerAppBar(),
                body: _buildBarcodeScannerBody(
                    naklInfoItemstems: naklInfoItemstems),
              ));
        });
      },
    );
  }

//Barcode Scanner App Bar
  AppBar _buildBarcodeScannerAppBar() {
    return AppBar(
      bottom: PreferredSize(
        child: Container(color: AppColors.appPurple, height: 4.0),
        preferredSize: const Size.fromHeight(4.0),
      ),
      title: MiddleText(
        text: 'ScanYourBarcode',
        color: AppColors.appWhite,
      ),
      elevation: 0.0,
      backgroundColor: const Color(0xFF333333),
      automaticallyImplyLeading: false,
      leading: GestureDetector(
        onTap: () async {
          controller.pause;
          await router.pop();
        },
        child: const Center(
            child: Icon(
          Icons.arrow_back,
          color: Colors.white,
        )),
      ),
      actions: [
        Row(
          children: [
            IconButton(
              onPressed: () async {
                //await controller.pause;
                await router.pop(context);
                _displayDialog(
                  context: context,
                  naklInfoItemstems: widget.naklInfoItemstems!,
                  contraller: searchByNameContraller,
                );
              },
              icon: AppIcons(icon: Icons.search),
            ),
            SingleChildScrollView(
              child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(right: 16.0),
                  child: const Icon(Icons.flashlight_on)),
            ),
          ],
        )
      ],
    );
  }

//Barcode Scanner Body
  Widget _buildBarcodeScannerBody(
      {required NaklInfoItemsModel naklInfoItemstems}) {
    return SizedBox(
      height: 400,
      child: ScanView(
          controller: controller,
          scanAreaScale: .7,
          scanLineColor: AppColors.appCoral,
          onCapture: (data) async {
            setState(() {
              _scanResult = data;
            });
            controller.pause;
            if (naklInfoItemstems.namepost == null ||
                naklInfoItemstems.skl1name == "") {
              showDialog<bool?>(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return SimpleDialog(
                    title: MiddleText(
                      text: "selectContragent".tr(),
                    ),
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('done'.tr()),
                      ),
                    ],
                  );
                },
              );
            } else if (naklInfoItemstems.skl1name == null ||
                naklInfoItemstems.skl1name == "") {
              showDialog<bool?>(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return SimpleDialog(
                    title: MiddleText(
                      text: "selectWarehouse".tr(),
                    ),
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('done'.tr()),
                      ),
                    ],
                  );
                },
              );
            } else if (naklInfoItemstems.typ_d == 18 &&
                naklInfoItemstems.skl2name == null) {
              await router.pop(context);
              showDialog<bool?>(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return SimpleDialog(
                    title: MiddleText(
                      text: "selectSecondWarehouse".tr(),
                    ),
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('done'.tr()),
                      ),
                    ],
                  );
                },
              );
            } else {
              try {
                await getSearchedProduct.getProductBybarcode(
                    barcode: data, context: context);
              } catch (e) {
                print(e);
                if (e is DioError) {
                  await ErrorHandler.errorModal(
                      context: context, errorCode: "productNotFound");
                }
              }
              if (naklinfo.naklInfoTovars.isNotEmpty &&
                  naklinfo.naklInfoTovars.any((element) =>
                      element.kod_tov ==
                      getSearchedProduct.searchResultByScan!.kod_tov)) {
                for (int j = 0; j < naklinfo.naklInfoTovars.length; j++) {
                  if (naklinfo.naklInfoTovars[j].kod_tov ==
                      getSearchedProduct.searchResultByScan!.kod_tov) {
                    setState(() {
                      priceContraller.text =
                          naklinfo.naklInfoTovars[j].price!.toInt().toString();
                      summContraller.text = naklinfo
                          .naklInfoTovars[j].summa_price!
                          .toInt()
                          .toString();
                      countContraller.text =
                          naklinfo.naklInfoTovars[j].kol.toInt().toString();
                      titleContralle = naklinfo.naklInfoTovars[j].name;
                    });
                    break;
                  }
                }
                searchByNameContraller.clear();
                Navigator.pop(context);
                showDialog<bool?>(
                  context: context,
                  barrierDismissible: true,
                  builder: (BuildContext context) {
                    return SimpleDialog(
                      title: BigText(
                        text: titleContralle,
                        color: AppColors.appBlack,
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(child: MiddleText(text: "count")),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: TextFormField(
                                  controller: countContraller,
                                  onChanged: (value) {
                                    if (value.isNotEmpty) {
                                      setState(() {
                                        summContraller
                                            .text = (int.parse(value) *
                                                int.parse(priceContraller.text))
                                            .toString();
                                      });
                                    } else {
                                      value == "";
                                    }
                                    ;
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(child: MiddleText(text: "price")),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: TextFormField(
                                    controller: priceContraller,
                                    onChanged: (value) {
                                      if (value.isNotEmpty) {
                                        setState(() {
                                          summContraller.text =
                                              (int.parse(value) *
                                                      int.parse(
                                                          countContraller.text))
                                                  .toString();
                                        });
                                      } else {
                                        value == "";
                                      }
                                    },
                                  ),
                                )
                              ],
                            )),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(child: MiddleText(text: "summaPrice")),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: TextFormField(
                                  controller: summContraller,
                                  onChanged: (value) {
                                    if (value.isNotEmpty) {
                                      setState(() {
                                        priceContraller
                                            .text = (int.parse(value) /
                                                int.parse(countContraller.text))
                                            .toInt()
                                            .toString();
                                      });
                                    } else {
                                      value == "";
                                    }
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                              child: TextButton(
                                  onPressed: () {
                                    router.pop();
                                  },
                                  child: MiddleText(
                                    text: "close",
                                    color: AppColors.appPurple,
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                              child: TextButton(
                                  onPressed: () async {
                                    startLoad(setState);
                                    await onChangeFunction(
                                      naklInfoItemstems:
                                          widget.naklInfoItemstems!,
                                      price: double.parse(priceContraller.text),
                                      count: double.parse(countContraller.text),
                                      summa: double.parse(summContraller.text),
                                    );
                                    endLoad(setState);
                                  },
                                  child: load == true
                                      ? const CircularProgressIndicator()
                                      : MiddleText(
                                          text: "save",
                                          color: AppColors.appPurple,
                                        )),
                            )
                          ],
                        )
                      ],
                    );
                  },
                );
              } else {
                try {
                  await naklinfo.saveDocument(
                      naklinfo_items_model: NaklInfoItemsModel(
                          id: naklInfoItemstems.id,
                          typ_d: naklInfoItemstems.typ_d,
                          n_dok: naklInfoItemstems.n_dok,
                          data_d: DateFormat('dd.MM.yyyy').format(DateTime.parse(
                              naklInfoItemstems.data_d.toString())),
                          kodpost: naklInfoItemstems.kodpost,
                          namepost: naklInfoItemstems.namepost,
                          skl1: naklInfoItemstems.typ_d == 15 ||
                                  naklInfoItemstems.typ_d == 18 ||
                                  naklInfoItemstems.typ_d == 19
                              ? naklInfoItemstems.skl1
                              : 0,
                          skl2: naklInfoItemstems.typ_d == 16 ||
                                  naklInfoItemstems.typ_d == 17 ||
                                  naklInfoItemstems.typ_d == 18 ||
                                  naklInfoItemstems.typ_d == 20
                              ? naklInfoItemstems.skl2
                              : 0,
                          skl1name:
                              naklInfoItemstems.typ_d == 15 || naklInfoItemstems.typ_d == 18 || naklInfoItemstems.typ_d == 19
                                  ? naklInfoItemstems.skl1name
                                  : "",
                          skl2name: naklInfoItemstems.typ_d == 16 ||
                                  naklInfoItemstems.typ_d == 17 ||
                                  naklInfoItemstems.typ_d == 18 ||
                                  naklInfoItemstems.typ_d == 20
                              ? naklInfoItemstems.skl2name
                              : "",
                          srok_oplati: DateFormat('dd.MM.yyyy').format(DateTime.parse(naklInfoItemstems.srok_oplati.toString())),
                          prim: naklInfoItemstems.prim.toString(),
                          aktiv: naklInfoItemstems.aktiv,
                          val: naklInfoItemstems.val,
                          skidka: naklInfoItemstems.skidka,
                          tip_skidki: naklInfoItemstems.tip_skidki,
                          contact_litso: naklInfoItemstems.contact_litso,
                          kurs: naklInfoItemstems.kurs,
                          pr_ras: naklInfoItemstems.pr_ras),
                      tovarArrayItems: TovarArrayItems(id: 0, id_d: naklInfoItemstems.id!, typ_d: naklInfoItemstems.typ_d!, kod_tov: getSearchedProduct.searchResultByScan!.kod_tov!, name: getSearchedProduct.searchResultByScan!.name!, kol: 1, ed_izm: getSearchedProduct.searchResultByScan!.ed_izm!, cena_p: naklInfoItemstems.typ_d == 15 || naklInfoItemstems.typ_d == 18 || naklInfoItemstems.typ_d == 19 ? double.parse(getSearchedProduct.searchResultByScan!.price_s.toString()) : 0, cena_o: naklInfoItemstems.typ_d == 16 || naklInfoItemstems.typ_d == 17 || naklInfoItemstems.typ_d == 18 || naklInfoItemstems.typ_d == 20 ? double.parse(getSearchedProduct.searchResultByScan!.price_s.toString()) : 0, summa_p: naklInfoItemstems.typ_d == 15 || naklInfoItemstems.typ_d == 18 || naklInfoItemstems.typ_d == 19 ? double.parse(getSearchedProduct.searchResultByScan!.price_s.toString()) : 0, summa_o: naklInfoItemstems.typ_d == 16 || naklInfoItemstems.typ_d == 17 || naklInfoItemstems.typ_d == 18 || naklInfoItemstems.typ_d == 20 ? double.parse(getSearchedProduct.searchResultByScan!.price_s.toString()) : 0, barcode: getSearchedProduct.searchResultByScan!.barcode, price: getSearchedProduct.searchResultByScan!.price_s!.toDouble(), summa_price: getSearchedProduct.searchResultByScan!.price_s!.toDouble(), tip_skidki: naklInfoItemstems.tip_skidki.toString(), pr_ras: 0, cena_v: 0, summa_v: 0, idd_rn: 0, rn: 0, spis: "0", data_pr: "", kd: 0, data_sr: "", nds: 0, cena_nds: 0, summa_nds: 0, cena_bez_nds: 0, summa_bez_nds: 0, cena_nds_prixoda: 0, summa_nds_prixoda: 0, skidka: 0),
                      context: context);
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
                router.pop(context);
              }
            }
          }),
    );
    //Start Delete Loading
  }

  _searchByScanner(
      {required NaklInfoItemsModel naklInfoItemstems,
      required String barcode,
      required BuildContext context}) async {
    if (naklInfoItemstems.namepost == null ||
        naklInfoItemstems.skl1name == "") {
      showDialog<bool?>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: MiddleText(
              text: "selectContragent".tr(),
            ),
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('done'.tr()),
              ),
            ],
          );
        },
      );
    } else if (naklInfoItemstems.skl1name == null ||
        naklInfoItemstems.skl1name == "") {
      showDialog<bool?>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: MiddleText(
              text: "selectWarehouse".tr(),
            ),
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('done'.tr()),
              ),
            ],
          );
        },
      );
    } else if (naklInfoItemstems.typ_d == 18 &&
        naklInfoItemstems.skl2name == null) {
      await router.pop(context);
      showDialog<bool?>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: MiddleText(
              text: "selectSecondWarehouse".tr(),
            ),
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('done'.tr()),
              ),
            ],
          );
        },
      );
    } else {
      try {
        await getSearchedProduct.getProductBybarcode(
            barcode: barcode, context: context);
      } catch (e) {
        print(e);
        if (e is DioError) {
          productNotFound = true;
          await ErrorHandler.errorModal(
              context: context, errorCode: "productNotFound");

          barcode = "";

          barcodeContraller.text = "";
        }
      }

      if (productNotFound == false &&
          naklinfo.naklInfoTovars.isNotEmpty &&
          naklinfo.naklInfoTovars.any((element) =>
              element.kod_tov ==
              getSearchedProduct.searchResultByScan!.kod_tov)) {
        for (int j = 0; j < naklinfo.naklInfoTovars.length; j++) {
          if (naklinfo.naklInfoTovars[j].kod_tov ==
              getSearchedProduct.searchResultByScan!.kod_tov) {
            setState(() {
              priceContraller.text =
                  naklinfo.naklInfoTovars[j].price!.toInt().toString();
              summContraller.text =
                  naklinfo.naklInfoTovars[j].summa_price!.toInt().toString();
              countContraller.text =
                  naklinfo.naklInfoTovars[j].kol.toInt().toString();
              titleContralle = naklinfo.naklInfoTovars[j].name;
            });
          }
        }

        showDialog<bool?>(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext context) {
            return SimpleDialog(
              title: BigText(
                text: titleContralle,
                color: AppColors.appBlack,
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: MiddleText(text: "count")),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: countContraller,
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              setState(() {
                                summContraller.text = (int.parse(value) *
                                        int.parse(priceContraller.text))
                                    .toString();
                              });
                            } else {
                              value == "";
                            }
                            ;
                          },
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(child: MiddleText(text: "price")),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: priceContraller,
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                setState(() {
                                  summContraller.text = (int.parse(value) *
                                          int.parse(countContraller.text))
                                      .toString();
                                });
                              } else {
                                value == "";
                              }
                            },
                          ),
                        )
                      ],
                    )),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: MiddleText(text: "summaPrice")),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: summContraller,
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              setState(() {
                                priceContraller.text = (int.parse(value) /
                                        int.parse(countContraller.text))
                                    .toInt()
                                    .toString();
                              });
                            } else {
                              value == "";
                            }
                          },
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: TextButton(
                          onPressed: () {
                            router.pop();
                          },
                          child: MiddleText(
                            text: "close",
                            color: AppColors.appPurple,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: TextButton(
                          onPressed: () async {
                            startLoad(setState);
                            await onChangeFunction(
                              naklInfoItemstems: widget.naklInfoItemstems!,
                              price: double.parse(priceContraller.text),
                              count: double.parse(countContraller.text),
                              summa: double.parse(summContraller.text),
                            );
                            endLoad(setState);
                          },
                          child: load == true
                              ? const CircularProgressIndicator()
                              : MiddleText(
                                  text: "save",
                                  color: AppColors.appPurple,
                                )),
                    )
                  ],
                )
              ],
            );
          },
        );
      } else if (productNotFound == false) {
        try {
          barcode = "";
          barcodeContraller.text = "";
          router.pop();
          await naklinfo.saveDocument(
              naklinfo_items_model: NaklInfoItemsModel(
                  id: naklInfoItemstems.id,
                  typ_d: naklInfoItemstems.typ_d,
                  n_dok: naklInfoItemstems.n_dok,
                  data_d: DateFormat('dd.MM.yyyy').format(
                      DateTime.parse(naklInfoItemstems.data_d.toString())),
                  kodpost: naklInfoItemstems.kodpost,
                  namepost: naklInfoItemstems.namepost,
                  skl1: naklInfoItemstems.typ_d == 15 || naklInfoItemstems.typ_d == 18 || naklInfoItemstems.typ_d == 19
                      ? naklInfoItemstems.skl1
                      : 0,
                  skl2: naklInfoItemstems.typ_d == 16 || naklInfoItemstems.typ_d == 17 || naklInfoItemstems.typ_d == 18 || naklInfoItemstems.typ_d == 20
                      ? naklInfoItemstems.skl2
                      : 0,
                  skl1name: naklInfoItemstems.typ_d == 15 || naklInfoItemstems.typ_d == 18 || naklInfoItemstems.typ_d == 19
                      ? naklInfoItemstems.skl1name
                      : "",
                  skl2name: naklInfoItemstems.typ_d == 16 ||
                          naklInfoItemstems.typ_d == 17 ||
                          naklInfoItemstems.typ_d == 18 ||
                          naklInfoItemstems.typ_d == 20
                      ? naklInfoItemstems.skl2name
                      : "",
                  srok_oplati: DateFormat('dd.MM.yyyy').format(
                      DateTime.parse(naklInfoItemstems.srok_oplati.toString())),
                  prim: naklInfoItemstems.prim.toString(),
                  aktiv: naklInfoItemstems.aktiv,
                  val: naklInfoItemstems.val,
                  skidka: naklInfoItemstems.skidka,
                  tip_skidki: naklInfoItemstems.tip_skidki,
                  contact_litso: naklInfoItemstems.contact_litso,
                  kurs: naklInfoItemstems.kurs,
                  pr_ras: naklInfoItemstems.pr_ras),
              tovarArrayItems: TovarArrayItems(
                  id: 0,
                  id_d: naklInfoItemstems.id!,
                  typ_d: naklInfoItemstems.typ_d!,
                  kod_tov: getSearchedProduct.searchResultByScan!.kod_tov!,
                  name: getSearchedProduct.searchResultByScan!.name!,
                  kol: 1,
                  ed_izm: getSearchedProduct.searchResultByScan!.ed_izm!,
                  cena_p: naklInfoItemstems.typ_d == 15 || naklInfoItemstems.typ_d == 18 || naklInfoItemstems.typ_d == 19 ? double.parse(getSearchedProduct.searchResultByScan!.price_s.toString()) : 0,
                  cena_o: naklInfoItemstems.typ_d == 16 || naklInfoItemstems.typ_d == 17 || naklInfoItemstems.typ_d == 18 || naklInfoItemstems.typ_d == 20 ? double.parse(getSearchedProduct.searchResultByScan!.price_s.toString()) : 0,
                  summa_p: naklInfoItemstems.typ_d == 15 || naklInfoItemstems.typ_d == 18 || naklInfoItemstems.typ_d == 19 ? double.parse(getSearchedProduct.searchResultByScan!.price_s.toString()) : 0,
                  summa_o: naklInfoItemstems.typ_d == 16 || naklInfoItemstems.typ_d == 17 || naklInfoItemstems.typ_d == 18 || naklInfoItemstems.typ_d == 20 ? double.parse(getSearchedProduct.searchResultByScan!.price_s.toString()) : 0,
                  barcode: getSearchedProduct.searchResultByScan!.barcode,
                  price: getSearchedProduct.searchResultByScan!.price_s!.toDouble(),
                  summa_price: getSearchedProduct.searchResultByScan!.price_s!.toDouble(),
                  tip_skidki: naklInfoItemstems.tip_skidki.toString(),
                  pr_ras: 0,
                  cena_v: 0,
                  summa_v: 0,
                  idd_rn: 0,
                  rn: 0,
                  spis: "0",
                  data_pr: "",
                  kd: 0,
                  data_sr: "",
                  nds: 0,
                  cena_nds: 0,
                  summa_nds: 0,
                  cena_bez_nds: 0,
                  summa_bez_nds: 0,
                  cena_nds_prixoda: 0,
                  summa_nds_prixoda: 0,
                  skidka: 0),
              context: context);
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
      }

      setState(() {
        productNotFound = false;
      });
    }
  }

  _displayDialog({
    required NaklInfoItemsModel naklInfoItemstems,
    required BuildContext context,
    required TextEditingController contraller,
  }) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Padding(
                padding: const EdgeInsets.all(paddingAll),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BigText(text: "searchByName"),
                        TextButton(
                            onPressed: () {
                              getSearchedProduct.searchResult.clear();
                              contraller.clear();
                              router.pop(context);
                            },
                            child: MiddleText(text: "close")),
                      ],
                    ),
                    Column(
                      children: [
                        TextFormField(
                          controller: contraller,
                          onChanged: (value) {
                            if (value.length > 2) {
                              getSearchedProduct.getProductByName(
                                  context: context, productName: value);
                            } else {
                              getSearchedProduct.searchResult.clear();
                            }
                          },
                        ),
                        Observer(
                            builder: (_) => Container(
                                  height: 200,
                                  child: SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: Column(children: [
                                        for (int i = 0;
                                            i <
                                                getSearchedProduct
                                                    .searchResult.length;
                                            i++)
                                          SizedBox(
                                            child: Container(
                                              width: double.infinity,
                                              child: TextButton(
                                                  child: MiddleText(
                                                      text: getSearchedProduct
                                                          .searchResult[i]
                                                          .name!),
                                                  onPressed: () async {
                                                    if (naklInfoItemstems
                                                            .namepost ==
                                                        null) {
                                                      showDialog<bool?>(
                                                        context: context,
                                                        barrierDismissible:
                                                            false,
                                                        builder: (BuildContext
                                                            context) {
                                                          return SimpleDialog(
                                                            title: MiddleText(
                                                              text:
                                                                  "selectContragent"
                                                                      .tr(),
                                                            ),
                                                            children: [
                                                              TextButton(
                                                                onPressed: () {
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child: Text(
                                                                    'done'
                                                                        .tr()),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    } else if (naklInfoItemstems
                                                                .skl1 ==
                                                            0 &&
                                                        naklInfoItemstems
                                                                .skl2 ==
                                                            0) {
                                                      showDialog<bool?>(
                                                        context: context,
                                                        barrierDismissible:
                                                            false,
                                                        builder: (BuildContext
                                                            context) {
                                                          return SimpleDialog(
                                                            title: MiddleText(
                                                              text:
                                                                  "selectWarehouse"
                                                                      .tr(),
                                                            ),
                                                            children: [
                                                              TextButton(
                                                                onPressed: () {
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child: Text(
                                                                    'done'
                                                                        .tr()),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    } else if (naklInfoItemstems
                                                                .typ_d ==
                                                            18 &&
                                                        naklInfoItemstems
                                                                .skl2name ==
                                                            null) {
                                                      showDialog<bool?>(
                                                        context: context,
                                                        barrierDismissible:
                                                            false,
                                                        builder: (BuildContext
                                                            context) {
                                                          return SimpleDialog(
                                                            title: MiddleText(
                                                              text:
                                                                  "selectSecondWarehouse"
                                                                      .tr(),
                                                            ),
                                                            children: [
                                                              TextButton(
                                                                onPressed: () {
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child: Text(
                                                                    'done'
                                                                        .tr()),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    } else {
                                                      if (naklinfo
                                                              .naklInfoTovars
                                                              .isNotEmpty &&
                                                          naklinfo
                                                              .naklInfoTovars
                                                              .any((element) =>
                                                                  element
                                                                      .kod_tov ==
                                                                  getSearchedProduct
                                                                      .searchResult[
                                                                          i]
                                                                      .kod_tov)) {
                                                        for (int j = 0;
                                                            j <
                                                                naklinfo
                                                                    .naklInfoTovars
                                                                    .length;
                                                            j++) {
                                                          if (naklinfo
                                                                  .naklInfoTovars[
                                                                      j]
                                                                  .kod_tov ==
                                                              getSearchedProduct
                                                                  .searchResult[
                                                                      i]
                                                                  .kod_tov) {
                                                            setState(() {
                                                              priceContraller
                                                                      .text =
                                                                  naklinfo
                                                                      .naklInfoTovars[
                                                                          j]
                                                                      .price!
                                                                      .toInt()
                                                                      .toString();
                                                              summContraller
                                                                      .text =
                                                                  naklinfo
                                                                      .naklInfoTovars[
                                                                          j]
                                                                      .summa_price!
                                                                      .toInt()
                                                                      .toString();
                                                              countContraller
                                                                      .text =
                                                                  naklinfo
                                                                      .naklInfoTovars[
                                                                          j]
                                                                      .kol
                                                                      .toInt()
                                                                      .toString();
                                                              titleContralle =
                                                                  naklinfo
                                                                      .naklInfoTovars[
                                                                          j]
                                                                      .name;
                                                            });
                                                            break;
                                                          }
                                                        }
                                                        searchByNameContraller
                                                            .clear();
                                                        Navigator.pop(context);
                                                        showDialog<bool?>(
                                                          context: context,
                                                          barrierDismissible:
                                                              true,
                                                          builder: (BuildContext
                                                              context) {
                                                            return SimpleDialog(
                                                              title: BigText(
                                                                text:
                                                                    titleContralle,
                                                                color: AppColors
                                                                    .appBlack,
                                                              ),
                                                              children: [
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .fromLTRB(
                                                                          30,
                                                                          0,
                                                                          30,
                                                                          0),
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Expanded(
                                                                          child:
                                                                              MiddleText(text: "count")),
                                                                      const SizedBox(
                                                                        width:
                                                                            10,
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            TextFormField(
                                                                          controller:
                                                                              countContraller,
                                                                          onChanged:
                                                                              (value) {
                                                                            if (value.isNotEmpty) {
                                                                              setState(() {
                                                                                summContraller.text = (int.parse(value) * int.parse(priceContraller.text)).toString();
                                                                              });
                                                                            } else {
                                                                              value == "";
                                                                            }
                                                                            ;
                                                                          },
                                                                        ),
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                                Padding(
                                                                    padding:
                                                                        const EdgeInsets.fromLTRB(
                                                                            30,
                                                                            0,
                                                                            30,
                                                                            0),
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Expanded(
                                                                            child:
                                                                                MiddleText(text: "price")),
                                                                        const SizedBox(
                                                                          width:
                                                                              10,
                                                                        ),
                                                                        Expanded(
                                                                          child:
                                                                              TextFormField(
                                                                            controller:
                                                                                priceContraller,
                                                                            onChanged:
                                                                                (value) {
                                                                              if (value.isNotEmpty) {
                                                                                setState(() {
                                                                                  summContraller.text = (int.parse(value) * int.parse(countContraller.text)).toString();
                                                                                });
                                                                              } else {
                                                                                value == "";
                                                                              }
                                                                            },
                                                                          ),
                                                                        )
                                                                      ],
                                                                    )),
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .fromLTRB(
                                                                          30,
                                                                          0,
                                                                          30,
                                                                          0),
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Expanded(
                                                                          child:
                                                                              MiddleText(text: "summaPrice")),
                                                                      const SizedBox(
                                                                        width:
                                                                            10,
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            TextFormField(
                                                                          controller:
                                                                              summContraller,
                                                                          onChanged:
                                                                              (value) {
                                                                            if (value.isNotEmpty) {
                                                                              setState(() {
                                                                                priceContraller.text = (int.parse(value) / int.parse(countContraller.text)).toInt().toString();
                                                                              });
                                                                            } else {
                                                                              value == "";
                                                                            }
                                                                          },
                                                                        ),
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                  height: 30,
                                                                ),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Padding(
                                                                      padding:
                                                                          const EdgeInsets.fromLTRB(
                                                                              30,
                                                                              0,
                                                                              30,
                                                                              0),
                                                                      child: TextButton(
                                                                          onPressed: () {
                                                                            router.pop();
                                                                          },
                                                                          child: MiddleText(
                                                                            text:
                                                                                "close",
                                                                            color:
                                                                                AppColors.appPurple,
                                                                          )),
                                                                    ),
                                                                    Padding(
                                                                      padding:
                                                                          const EdgeInsets.fromLTRB(
                                                                              30,
                                                                              0,
                                                                              30,
                                                                              0),
                                                                      child: TextButton(
                                                                          onPressed: () async {
                                                                            startLoad(setState);
                                                                            await onChangeFunction(
                                                                              i: i,
                                                                              naklInfoItemstems: widget.naklInfoItemstems!,
                                                                              price: double.parse(priceContraller.text),
                                                                              count: double.parse(countContraller.text),
                                                                              summa: double.parse(summContraller.text),
                                                                            );
                                                                            endLoad(setState);
                                                                          },
                                                                          child: load == true
                                                                              ? const CircularProgressIndicator()
                                                                              : MiddleText(
                                                                                  text: "save",
                                                                                  color: AppColors.appPurple,
                                                                                )),
                                                                    )
                                                                  ],
                                                                )
                                                              ],
                                                            );
                                                          },
                                                        );
                                                      } else {
                                                        try {
                                                          await naklinfo.saveDocument(
                                                              naklinfo_items_model: NaklInfoItemsModel(
                                                                  id: naklInfoItemstems
                                                                      .id,
                                                                  typ_d: naklInfoItemstems
                                                                      .typ_d,
                                                                  n_dok: naklInfoItemstems
                                                                      .n_dok,
                                                                  data_d: DateFormat('dd.MM.yyyy').format(DateTime.parse(
                                                                      naklInfoItemstems
                                                                          .data_d
                                                                          .toString())),
                                                                  kodpost: naklInfoItemstems
                                                                      .kodpost,
                                                                  namepost: naklInfoItemstems
                                                                      .namepost,
                                                                  skl1: naklInfoItemstems.typ_d == 15 || naklInfoItemstems.typ_d == 18 || naklInfoItemstems.typ_d == 19
                                                                      ? naklInfoItemstems
                                                                          .skl1
                                                                      : 0,
                                                                  skl2: naklInfoItemstems.typ_d == 16 ||
                                                                          naklInfoItemstems.typ_d == 17 ||
                                                                          naklInfoItemstems.typ_d == 18 ||
                                                                          naklInfoItemstems.typ_d == 20
                                                                      ? naklInfoItemstems.skl2
                                                                      : 0,
                                                                  skl1name: naklInfoItemstems.typ_d == 15 || naklInfoItemstems.typ_d == 18 || naklInfoItemstems.typ_d == 19 ? naklInfoItemstems.skl1name : "",
                                                                  skl2name: naklInfoItemstems.typ_d == 16 || naklInfoItemstems.typ_d == 17 || naklInfoItemstems.typ_d == 18 || naklInfoItemstems.typ_d == 20 ? naklInfoItemstems.skl2name : "",
                                                                  srok_oplati: DateFormat('dd.MM.yyyy').format(DateTime.parse(naklInfoItemstems.srok_oplati.toString())),
                                                                  prim: naklInfoItemstems.prim.toString(),
                                                                  aktiv: naklInfoItemstems.aktiv,
                                                                  val: naklInfoItemstems.val,
                                                                  skidka: naklInfoItemstems.skidka,
                                                                  tip_skidki: naklInfoItemstems.tip_skidki,
                                                                  contact_litso: naklInfoItemstems.contact_litso,
                                                                  kurs: naklInfoItemstems.kurs,
                                                                  pr_ras: naklInfoItemstems.pr_ras),
                                                              tovarArrayItems: TovarArrayItems(id: 0, id_d: naklInfoItemstems.id!, typ_d: naklInfoItemstems.typ_d!, kod_tov: getSearchedProduct.searchResult[i].kod_tov!, name: getSearchedProduct.searchResult[i].name!, kol: 1, ed_izm: getSearchedProduct.searchResult[i].ed_izm!, cena_p: naklInfoItemstems.typ_d == 15 || naklInfoItemstems.typ_d == 18 || naklInfoItemstems.typ_d == 19 ? double.parse(getSearchedProduct.searchResult[i].price_s.toString()) : 0, cena_o: naklInfoItemstems.typ_d == 16 || naklInfoItemstems.typ_d == 17 || naklInfoItemstems.typ_d == 18 || naklInfoItemstems.typ_d == 20 ? double.parse(getSearchedProduct.searchResult[i].price_s.toString()) : 0, summa_p: naklInfoItemstems.typ_d == 15 || naklInfoItemstems.typ_d == 18 || naklInfoItemstems.typ_d == 19 ? double.parse(getSearchedProduct.searchResult[i].price_s.toString()) : 0, summa_o: naklInfoItemstems.typ_d == 16 || naklInfoItemstems.typ_d == 17 || naklInfoItemstems.typ_d == 18 || naklInfoItemstems.typ_d == 20 ? double.parse(getSearchedProduct.searchResult[i].price_s.toString()) : 0, barcode: getSearchedProduct.searchResult[i].barcode, price: getSearchedProduct.searchResult[i].price_s!.toDouble(), summa_price: getSearchedProduct.searchResult[i].price_s!.toDouble(), tip_skidki: naklInfoItemstems.tip_skidki.toString(), pr_ras: 0, cena_v: 0, summa_v: 0, idd_rn: 0, rn: 0, spis: "0", data_pr: "", kd: 0, data_sr: "", nds: 0, cena_nds: 0, summa_nds: 0, cena_bez_nds: 0, summa_bez_nds: 0, cena_nds_prixoda: 0, summa_nds_prixoda: 0, skidka: 0),
                                                              context: context);
                                                        } catch (e) {
                                                          if (e is DioError) {
                                                            await ErrorHandler
                                                                .errorModal(
                                                              context: context,
                                                              errorCode:
                                                                  e.response,
                                                            );
                                                          } else {
                                                            print(e.toString());
                                                          }
                                                        }
                                                        searchByNameContraller
                                                            .clear();
                                                        Navigator.pop(context);
                                                      }
                                                    }
                                                  }),
                                            ),
                                          ),
                                      ])),
                                )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        }).whenComplete(() {
      getSearchedProduct.searchResult.clear();
      searchByNameContraller.text = "";
    });
  }

  startLoad(setState) {
    setState(() {
      load = true;
    });
  }

//Stop Delete Loading
  endLoad(setState) {
    setState(() {
      load = false;
      router.pop();
    });
  }
}
