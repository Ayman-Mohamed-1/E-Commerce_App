import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/styling/app_colors.dart';
import '../../../core/styling/app_styling.dart';

class CategoryItemWidget extends StatelessWidget {
  const CategoryItemWidget({
    super.key,
    required this.text,
    this.onTap,
    this.isSelected = false,
  });
  final String text;
  final void Function()? onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsetsDirectional.only(start: 8.w),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 7.h),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primaryColor : Colors.transparent,
            borderRadius: BorderRadius.circular(8.r),
            border: isSelected
                ? null
                : Border.all(color: AppColors.feldeColor, width: 0.5),
          ),
          child: Text(
            text,
            style: AppStyles.subtitleStyle.copyWith(
              color: isSelected ? AppColors.whiteColor : AppColors.blackColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
