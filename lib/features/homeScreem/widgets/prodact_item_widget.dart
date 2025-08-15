import 'package:app_e_commers/core/styling/app_colors.dart';
import 'package:app_e_commers/core/styling/app_styling.dart';
import 'package:app_e_commers/core/widgets/gap.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProdactItem extends StatelessWidget {
  const ProdactItem({
    super.key,
    required this.itemName,
    required this.itemPrise,
    required this.image,
  });
  final String itemName;
  final String itemPrise;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: SizedBox(
              width: 162.w,
              height: 174.h,
              child: Image.network(image),
            ),
          ),
          Gap(height: 8.h),
          Text(
            itemName,
            style: AppStyles.subtitleStyle.copyWith(
              color: AppColors.blackColor,
              fontWeight: FontWeight.w600,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Gap(height: 5.h),
          Text(
            itemPrise,
            style: AppStyles.subtitleStyle.copyWith(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
