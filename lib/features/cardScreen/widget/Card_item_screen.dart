// ignore_for_file: file_names

import 'package:app_e_commers/core/styling/app_colors.dart';
import 'package:app_e_commers/core/styling/app_styling.dart';

import 'package:app_e_commers/features/cardScreen/model/cartModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CardItemScreen extends StatelessWidget {
  const CardItemScreen({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 14.h),
      child: Container(
        width: 342.w,
        height: 107.h,
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: AppColors.grey),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Padding(
          padding: EdgeInsets.all(15.sp),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(width: 83.w, height: 79.h, color: Colors.grey),
              Gap(16.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.productId.toString(),
                    style: AppStyles.primaryHeadLineStyle.copyWith(
                      fontSize: 14.sp,
                    ),
                  ),
                  Gap(1.h),
                  Text(
                    "itemSize",
                    style: AppStyles.subtitleStyle.copyWith(fontSize: 12.sp),
                  ),
                  // Gap( 15.h),
                  Spacer(),
                  Text(
                    "100",
                    style: AppStyles.primaryHeadLineStyle.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Icon(Icons.delete_rounded, color: AppColors.redColor),
                  Gap(29.h),
                  Row(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: 20.w,
                        height: 20.h,
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.grey, width: 0.5),
                          borderRadius: BorderRadius.all(Radius.circular(2.r)),
                        ),
                        child: Icon(Icons.remove, size: 20),
                      ),
                      Gap(4.w),
                      Text("1"),
                      Gap(4.w),
                      Container(
                        alignment: Alignment.center,
                        width: 20.w,
                        height: 20.h,
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.grey, width: 0.5),
                          borderRadius: BorderRadius.all(Radius.circular(2.r)),
                        ),
                        child: Icon(Icons.add, size: 20),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
