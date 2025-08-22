// ignore_for_file: file_names

import 'package:app_e_commers/core/styling/app_colors.dart';
import 'package:app_e_commers/features/account/widget/accountItem.dart';
import 'package:app_e_commers/core/routing/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../core/styling/app_styling.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Gap(59.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Account",
                style: AppStyles.primaryHeadLineStyle.copyWith(fontSize: 24),
              ),
            ],
          ),
          Gap(24.h),
          const Divider(color: Color.fromARGB(255, 136, 134, 134)),
          AccountItem(title: "My Orders", iconPath: "assets/icons/Vector1.png"),
          const AccountItem(
            title: "My Details",
            iconPath: "assets/icons/Vector2.png",
          ),
          AccountItem(
            title: "Address Book",
            iconPath: "assets/icons/Vector3.png",
            onTap: () {
              GoRouter.of(context).pushNamed(AppRoutes.address);
            },
          ),
          const AccountItem(
            title: "FAQs",
            iconPath: "assets/icons/Vector4.png",
          ),
          const AccountItem(
            title: "Help Center",
            iconPath: "assets/icons/Vector5.png",
          ),
          Spacer(),
          InkWell(
            onTap: () {
              // Handle log out action here
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Log Out",
                  style: AppStyles.textFelde.copyWith(
                    color: AppColors.redColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Gap(8.w),
                Icon(Icons.logout, size: 25.w, color: AppColors.redColor),
              ],
            ),
          ),
          Gap(15.h),
        ],
      ),
    );
  }
}
