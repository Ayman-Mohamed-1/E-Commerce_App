
// ignore_for_file: file_names

import 'package:app_e_commers/core/styling/app_styling.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardTotalePrice extends StatelessWidget {
  const CardTotalePrice({super.key, required this.total, required this.price});
  final String total;
  final String price;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            total,
            style: AppStyles.textFelde,
          ),
          Text(
            price,
            style: AppStyles.primaryHeadLineStyle.copyWith(fontSize: 16.sp),
          ),
        ],
      ),
    );
  }
}

class TotalPriceWidget extends StatelessWidget {
  const TotalPriceWidget({super.key, required this.total, required this.price});
  final String total;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            total,
            style: AppStyles.primaryHeadLineStyle.copyWith(fontSize: 16.sp),
          ),
          Text(
            price,
            style: AppStyles.primaryHeadLineStyle.copyWith(fontSize: 16.sp),
          ),
        ],
      ),
    );
  }
}
