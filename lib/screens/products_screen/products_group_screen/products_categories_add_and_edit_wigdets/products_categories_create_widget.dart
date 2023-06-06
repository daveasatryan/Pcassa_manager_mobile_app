// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pcassa_retail/constants/dimensions/dimensions.dart';
import 'package:pcassa_retail/widgets/middle_text.dart';

import '../../../../constants/app_themes/app_colors/app_colors.dart';
import '../../../../error_handler/error_handler.dart';
import '../../../../router/services.dart';
import '../../../../store/product_state/product_state.dart';

class CreateGroup extends StatefulWidget {
  const CreateGroup({
    Key? key,
    required this.title,
    required this.isRoot,
    required this.parentGuid,
  }) : super(key: key);

  final String title;
  final isRoot;
  final parentGuid;
  @override
  State<CreateGroup> createState() => _CreateGroupState();
}

final getProducts = GetIt.I<CreatedProducts>();

var captionContraller = TextEditingController();
bool isLoading = false;

class _CreateGroupState extends State<CreateGroup> {
  @override
  void initState() {
    super.initState();
    captionContraller.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: TextFormField(
            controller: captionContraller,
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
                        color: AppColors.appCoral, fontSize: Dimensions.font16),
                    children: [
                      TextSpan(
                          text: widget.title.tr(),
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
            if (captionContraller.text == '') {
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
              switch (widget.parentGuid) {
                case '9d160d60-4c16-4ff7-b9f4-459c93313d14':
                  {
                    try {
                      await getProducts.addGroup(
                          context: context,
                          guid: 0.toString(),
                          parentGuid: widget.parentGuid,
                          caption: captionContraller.text,
                          isRoot: 0);

                      // await getProducts.categoryFirstMade();
                    } catch (e) {
                      if (e is DioError) {
                        await ErrorHandler.errorModal(
                          context: context,
                          errorCode: e.response,
                        );
                        break;
                      } else {
                        print(e.toString());
                        break;
                      }
                    }
                    break;
                  }
                default:
                  {
                    try {
                      await getProducts.addGroup(
                          context: context,
                          guid: 0.toString(),
                          parentGuid: widget.parentGuid,
                          caption: captionContraller.text,
                          isRoot: 1);
                    } catch (e) {
                      if (e is DioError) {
                        await ErrorHandler.errorModal(
                          context: context,
                          errorCode: e.response,
                        );
                        break;
                      } else {
                        print(e.toString());
                        break;
                      }
                    }
                  }
                  break;
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
                  child: const CircularProgressIndicator(
                    color: AppColors.appWhite,
                  ),
                )
              : MiddleText(
                  text: "save".tr(),
                  color: AppColors.appWhite,
                ),
        ),
      ],
    );
  }
}
