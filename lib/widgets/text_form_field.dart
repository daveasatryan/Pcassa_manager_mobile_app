import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pcassa_retail/widgets/middle_text.dart';

import '../constants/app_themes/app_colors/app_colors.dart';
import '../constants/dimensions/dimensions.dart';

class CreateAndEditForm extends StatelessWidget {
  var contraller;
  bool readOnly;
  Widget? sufixIcon;
  String requiredFildMark;
  final MiddleText fildName;
  TextInputType textInputType;
  Color inputTextColor;
  Color borderColor;
  Color fildColor;
  final VoidCallback? onTap;
  final VoidCallback? onChange;
  String? onChangeValue;

  Color focusedBorderColor;
  Color enabledBorderColor;
  CreateAndEditForm(
      {Key? key,
      this.onChangeValue,
      this.onTap,
      this.onChange,
      required this.contraller,
      this.requiredFildMark = '',
      required this.fildName,
      this.sufixIcon,
      this.inputTextColor = const Color(0xFF4C4C4C),
      this.borderColor = const Color(0xFFD1CFD7),
      this.enabledBorderColor = const Color(0xFFD1CFD7),
      this.focusedBorderColor = const Color(0xFF5131E6),
      this.readOnly = false,
      this.fildColor = const Color(0xFFD1CFD7),
      this.textInputType = TextInputType.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (onChangeValue) => onChange,
      onTap: onTap,
      keyboardType: textInputType,
      readOnly: readOnly,
      controller: contraller,
      style: TextStyle(color: inputTextColor),
      decoration: InputDecoration(
        suffixIcon: sufixIcon,
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: borderColor),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: focusedBorderColor),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: enabledBorderColor),
        ),
        label: RichText(
          text: TextSpan(
              text: requiredFildMark,
              style: TextStyle(
                  color: AppColors.appCoral, fontSize: Dimensions.font14),
              children: [
                TextSpan(
                    text: fildName.text.tr(),
                    style: TextStyle(
                        color: fildColor, fontSize: Dimensions.font14))
              ]),
        ),
        labelStyle: TextStyle(
            fontSize: Dimensions.font14, color: AppColors.appLightBlack),
      ),
    );
  }
}
