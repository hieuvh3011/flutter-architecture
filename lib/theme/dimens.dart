import 'package:flutter/material.dart';
import 'package:flutter_architecture/utils/ui_utils.dart';

class Dimens {
  static double getLogoSize(BuildContext context) =>
      getScreenWidth(context) / 5;
  static const double screenPaddingHorizontal = 16;
  static const double screenPaddingVertical = 16;

  static const double headerTextSize = 30;
}
