import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../app_assets/app_assets.dart';

//This is Loading widget

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    Key? key,
    this.path,
  }) : super(key: key);

  final String? path;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
      height: 150,
      width: 150,
      child: Lottie.asset(Assets.loadingAnimation),
    ));
  }
}
