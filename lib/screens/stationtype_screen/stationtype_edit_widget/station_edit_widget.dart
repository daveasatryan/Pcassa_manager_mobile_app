// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pcassa_retail/constants/dimensions/dimensions.dart';
import 'package:pcassa_retail/widgets/middle_text.dart';

import '../../../constants/app_themes/app_colors/app_colors.dart';
import '../../../error_handler/error_handler.dart';
import '../../../router/services.dart';
import '../../../store/station_type_state/station_type_state.dart';
import '../../../store/warehouse_state/warehouse_state.dart';

class EditStationType extends StatefulWidget {
  const EditStationType(
      {Key? key,
      required this.stationTypeStateName,
      required this.cod,
      required this.stationTypePrim,
      required this.stationTypeRshet})
      : super(key: key);

  final stationTypeStateName;
  final String? stationTypePrim;
  final String? stationTypeRshet;
  final cod;

  @override
  State<EditStationType> createState() => _EditStationTypeState();
}

class _EditStationTypeState extends State<EditStationType> {
  var stationTypeStateContraller = TextEditingController();
  var stationTypeStatePrimContraller = TextEditingController();
  var stationTypeStateRshetContraller = TextEditingController();
  var stationTypeState = GetIt.I<StationTypeState>();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    stationTypeStateContraller.text = widget.stationTypeStateName;
    stationTypeStatePrimContraller.text =
        widget.stationTypePrim == 'null' || widget.stationTypePrim == null
            ? " "
            : widget.stationTypePrim!;
    stationTypeStateRshetContraller.text =
        widget.stationTypeRshet == 'null' || widget.stationTypeRshet == null
            ? " "
            : widget.stationTypeRshet!;
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: TextFormField(
          controller: stationTypeStateContraller,
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
          controller: stationTypeStateRshetContraller,
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
                  style: TextStyle(
                      color: AppColors.appCoral, fontSize: Dimensions.font12),
                  children: [
                    TextSpan(
                        text: "settlementAccount".tr(),
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
          controller: stationTypeStatePrimContraller,
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
                  style: TextStyle(
                      color: AppColors.appCoral, fontSize: Dimensions.font12),
                  children: [
                    TextSpan(
                        text: "description".tr(),
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
      ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(AppColors.appPurple),
          ),
          onPressed: () async {
            if (stationTypeStateContraller.text == '') {
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
                    id: widget.cod,
                    name: stationTypeStateContraller.text,
                    prim: stationTypeStatePrimContraller.text,
                    rshet: stationTypeStateRshetContraller.text);
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
