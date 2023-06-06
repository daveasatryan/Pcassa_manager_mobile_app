import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../constants/app_themes/app_colors/app_colors.dart';
import '../router/services.dart';

class ErrorHandler {
  static Future<bool?> errorModal({
    required BuildContext context,
    required errorCode,
  }) async {
    String? title;
    //For Status
    switch (errorCode) {
      case 'errors.notDelete':
        {
          title = "not.delete";
          break;
        }
      case 'productNotFound':
        {
          title = "productNotFound";
          break;
        }
      //For Errors
      default:
        {
          title = errorCode == null
              ? 'errors.lost.contection'
              : errorCode.data["errors"];
        }
    }

    return showDialog<bool?>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: title != null
              ? Text(
                  title.tr(),
                  style: Theme.of(context).textTheme.headline1!.copyWith(
                      color: AppColors.appBlack,
                      fontSize: 20,
                      fontWeight: FontWeight.w300),
                  textAlign: TextAlign.center,
                )
              : null,
          children: [
            TextButton(
              onPressed: router.pop,
              child: Text(
                'done'.tr(),
                style: const TextStyle(color: AppColors.appPurple),
              ),
            ),
          ],
        );
      },
    );
  }
}
