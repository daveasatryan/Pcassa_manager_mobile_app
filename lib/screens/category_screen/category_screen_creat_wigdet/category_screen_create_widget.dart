import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pcassa_retail/constants/dimensions/dimensions.dart';
import 'package:pcassa_retail/widgets/middle_text.dart';
import '../../../constants/app_themes/app_colors/app_colors.dart';
import '../../../error_handler/error_handler.dart';
import '../../../router/services.dart';
import '../../../store/category_state/category_state.dart';

class CreateProductType extends StatefulWidget {
  const CreateProductType({Key? key}) : super(key: key);

  @override
  State<CreateProductType> createState() => _CreateProductTypeState();
}

class _CreateProductTypeState extends State<CreateProductType> {
  final getProductType = GetIt.I<CategoryState>();

  var categoryNameContraller = TextEditingController();
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
          controller: categoryNameContraller,
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
                        text: "productTypeName".tr(),
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
            if (categoryNameContraller.text == '') {
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
                await getProductType.postCategory(
                    guid: 0, name: categoryNameContraller.text);
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
