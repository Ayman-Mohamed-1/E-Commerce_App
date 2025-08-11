import 'package:app_e_commers/features/address/widget/addressCart.dart';
import 'package:app_e_commers/features/address/widget/back.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/styling/app_styling.dart';
import '../../core/widgets/gap.dart';


class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(height: 59.h),
            Row(
              children: [
                const BackBtnAc(),
                Gap(width: 108.w),
                Text(
                  "Address",
                  style: AppStyles.primaryHeadLineStyle.copyWith(fontSize: 24),
                ),
              ],
            ),
            Gap(height: 24.h),
            const Divider(color: Color.fromARGB(255, 136, 134, 134)),
            Gap(height: 20.h),
            Text(
              "Saved Address",
              style: AppStyles.primaryHeadLineStyle.copyWith(fontSize: 18),
            ),
            Gap(height: 14.h),
            ItemCart(title: "Home", location: "123 Main St, City, Country"),
          ],
        ),
      ),
    );
  }
}
