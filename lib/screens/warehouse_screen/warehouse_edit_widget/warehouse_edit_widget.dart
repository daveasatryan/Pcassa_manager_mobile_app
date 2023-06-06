// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../constants/app_themes/app_colors/app_colors.dart';
import '../../../constants/dimensions/dimensions.dart';
import '../../../error_handler/error_handler.dart';
import '../../../router/services.dart';
import '../../../store/warehouse_state/warehouse_state.dart';
import '../../../widgets/middle_text.dart';

class EditWarehouse extends StatefulWidget {
  const EditWarehouse(
      {Key? key, required this.warehouseName, required this.cod})
      : super(key: key);

  final warehouseName;
  final cod;

  @override
  State<EditWarehouse> createState() => _EditWarehouseState();
}

class _EditWarehouseState extends State<EditWarehouse> {
  var warehouseNameContraller = TextEditingController();
  var warehouseState = GetIt.I<WarehouseState>();
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    warehouseNameContraller.text = widget.warehouseName;
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
            } else if (warehouseNameContraller.text.isNotEmpty) {
              setState(() {
                isLoading = true;
              });
              //Geting product Groups

              try {
                await warehouseState.postWarehouse(
                    cod: widget.cod, name: warehouseNameContraller.text);
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
