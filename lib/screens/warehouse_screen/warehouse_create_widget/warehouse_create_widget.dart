import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pcassa_retail/screens/products_screen/products_group_screen/products_categories_add_and_edit_wigdets/products_categories_edit_widget.dart';
import 'package:pcassa_retail/store/unit_state/unit_state.dart';

import '../../../constants/app_themes/app_colors/app_colors.dart';
import '../../../constants/dimensions/dimensions.dart';
import '../../../error_handler/error_handler.dart';
import '../../../router/services.dart';
import '../../../store/spent_state/spent_state.dart';
import '../../../store/warehouse_state/warehouse_state.dart';
import '../../../widgets/middle_text.dart';

class CreateWarehouse extends StatefulWidget {
  const CreateWarehouse({Key? key}) : super(key: key);

  @override
  State<CreateWarehouse> createState() => _CreateWarehouseState();
}

class _CreateWarehouseState extends State<CreateWarehouse> {
  var warehouseState = GetIt.I<WarehouseState>();

  var warehouseNameContraller = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.paddingHorizontal12,
          vertical: Dimensions.paddingVertical6,
        ),
        child: TextFormField(
          controller: warehouseNameContraller,
          style: const TextStyle(color: AppColors.appBlack),
          decoration: InputDecoration(
            border: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.appPurple),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.appPurple),
            ),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.appLightBlack),
            ),
            label: RichText(
              text: TextSpan(
                  text: '* '.tr(),
                  style: const TextStyle(
                    color: AppColors.appCoral,
                  ),
                  children: [
                    TextSpan(
                        text: "warehouseName".tr(),
                        style: const TextStyle(
                          color: AppColors.appLightBlack,
                        ))
                  ]),
            ),
            labelStyle: const TextStyle(color: AppColors.appLightBlack),
          ),
          onSaved: (String? value) {},
        ),
      ),
      ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(AppColors.appPurple),
          ),
          onPressed: () async {
            if (warehouseNameContraller.text == '') {
              showDialog<bool?>(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return SimpleDialog(
                    title: MiddleText(
                      text: "cardIsNotFull".tr(),
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
              setState(() {
                isLoading = true;
              });
              //Geting product Groups

              try {
                await warehouseState.postWarehouse(
                    cod: 0, name: warehouseNameContraller.text);
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
              setState(() {
                isLoading = false;
                router.pop(context);
              });
            }
          },
          child: isLoading
              ? SizedBox(
                  width: Dimensions.width20,
                  height: Dimensions.height20,
                  child: CircularProgressIndicator(
                    color: AppColors.appWhite,
                  ),
                )
              : MiddleText(
                  text: "save".tr(),
                  color: AppColors.appWhite,
                ))
    ]);
  }
}
