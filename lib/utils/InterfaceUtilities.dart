import 'package:flutter/material.dart';

class InterfaceUtilities{
  static const double screenPadding = 15.0;
  static const double containerPadding = 5.0;

  static double borderRadiusExtraSmall = 7.0;
  static double borderRadiusSmall = 20.0;
  static double borderRadiusMedium = 30.0;
  static double borderRadiusLarge = 40.0;
  static double borderRadiusExtraLarge = 65.0;

  static double elevation = 5.0;

  static double dividerHeightSmall = 10.0;
  static double dividerHeightMedium = 15.0;
  static double dividerHeightLarge = 20.0;

  static double getPercentageOfScreenHeight(BuildContext context, double percentage)
  {
    return MediaQuery.of(context).size.height * percentage;
  }

  static double getPercentageOfScreenWidth(BuildContext context, double percentage)
  {
    return MediaQuery.of(context).size.width * percentage;
  }

  static double getScaledFontSize(BuildContext context, double fontSize)
  {
    return MediaQuery.of(context).size.height * (fontSize/100);
  }
}