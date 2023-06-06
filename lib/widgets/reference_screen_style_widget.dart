import 'package:flutter/material.dart';
import 'package:pcassa_retail/constants/dimensions/dimensions.dart';
import 'package:pcassa_retail/widgets/app_icons.dart';
import 'package:pcassa_retail/widgets/big_text.dart';

class ReferenceScreenStyle extends StatelessWidget {
  final String text;
  const ReferenceScreenStyle({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.only(left: Dimensions.paddingLeft12),
            child: AppIcons(
              icon: Icons.note_alt_outlined,
              size: Dimensions.iconSize24,
            )),
        SizedBox(
          width: Dimensions.width15,
        ),
        BigText(text: text),
      ],
    );
  }
}
