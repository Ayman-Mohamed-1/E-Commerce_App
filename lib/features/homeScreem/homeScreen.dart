import 'package:app_e_commers/core/styling/app_colors.dart';
import 'package:app_e_commers/core/styling/app_styling.dart';
import 'package:app_e_commers/core/widgets/custom_text_filde.dart';
import 'package:app_e_commers/core/widgets/gap.dart';
import 'package:app_e_commers/features/homeScreem/widgets/category_item_widget.dart';
import 'package:app_e_commers/features/homeScreem/widgets/prodact_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../routing/app_routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap(height: 49.h),
          Text("Discover", style: AppStyles.primaryHeadLineStyle),
          Gap(height: 16.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextFilde(
                width: 281.w,
                height: 50.h,
                hintText: "Search for products",
                suffixIcon: Icon(Icons.search),
              ),
              Gap(width: 8.w),
              Container(
                width: 52.w,
                height: 50.h,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Icon(Icons.search, color: Colors.white, size: 25.sp),
              ),
            ],
          ),
          Gap(height: 16.h),
          const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CategoryItemWidget(text: "All"),
                CategoryItemWidget(text: "All"),
                CategoryItemWidget(text: "All"),
                CategoryItemWidget(text: "All"),
                CategoryItemWidget(text: "All"),
                CategoryItemWidget(text: "All"),
                CategoryItemWidget(text: "All"),
              ],
            ),
          ),
          Gap(height: 24.h),
          Expanded(
            child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8.sp,
                crossAxisSpacing: 16.sp,
                childAspectRatio: 0.7,
              ),
              children: [
                ProdactItem(
                  itemName: "Same Test",
                  itemPrise: "\$ 11120",
                  onTap: () =>
                      GoRouter.of(context).pushNamed(AppRoutes.detailsScreen),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
