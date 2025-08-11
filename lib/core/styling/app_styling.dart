import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';
import 'app_fonts.dart';

class AppStyles {
  static TextStyle primaryHeadLineStyle = TextStyle(
    fontFamily: AppFonts.mainFontMain,
    fontSize: 32.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.blackColor,
  );
  static TextStyle subtitleStyle = TextStyle(
    fontFamily: AppFonts.mainFontMain,
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textColor,
  );
  static TextStyle textFelde = TextStyle(
    fontFamily: AppFonts.mainFontMain,
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.feldeColor,
  );
}
