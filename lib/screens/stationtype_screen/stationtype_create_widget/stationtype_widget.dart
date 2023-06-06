import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pcassa_retail/constants/dimensions/dimensions.dart';
import 'package:pcassa_retail/screens/products_screen/products_group_screen/products_categories_add_and_edit_wigdets/products_categories_edit_widget.dart';
import 'package:pcassa_retail/store/unit_state/unit_state.dart';
import 'package:pcassa_retail/widgets/middle_text.dart';

import '../../../constants/app_themes/app_colors/app_colors.dart';
import '../../../error_handler/error_handler.dart';
import '../../../router/services.dart';
import '../../../store/spent_state/spent_state.dart';
import '../../../store/station_type_state/station_type_state.dart';
import '../../../store/warehouse_state/warehouse_state.dart';

class CreateStationType extends StatefulWidget {
  const CreateStationType({Key? key}) : super(key: key);

  @override
  State<CreateStationType> createState() => _CreateStationTypeState();
}

class _CreateStationTypeState extends State<CreateStationType> {
  var stationTypeState = GetIt.I<StationTypeState>();

  var stationTypeContraller = TextEditingController();
  var settlementAccountContraller = TextEditingController();
  var descriptionContraller = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: TextFormField(
          controller: stationTypeContraller,
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
                  style: TextStyle(
                      color: AppColors.appCoral, fontSize: Dimensions.font12),
                  children: [
                    TextSpan(
                        text: "stationTypeName".tr(),
                        style: TextStyle(
                            color: AppColors.appLightBlack,
                            fontSize: Dimensions.font16))
                  ]),
            ),
            labelStyle: TextStyle(
                color: AppColors.appLightBlack, fontSize: Dimensions.font16),
          ),
          onSaved: (String? value) {},
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: TextFormField(
          controller: settlementAccountContraller,
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
                  text: ' '.tr(),
                  style: const TextStyle(
                    color: AppColors.appCoral,
                  ),
                  children: [
                    TextSpan(
                        text: "settlementAccount".tr(),
                        style: TextStyle(
                            color: AppColors.appLightBlack,
                            fontSize: Dimensions.font16))
                  ]),
            ),
            labelStyle: const TextStyle(color: AppColors.appLightBlack),
          ),
          onSaved: (String? value) {},
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: TextFormField(
          controller: descriptionContraller,
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
                  text: ''.tr(),
                  style: const TextStyle(
                    color: AppColors.appCoral,
                  ),
                  children: [
                    TextSpan(
                        text: "description".tr(),
                        style: TextStyle(
                            color: AppColors.appLightBlack,
                            fontSize: Dimensions.font16))
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
            if (stationTypeContraller.text == '') {
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
                        child: MiddleText(
                          text: 'done'.tr(),
                          color: AppColors.appPurple,
                        ),
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
                await stationTypeState.postStationType(
                    id: 0,
                    name: stationTypeContraller.text,
                    prim: descriptionContraller.text,
                    rshet: settlementAccountContraller.text);
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
                router.pop();
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
