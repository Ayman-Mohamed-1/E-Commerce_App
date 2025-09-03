import 'package:flutter/material.dart';
import 'package:go_transitions/go_transitions.dart';

import 'app_colors.dart';
import 'app_fonts.dart';
import 'app_styling.dart';

class AppThemes {
  static final lightTheme = ThemeData(
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: GoTransitions.cupertino,
        TargetPlatform.iOS: GoTransitions.cupertino,
        TargetPlatform.macOS: GoTransitions.cupertino,
      },
    ),
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.whiteColor,
    fontFamily: AppFonts.mainFontMain,
    textTheme: TextTheme(
      titleLarge: AppStyles.primaryHeadLineStyle,
      titleMedium: AppStyles.subtitleStyle,
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: AppColors.primaryColor,
      // disabledColor: AppColors.subtitleStyle,
    ),
  );
}
