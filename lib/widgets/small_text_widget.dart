import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pcassa_retail/constants/app_themes/app_colors/app_colors.dart';
import 'package:pcassa_retail/constants/dimensions/dimensions.dart';

class SmallText extends StatelessWidget {
  final String text;
  double size;
  Color? color;
  TextOverflow overFlow;
  SmallText(
      {Key? key,
      required this.text,
      this.size = 0,
      this.color = AppColors.appBlack,
      this.overFlow = TextOverflow.ellipsis})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text.tr(),
      maxLines: 1,
      overflow: overFlow,
      style: TextStyle(
        color: color,
        fontSize: size == 0 ? Dimensions.font12 : size,
      ),
    );
  }
}
