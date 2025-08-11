import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../styling/app_colors.dart';

class PrimaryOutlinedButtonWidget extends StatelessWidget {
  const PrimaryOutlinedButtonWidget({
    super.key,
    this.buttonText,
    this.textColor,
    this.width,
    this.height,
    this.bordersRadius,
    this.fontSize,
    this.onPress,
    this.bordersColor,
  });
  final String? buttonText;
  final Color? bordersColor;
  final Color? textColor;
  final double? width;
  final double? height;
  final double? bordersRadius;
  final double? fontSize;
  final void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPress,
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: bordersColor ?? AppColors.primaryColor),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(bordersRadius ?? 8.r),
        ),
        fixedSize: Size(width ?? 331.w, height ?? 56.h),
      ),
      child: Text(
        buttonText ?? "",
        style: TextStyle(
          color: textColor ?? AppColors.primaryColor,
          fontSize: fontSize ?? 16.sp,
        ),
      ),
    );
  }
}
