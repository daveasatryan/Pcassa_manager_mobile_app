import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get_it/get_it.dart';
import 'package:pcassa_retail/constants/app_themes/app_colors/app_colors.dart';
import 'package:pcassa_retail/constants/app_themes/app_icons/app_icons.dart';
import 'package:pcassa_retail/constants/dimensions/dimensions.dart';
import 'package:pcassa_retail/constants/paddings_constants/padding_constants.dart';
import 'package:pcassa_retail/router/services.dart';
import 'package:pcassa_retail/screens/act_realisation_screen/act_realisation_screen.dart';
import 'package:pcassa_retail/screens/remainder_screen/filter_remainder_dialog.dart';
import 'package:pcassa_retail/screens/remainder_screen/remainder_screen.dart';
import 'package:pcassa_retail/store/act_realisation_state/act_realisation_state.dart';
import 'package:pcassa_retail/store/get_saled_products_state/get_saled_products_state.dart';
import 'package:pcassa_retail/store/product_state/product_state.dart';
import 'package:pcassa_retail/store/remainder_items_state/remainder_items_state.dart';
import 'package:pcassa_retail/store/warehouse_state/warehouse_state.dart';
import 'package:pcassa_retail/widgets/app_icons.dart';

import '../../widgets/middle_text.dart';
import '../../widgets/text_form_field.dart';

class FilterReminder extends StatefulWidget {
  FilterReminder({Key? key}) : super(key: key);
  static DateTime? pickedDate2;
  static String? productGroupContraller;
  static String? productItemContraller;
  static var secondDatecontraller = TextEditingController();
  static String? firstWarehouseContraller;
  @override
  State<FilterReminder> createState() => _FilterReminderState();
}

//CurrencyList

//States getting

var saledProductsState = GetIt.I<SaledProductsState>();
var productState = GetIt.I<CreatedProducts>();
var warehouseState = GetIt.I<WarehouseState>();

var remainderState = GetIt.I<RemainderItemsState>();
//var documentViewState = GetIt.I<DocumentViewState>();

class _FilterReminderState extends State<FilterReminder> {
  // bool? statusChecked;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return AppColors.appCoral;
    }

    return Scaffold(
        appBar: AppBar(
            title: MiddleText(
              text: "searchDocumentByFilter",
              color: AppColors.appWhite,
            ),
            backgroundColor: AppColors.appPurple,
            actions: [
              TextButton(
                  onPressed: () async {
                    await searchDocument();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(paddingAll),
                    child: MiddleText(
                      text: "search",
                      color: AppColors.appWhite,
                    ),
                  )),
              TextButton(
                  onPressed: () async {
                    await resetFilter();
                     router.pop();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(paddingAll),
                    child: MiddleText(
                      text: "resetFilter",
                      color: AppColors.appWhite,
                    ),
                  ))
            ]),
        body: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.all(paddingAll),
              child: Column(
                children: [
                  Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.circular(Dimensions.borderRadius10),
                          boxShadow: const [
                            BoxShadow(
                                color: Color.fromRGBO(143, 148, 251, .2),
                                blurRadius: 20.0,
                                offset: Offset(0, 10))
                          ]),
                      child: Column(
                        children: [
                          //Document number

                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: paddingHorizontal,
                                vertical: paddingVertical),
                            child: CreateAndEditForm(
                              onTap: () {
                                setState(() {
                                  FilterReminder.secondDatecontraller.text = "";
                                });
                                showSecondDate();
                              },
                              textInputType: TextInputType.number,
                              contraller: FilterReminder.secondDatecontraller,
                              fildName: MiddleText(
                                text: 'secondDate'.tr(),
                              ),
                              requiredFildMark: "",
                              sufixIcon: IconButton(
                                  icon: AppIcons(
                                    icon: Icons.calendar_month,
                                    size: Dimensions.iconSize24,
                                  ),
                                  onPressed: () async {
                                    showSecondDate();
                                  }), //icon of text field
                              //label text of field
                            ),
                          ),

                          SizedBox(
                            width: Dimensions.width20,
                          ),
                          SizedBox(
                            height: Dimensions.height20,
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 0, vertical: paddingVertical),
                            child: ListTile(
                              title: Row(
                                children: [
                                  Expanded(
                                    child: MiddleText(
                                      text: 'warehouse',
                                      color: AppColors.appLightBlack,
                                    ),
                                  ),
                                ],
                              ),
                              subtitle: DropdownButton2(
                                  itemPadding: EdgeInsets.only(left: 0),
                                  dropdownPadding: EdgeInsets.only(left: 10),
                                  isExpanded: true,
                                  items: warehouseState.warehouseNames
                                      .map((item) => DropdownMenuItem(
                                            value: item,
                                            child: MiddleText(text: item),
                                          ))
                                      .toList(),
                                  value:
                                      FilterReminder.firstWarehouseContraller,
                                  onChanged: (value) {
                                    setState(() {
                                      FilterReminder.firstWarehouseContraller =
                                          value!;
                                    });
                                  },
                                  icon: AppIcons(
                                    icon: Icons.arrow_drop_down,
                                    size: Dimensions.iconSize24,
                                  ),
                                  buttonPadding:
                                      const EdgeInsets.only(left: 0, right: 0),
                                  dropdownMaxHeight: Dimensions.height50 * 4,
                                  scrollbarAlwaysShow: true,
                                  buttonHeight: Dimensions.height66),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 0, vertical: paddingVertical),
                            child: ListTile(
                              title: Row(
                                children: [
                                  Expanded(
                                    child: MiddleText(
                                      text: "productgroupaccess",
                                      color: AppColors.appLightBlack,
                                    ),
                                  ),
                                ],
                              ),
                              subtitle: DropdownButton2(
                                itemPadding: const EdgeInsets.only(left: 0),
                                dropdownPadding:
                                    const EdgeInsets.only(left: 10),
                                isExpanded: true,
                                items: productState.productsCategoryList
                                    .map((item) => DropdownMenuItem(
                                          value: item.caption,
                                          child: MiddleText(text: item.caption),
                                        ))
                                    .toList(),
                                value: FilterReminder.productGroupContraller,
                                onChanged: (value) {
                                  setState(() {
                                    FilterReminder.productGroupContraller =
                                        value!;
                                  });
                                },
                                icon: AppIcons(
                                  icon: Icons.arrow_drop_down,
                                  size: Dimensions.iconSize24,
                                ),
                                buttonPadding:
                                    const EdgeInsets.only(left: 0, right: 0),
                                dropdownMaxHeight: Dimensions.height50 * 4,
                                scrollbarAlwaysShow: true,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: Dimensions.height20,
                          ),

                          SizedBox(
                            height: Dimensions.height20,
                          ),
                          Padding(
                              padding: const EdgeInsets.all(10),
                              child: DropdownSearch<String>(
                                enabled: true,
                                clearButtonProps: ClearButtonProps(
                                  isVisible: true,
                                  color: AppColors.appCoral,
                                  icon: AppIcons(
                                    icon: Icons.clear_outlined,
                                  ),
                                ),
                                dropdownButtonProps: DropdownButtonProps(
                                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    color: AppColors.appCoral),
                                popupProps: PopupProps.menu(
                                    showSelectedItems: true,
                                    disabledItemFn: (String s) =>
                                        s.startsWith('I'),
                                    showSearchBox: true),
                                items: productState.productsElements
                                    .map((element) => element.name!)
                                    .toList(),
                                dropdownDecoratorProps: DropDownDecoratorProps(
                                  dropdownSearchDecoration: InputDecoration(
                                    labelStyle: const TextStyle(
                                        color: AppColors.appLightBlack),
                                    labelText: "products".tr(),
                                    hintText: "searchByName".tr(),
                                  ),
                                ),
                                onChanged: (value) {
                                  FilterReminder.productItemContraller = value;
                                },
                                selectedItem:
                                    FilterReminder.productItemContraller,
                              )),
                        ],
                      )),
                ],
              ),
            ),
          ),
        ));
  }

  resetFilter() {
    FilterReminder.secondDatecontraller.text = "";
    FilterReminder.productGroupContraller = "all".tr();
    FilterReminder.productItemContraller = "";
    FilterReminder.firstWarehouseContraller = "notSelected";
   
  }

  searchDocument() async {
   
    await remainderState.getRemainder(
        sklname: FilterReminder.firstWarehouseContraller == "notSelected" ||
                FilterReminder.firstWarehouseContraller == null
            ? ""
            : FilterReminder.firstWarehouseContraller,
        data_e: FilterReminder.secondDatecontraller.text == null
            ? ""
            : FilterReminder.secondDatecontraller.text,
        category_name: FilterReminder.productGroupContraller == null
            ? ""
            : FilterReminder.productGroupContraller == "all".tr()
                ? ""
                : FilterReminder.productGroupContraller!,
        name: FilterReminder.productItemContraller == null
            ? ""
            : FilterReminder.productItemContraller.toString(),
        order_by: "");
     setState(() {
      RemainderScreen.load_ = false;
    });
    router.pop();
  }

  showSecondDate() async {
    FilterReminder.pickedDate2 = await showDatePicker(
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      context: context,
      initialDate: DateTime.now(), //get today's date
      firstDate: DateTime(
          2000), //DateTime.now() - not to allow to choose before today.
      lastDate: DateTime(2101),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.appPurple, // <-- SEE HERE
              onPrimary: AppColors.appWhite, // <-- SEE HERE
              onSurface: AppColors.appBlack, // <-- SEE HERE
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                  primary: AppColors.appCoral // button text color
                  ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (FilterReminder.pickedDate2 != null) {
      String formattedDate = DateFormat('dd.MM.yyyy').format(FilterReminder
          .pickedDate2!); // format date in required form here we use yyyy-MM-dd that means time is removed

    } else {
      print("Date is not selected");
    }
  }
}
