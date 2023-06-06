import 'package:flutter/material.dart';
import 'package:pcassa_retail/constants/app_themes/app_colors/app_colors.dart';
import 'package:pcassa_retail/widgets/app_icons.dart';
import 'package:pcassa_retail/widgets/big_text.dart';

class NeedToPay extends StatefulWidget {
  NeedToPay({Key? key}) : super(key: key);

  @override
  State<NeedToPay> createState() => _NeedToPayState();
}

class _NeedToPayState extends State<NeedToPay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BigText(text: "LicenseExpexctNeedToPay"),
            SizedBox(height: 30),
            AppIcons(
              icon: Icons.warning_amber_rounded,
              size: 46,
              iconColor: AppColors.appCoral,
            )
          ],
        ),
      )),
    );
  }
}
