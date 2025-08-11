import 'package:app_e_commers/core/widgets/primary_button_widget.dart';
import 'package:app_e_commers/features/cardScreen/widget/Caart_Item_totalPrice.dart';
import 'package:app_e_commers/features/cardScreen/widget/Card_item_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/styling/app_styling.dart';
import '../../core/widgets/gap.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Gap(height: 59.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "My Cart",
                style: AppStyles.primaryHeadLineStyle.copyWith(fontSize: 24),
              ),
            ],
          ),
          Gap(height: 20.h),
          const CardItemScreen(
            itemName: "Regular Fit Slogan",
            itemSize: "Size L",
            itemprice: "\$ 1,190",
          ),
          const CardItemScreen(
            itemName: "Regular Fit Slogan",
            itemSize: "Size L",
            itemprice: "\$ 1,190",
          ),
          Spacer(),
          // Gap(height: 120.h),
          const CardTotalePrice(price: "\$ 5,870", total: "Sub-total"),
          const CardTotalePrice(price: "\$ 5,870", total: "Sub-total"),
          const CardTotalePrice(price: "\$ 5,870", total: "Sub-total"),
          Divider(),
          const TotalPriceWidget(price: "\$ 5,870", total: "Sub-total"),
          Gap(height: 30.h),
          PrimaryButtonWidget(
            onPress: () {},
            buttonText: "Go To Checkout",
            trailingIcon: const Icon(
              Icons.arrow_circle_right_outlined,
              size: 30,
            ),
          ),
          Gap(height: 5.h),
        ],
      ),
    );
  }
}
