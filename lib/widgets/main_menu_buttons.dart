import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pcassa_retail/constants/app_themes/app_colors/app_colors.dart';
import 'package:pcassa_retail/constants/dimensions/dimensions.dart';
import '../constants/app_themes/app_icons/app_icons.dart';
import 'big_text.dart';

class MainMenuButtons extends StatelessWidget {
  final String buttonText;
  final IconData icon;
  const MainMenuButtons(
      {Key? key, required this.buttonText, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(Dimensions.borderRadius10),
          boxShadow: const [
            BoxShadow(
                color: Color.fromARGB(51, 130, 132, 168),
                blurRadius: 20.0,
                offset: Offset(0, 10))
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: Dimensions.iconSize48,
            color: AppColors.appCoral,
          ),
          SizedBox(
            height: Dimensions.height10,
          ),
          BigText(
            text: buttonText.tr(),
            color: AppColors.appBlack,
          ),
        ],
      ),
    );
  }
}
