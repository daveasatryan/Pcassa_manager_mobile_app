import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get_it/get_it.dart';
import 'package:pcassa_retail/constants/app_themes/app_icons/app_icons.dart';
import 'package:pcassa_retail/constants/dimensions/dimensions.dart';
import 'package:pcassa_retail/constants/paddings_constants/padding_constants.dart';
import 'package:pcassa_retail/screens/products_screen/product_elements_screen/product_element_edit_widget/product_element_edit_widget.dart';
import 'package:pcassa_retail/screens/products_screen/products_group_screen/products_categories_add_and_edit_wigdets/products_categories_create_widget.dart';
import 'package:pcassa_retail/screens/products_screen/products_group_screen/products_category_part/products_category_part.dart';
import 'package:pcassa_retail/store/search_state/search_state.dart';
import 'package:pcassa_retail/widgets/app_icons.dart';
import 'package:pcassa_retail/widgets/big_text.dart';
import 'package:pcassa_retail/widgets/middle_text.dart';
import 'package:scan/scan.dart';
import '../../../constants/app_themes/app_colors/app_colors.dart';
import '../../../router/router.gr.dart';
import '../../../router/services.dart';
import '../../../store/authorization_state/authorization_state.dart';
import '../../../store/product_state/product_state.dart';

class ProductsGroupScreen extends StatefulWidget {
  const ProductsGroupScreen({
    Key? key,
  }) : super(key: key);
  @override
  State<ProductsGroupScreen> createState() => _ProductsGroupScreenState();
}

class _ProductsGroupScreenState extends State<ProductsGroupScreen> {
  //ScrolContraller
  final ScrollController _scrollController = ScrollController();
  final getProducts = GetIt.I<CreatedProducts>();
  final authState = GetIt.I<AuthorizationState>();
  final searchState = GetIt.I<SearchState>();
  //Scan Contraller
  ScanController controller = ScanController();

  //Scan Result defination
  var _scanResult = '';

  //Barcode Scanner
/* ---- */

  var searchByBarcodeContraller = TextEditingController();
  var nameSearchContraller = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProducts.groupElement.clear();
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
            text: 'products'.tr(),
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
                router.replace(const MainRoute());
              },
              icon: AppIcons(
                icon: Icons.arrow_back_sharp,
                iconColor: AppColors.appWhite,
                size: Dimensions.iconSize24,
              )),
        ),

        //ProductCategorysExpansion
        body: Observer(
          builder: (_) => getProducts.productsCategoryList.isEmpty
              ? Center(
                  child: MiddleText(
                    text: "addCategory".tr(),
                    color: AppColors.appCoral,
                  ),
                )
              : Scrollable(
                  controller: _scrollController,
                  viewportBuilder:
                      (BuildContext context, ViewportOffset position) {
                    return const ProductsCategoryPart();
                  },
                ),
        ),

        persistentFooterButtons: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: SpeedDial(
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
          ),
        ],
      ),
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
                                    i < searchState.searchResult.length;
                                    i++)
                                  SizedBox(
                                      child: Container(
                                          width: double.infinity,
                                          child: TextButton(
                                              child: MiddleText(
                                                  text: searchState
                                                      .searchResult[i].name!),
                                              onPressed: () {
                                                for (int j = 0;
                                                    j <
                                                        getProducts
                                                            .productsElements
                                                            .length;
                                                    j++) {
                                                  if (searchState
                                                          .searchResult[i]
                                                          .name ==
                                                      getProducts
                                                          .productsElements[j]
                                                          .name) {
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
                                                            opacity: animation,
                                                            child:
                                                                ScaleTransition(
                                                              scale: animation,
                                                              child: child,
                                                            ),
                                                          );
                                                        },
                                                        pageBuilder: (context,
                                                            animation,
                                                            secondaryAnimation) {
                                                          return EditElement(
                                                            element: getProducts
                                                                .productsElements[j],
                                                            isRoot: 1,
                                                            mainCategoryGuid:
                                                                getProducts
                                                                    .productsElements[
                                                                        j]
                                                                    .gguid,
                                                            mainCategoryName:
                                                                "",
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
                                    if (getProducts.productsElements.any(
                                        (element) =>
                                            element.barcode ==
                                            searchByBarcodeContraller.text)) {
                                      for (int j = 0;
                                          j < getProducts.productsElements.length;
                                          j++) {
                                        if (getProducts
                                                .productsElements[j].barcode ==
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
                                                      .productsElements[j],
                                                  isRoot: 1,
                                                  mainCategoryGuid:
                                                    getProducts.productsElements[j].gguid,
                                                  mainCategoryName:"",
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
                                                    child: const Text("ok"),
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
            if (getProducts.productsElements
                .any((element) => element.barcode == data)) {
              for (int j = 0; j < getProducts.productsElements.length; j++) {
                if (getProducts.productsElements[j].barcode == data) {
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
                          element: getProducts.productsElements[j],
                          isRoot: 1,
                          mainCategoryGuid: getProducts.productsElements[j].gguid,
                          mainCategoryName: "",
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
                            child: const Text("ok"),
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

}
