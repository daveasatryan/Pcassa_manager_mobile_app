import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../constants/app_themes/app_colors/app_colors.dart';
import '../constants/dimensions/dimensions.dart';
import 'app_icons.dart';
import 'big_text.dart';

class ReferenceScreen extends StatelessWidget {
  final String title;
  const ReferenceScreen({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(Dimensions.borderRadius10),
          boxShadow: [
            BoxShadow(
                color: Color.fromARGB(51, 130, 132, 168),
                blurRadius: Dimensions.borderRadius10 * 2,
                offset: Offset(0, 10))
          ]),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppIcons(
            icon: Icons.note_alt_outlined,
            iconColor: AppColors.appCoral,
            size: Dimensions.iconSize48,
          ),
          SizedBox(
            height: Dimensions.height20,
          ),
          Flexible(
              child: Padding(
            padding: EdgeInsets.only(
                left: Dimensions.paddingLeft12,
                right: Dimensions.paddingRight12),
            child: BigText(
              text: title.tr(),
            ),
          )),
        ],
      )),
    );
  }
}
