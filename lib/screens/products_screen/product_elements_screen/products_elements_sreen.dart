// ignore_for_file: prefer_typing_uninitialized_variables, use_build_context_synchronously, sort_child_properties_last, unrelated_type_equality_checks
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get_it/get_it.dart';
import 'package:pcassa_retail/constants/app_themes/app_icons/app_icons.dart';
import 'package:pcassa_retail/constants/dimensions/dimensions.dart';
import 'package:pcassa_retail/constants/paddings_constants/padding_constants.dart';
import 'package:pcassa_retail/router/router.gr.dart';
import 'package:pcassa_retail/screens/products_screen/product_elements_screen/product_element_create_widget/product_element_create_widget.dart';
import 'package:pcassa_retail/screens/products_screen/product_elements_screen/product_element_edit_widget/product_element_edit_widget.dart';
import 'package:pcassa_retail/store/search_state/search_state.dart';
import 'package:pcassa_retail/widgets/big_text.dart';
import 'package:pcassa_retail/widgets/middle_text.dart';
import 'package:scan/scan.dart';
import '../../../constants/app_themes/app_colors/app_colors.dart';
import '../../../router/services.dart';
import '../../../store/product_state/product_state.dart';

class Products extends StatefulWidget {
  const Products({
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
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  //getproducts State
  final getProducts = GetIt.I<CreatedProducts>();
  final searchState = GetIt.I<SearchState>();
  final ScrollController _scrollController = ScrollController();
  //Scan Contraller
  ScanController controller = ScanController();

  //Scan Result defination
  var _scanResult = '';

  //Barcode Scanner
/* ---- */
  var nameSearchContraller = TextEditingController();
  var searchByBarcodeContraller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        //trigger leaving and use own data

        router.replace(const ProductsGroupRoute());

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
                router.replace(const ProductsGroupRoute());
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
                  ),
                ],
              ),
            ),
          ],
        ),
        body: Observer(
            builder: (_) => getProducts.groupElement.isEmpty
                ? Center(
                    child: MiddleText(
                      text: "emptyList".tr(),
                      color: AppColors.appBlack,
                    ),
                  )
                : Column(
                    children: [
                      BottomAppBar(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16, right: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: double.infinity,
                          child: GridView.count(
                              controller: _scrollController,
                              crossAxisCount: 1,
                              childAspectRatio: 9,
                              children: [
                                for (int i = 0;
                                    i < getProducts.groupElement.length;
                                    i++)
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: InkWell(
                                      onTap: () {
                                        showGeneralDialog(
                                          context: context,
                                          barrierDismissible: false,
                                          transitionBuilder: (context,
                                              animation,
                                              secondaryAnimation,
                                              child) {
                                            return FadeTransition(
                                              opacity: animation,
                                              child: ScaleTransition(
                                                scale: animation,
                                                child: child,
                                              ),
                                            );
                                          },
                                          pageBuilder: (context, animation,
                                              secondaryAnimation) {
                                            return EditElement(
                                              element:
                                                  getProducts.groupElement[i],
                                              isRoot: widget.isRoot,
                                              mainCategoryGuid:
                                                  widget.mainCategoryGuid,
                                              mainCategoryName:
                                                  widget.mainCategoryName,
                                            );
                                          },
                                        );
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            color: getProducts.groupElement[i]
                                                        .status ==
                                                    true
                                                ? AppColors.appCoral
                                                : AppColors.appLightBlack),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        paddingLeft, 0, 0, 0),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(2),
                                                  child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Center(
                                                          child: MiddleText(
                                                            size: Dimensions
                                                                .font12,
                                                            text:
                                                                "${getProducts.groupElement[i].name}",
                                                            color: AppColors
                                                                .appWhite,
                                                          ),
                                                        )
                                                      ]),
                                                )),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                              ]),
                        ),
                      ),
                    ],
                  )),
        persistentFooterButtons: [
          Padding(
            padding: const EdgeInsets.all(paddingAll),
            child: Stack(
              children: [
                FloatingActionButton(
                  backgroundColor: AppColors.appCoral,
                  onPressed: _showBarcodeScanner,
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ),
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
                  onTap: () => searchByName()),
              SpeedDialChild(
                  child: const Icon(Icons.search),
                  backgroundColor: AppColors.appCoral,
                  foregroundColor: Colors.white,
                  label: 'searchByBarcode'.tr(),
                  onTap: () {
                    _searchByBarcode();
                  }
                  // _showBarcodeScanner(
                  //     naklInfoItemstems: widget.naklInfoItemstems!)
                  ),
            ],
          ),
        ],
      ),
    );
  }

  //display dialog
  _displayDialog(BuildContext context, isRoot, mainCategoryGuid, barCode) {
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
        return CreateElement(
          barCode: barCode,
          isRoot: isRoot,
          mainCategoryGuid: mainCategoryGuid,
          mainCategoryName: widget.mainCategoryName,
        );
      },
    );
  }

  searchByName() {
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
                                setState(() {
                                  getProducts.searchName = "";
                                });
                                router.pop();
                              },
                              child: MiddleText(text: "close")),
                        ],
                      ),
                      Column(children: [
                        TextFormField(
                            controller: nameSearchContraller,
                            onChanged: (vlaue) async {
                              if (nameSearchContraller.text.length >= 3) {
                                if (nameSearchContraller.text.isNotEmpty) {
                                  await searchState.getProductByName(
                                      context: context,
                                      productName: nameSearchContraller.text);
                                } else {
                                  nameSearchContraller.text = "";
                                }
                              }
                            }),
                        Observer(
                          builder: (_) => Container(
                            height: 200,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(children: [
                                for (int i = 0;
                                    i < getProducts.groupElementNames.length;
                                    i++)
                                  if (searchState.searchResult.any((element) =>
                                      element.name ==
                                      getProducts.groupElementNames[i]))
                                    SizedBox(
                                        child: Container(
                                            width: double.infinity,
                                            child: TextButton(
                                                child: MiddleText(
                                                    text: getProducts
                                                        .groupElementNames[i]),
                                                onPressed: () {
                                                  for (int j = 0;
                                                      j <
                                                          getProducts
                                                              .groupElement
                                                              .length;
                                                      j++) {
                                                    if (getProducts
                                                            .groupElement[j]
                                                            .name ==
                                                        getProducts
                                                                .groupElementNames[
                                                            i]) {
                                                      showGeneralDialog(
                                                          context: context,
                                                          barrierDismissible:
                                                              false,
                                                          transitionBuilder:
                                                              (context,
                                                                  animation,
                                                                  secondaryAnimation,
                                                                  child) {
                                                            return FadeTransition(
                                                              opacity:
                                                                  animation,
                                                              child:
                                                                  ScaleTransition(
                                                                scale:
                                                                    animation,
                                                                child: child,
                                                              ),
                                                            );
                                                          },
                                                          pageBuilder: (context,
                                                              animation,
                                                              secondaryAnimation) {
                                                            return EditElement(
                                                              element: getProducts
                                                                  .groupElement[i],
                                                              isRoot:
                                                                  widget.isRoot,
                                                              mainCategoryGuid:
                                                                  widget
                                                                      .mainCategoryGuid,
                                                              mainCategoryName:
                                                                  widget
                                                                      .mainCategoryName,
                                                            );
                                                          });
                                                    }
                                                  }
                                                })))
                              ]),
                            ),
                          ),
                        ),
                      ]),
                    ]),
              ),
            ),
          );
        });
  }

  _searchByBarcode() {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (builder) {
        return StatefulBuilder(builder: (BuildContext context, setState) {
          return SizedBox(
              height: MediaQuery.of(context).size.height / 2,
              child: Scaffold(
                appBar: _buildBarcodeSearchScannerAppBar(),
                body: _buildBarcodeSearchScannerBody(),
              ));
        });
      },
    );
  }

//Barcode Scanner App Bar
  AppBar _buildBarcodeSearchScannerAppBar() {
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
                controller.pause;
                await router.pop();
                showDialog<bool?>(
                  context: context,
                  barrierDismissible: true,
                  builder: (BuildContext context) {
                    return SimpleDialog(
                      title: MiddleText(text: "writeBarcode"),
                      children: [
                        Padding(
                            padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: searchByBarcodeContraller,
                            )),
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
                                    searchByBarcodeContraller.clear();
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
                                  onPressed: () {
                                    if (getProducts.groupElement.any(
                                        (element) =>
                                            element.barcode ==
                                            searchByBarcodeContraller.text)) {
                                      for (int j = 0;
                                          j < getProducts.groupElement.length;
                                          j++) {
                                        if (getProducts
                                                .groupElement[j].barcode ==
                                            searchByBarcodeContraller.text) {
                                          showGeneralDialog(
                                              context: context,
                                              barrierDismissible: false,
                                              transitionBuilder: (context,
                                                  animation,
                                                  secondaryAnimation,
                                                  child) {
                                                return FadeTransition(
                                                  opacity: animation,
                                                  child: ScaleTransition(
                                                    scale: animation,
                                                    child: child,
                                                  ),
                                                );
                                              },
                                              pageBuilder: (context, animation,
                                                  secondaryAnimation) {
                                                return EditElement(
                                                  element: getProducts
                                                      .groupElement[j],
                                                  isRoot: widget.isRoot,
                                                  mainCategoryGuid:
                                                      widget.mainCategoryGuid,
                                                  mainCategoryName:
                                                      widget.mainCategoryName,
                                                );
                                              });
                                        }
                                      }
                                    } else {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          String contentText =
                                              "productNotFoundOnThisGroup";
                                          return StatefulBuilder(
                                            builder: (context, setState) {
                                              return AlertDialog(
                                                content: Text(contentText),
                                                actions: <Widget>[
                                                  TextButton(
                                                    onPressed: () {
                                                      router.pop();
                                                    },
                                                    child: Text("ok"),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                      );
                                    }
                                  },
                                  child: MiddleText(
                                    text: "search",
                                    color: AppColors.appPurple,
                                  )),
                            )
                          ],
                        )
                      ],
                    );
                  },
                );
              },
              icon: CustomIcons.editBarcode,
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

  Widget _buildBarcodeSearchScannerBody() {
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
            await router.pop();
            if (getProducts.groupElement
                .any((element) => element.barcode == data)) {
              for (int j = 0; j < getProducts.groupElement.length; j++) {
                if (getProducts.groupElement[j].barcode == data) {
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
                        return EditElement(
                          element: getProducts.groupElement[j],
                          isRoot: widget.isRoot,
                          mainCategoryGuid: widget.mainCategoryGuid,
                          mainCategoryName: widget.mainCategoryName,
                        );
                      });
                }
              }
            } else {
              showDialog(
                context: context,
                builder: (context) {
                  String contentText = "productNotFoundOnThisGroup";
                  return StatefulBuilder(
                    builder: (context, setState) {
                      return AlertDialog(
                        content: Text(contentText),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              router.pop();
                            },
                            child: Text("ok"),
                          ),
                        ],
                      );
                    },
                  );
                },
              );
            }
          }),
    );
  }

//BarcodeScaner Function
  _showBarcodeScanner() {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (builder) {
        return StatefulBuilder(builder: (BuildContext context, setState) {
          return SizedBox(
              height: MediaQuery.of(context).size.height / 2,
              child: Scaffold(
                appBar: _buildBarcodeScannerAppBar(),
                body: _buildBarcodeScannerBody(),
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
                controller.pause;
                await router.pop();
                _displayDialog(
                    context, widget.isRoot, widget.mainCategoryGuid, '');
              },
              icon: CustomIcons.editBarcode,
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
  Widget _buildBarcodeScannerBody() {
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
          await router.pop();
          _displayDialog(
              context, widget.isRoot, widget.mainCategoryGuid, data.toString());
        },
      ),
    );
  }
}
