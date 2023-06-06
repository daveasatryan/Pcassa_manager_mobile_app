import 'package:flutter/material.dart';
import 'package:pcassa_retail/constants/app_themes/app_colors/app_colors.dart';
import 'package:pcassa_retail/constants/dimensions/dimensions.dart';

class AppIcons extends StatelessWidget {
  final IconData icon;
  Color? backGroundColor;
  final Color iconColor;
  final double size;
  AppIcons({
    Key? key,
    required this.icon,
    this.backGroundColor,
    this.iconColor = AppColors.appCoral,
    this.size = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      color: iconColor,
      size: size==0?Dimensions.iconSize16:size,
    );
  }
}
