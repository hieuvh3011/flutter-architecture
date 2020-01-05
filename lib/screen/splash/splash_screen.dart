import 'dart:async';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture/res/images/images.dart';
import 'package:flutter_architecture/router/routes.dart';
import 'package:flutter_architecture/theme/colors.dart';
import 'package:flutter_architecture/utils/ui_utils.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer timer;

  ///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~///
  ///           OVERRIDE METHODS           ///
  ///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~///
  @override
  void initState() {
    super.initState();
    onWidgetBuildDone(_onBuildDone);
  }

  @override
  void dispose() {
    if (timer != null) {
      timer.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final logoSize = getScreenWidth(context) / 4;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Image.asset(
            Images.logo,
            width: logoSize,
            height: logoSize,
          ),
      ),
    );
  }

  ///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~///
  ///           BUILD METHODS              ///
  ///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~///

  ///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~///
  ///             OTHER METHODS            ///
  ///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~///
  _onBuildDone() async {

  }

  _navigateToHomeScreen() {
    navigateTo(context, '${Routes.homeScreen}',
        clearStack: true, transition: TransitionType.inFromBottom);
  }
}
