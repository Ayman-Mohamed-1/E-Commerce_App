import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styling/app_colors.dart';

class PrimaryButtonWidget extends StatelessWidget {
  const PrimaryButtonWidget({
    super.key,
    this.buttonText,
    this.textColor,
    this.width,
    this.height,
    this.bordersRadius,
    this.fontSize,
    this.onPress,
    this.backgroundColor,
    this.icon,
    this.trailingIcon,
    this.isLoding = false,
  });
  final String? buttonText;
  final Color? backgroundColor;
  final Color? textColor;
  final double? width;
  final double? height;
  final double? bordersRadius;
  final double? fontSize;
  final bool isLoding;
  final Widget? icon;
  final Widget? trailingIcon;
  final void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(bordersRadius ?? 10.r),
        ),
        fixedSize: Size(width ?? 325.w, height ?? 50.h),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon != null ? icon! : const SizedBox.shrink(),
          icon != null ? SizedBox(width: 8.w) : const SizedBox.shrink(),
          isLoding
              ? SizedBox(
                  width: 30.w,
                  height: 30.h,
                  child: CircularProgressIndicator(color: Colors.white),
                )
              : Text(
                  buttonText ?? "",
                  style: TextStyle(
                    color: textColor ?? AppColors.whiteColor,
                    fontSize: fontSize ?? 16.sp,
                  ),
                ),
          trailingIcon != null ? SizedBox(width: 8.w) : const SizedBox.shrink(),
          trailingIcon != null ? trailingIcon! : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
