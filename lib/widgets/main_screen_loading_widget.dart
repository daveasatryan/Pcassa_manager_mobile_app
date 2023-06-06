import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pcassa_retail/constants/app_themes/app_colors/app_colors.dart';
import 'package:pcassa_retail/constants/dimensions/dimensions.dart';
import 'package:pcassa_retail/widgets/big_text.dart';

import '../constants/app_assets/app_assets.dart';

//This is Loading widget

class MainScreenLoadingWidget extends StatelessWidget {
  const MainScreenLoadingWidget({
    Key? key,
    this.path,
  }) : super(key: key);

  final String? path;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Row(
        children: [
          SizedBox(
            height: Dimensions.loadanimationSize92,
            width: Dimensions.loadanimationSize92,
            child: Lottie.asset(Assets.loadingAnimation),
          ),
          SizedBox(width: Dimensions.width20),
          BigText(
            text: "loading",
            size: Dimensions.font18,
            color: AppColors.appBlack,
          ),
        ],
      ),
    );
  }
}
