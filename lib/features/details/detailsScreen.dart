

import 'package:app_e_commers/core/styling/app_colors.dart';
import 'package:app_e_commers/core/styling/app_styling.dart';
import 'package:app_e_commers/core/widgets/gap.dart';
import 'package:app_e_commers/core/widgets/primary_button_widget.dart';
import 'package:app_e_commers/features/details/widget/back_btn_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(
                    height: 59.h,
                  ),
                  Row(
                    children: [
                      BackBtn(),
                      Gap(
                        width: 108.w,
                      ),
                      Text(
                        "Details",
                        style: AppStyles.primaryHeadLineStyle
                            .copyWith(fontSize: 24),
                      )
                    ],
                  ),
                  Gap(
                    height: 20.h,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: Colors.grey,
                    ),
                    width: 341.w,
                    height: 368.h,
                    // color: Colors.grey,
                  ),
                  Gap(
                    height: 12.h,
                  ),
                  Text(
                    "Fit Polo T Shirt",
                    style: AppStyles.primaryHeadLineStyle
                        .copyWith(fontSize: 24.sp),
                  ),
                  Gap(
                    height: 13.h,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Color(0xffFFA928),
                        size: 30,
                      ),
                      Text(
                        "4.0/5 ",
                        style: AppStyles.subtitleStyle.copyWith(
                            color: AppColors.blackColor,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.underline),
                      ),
                      Text(
                        "(45 reviews)",
                        style: AppStyles.subtitleStyle
                            .copyWith(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Gap(
                    height: 13.h,
                  ),
                  Text(
                    "Blue T Shirt . Good for All Men and Suits for All of Them.Blue T Shirt . Good for All Men and Suits for All of Them Blue T Shirt . Good for All Men and Suits for All of Them.Blue T Shirt . Good for All Men and Suits for All of ThemBlue T Shirt . Good for All Men and Suits for All of Them.Blue T Shirt . Good for All Men and Suits for All of ThemBlue T Shirt . Good for All Men and Suits for All of Them.Blue T Shirt . Good for All Men and Suits for All of ThemBlue T Shirt . Good for All Men and Suits for All of Them.Blue T Shirt . Good for All Men and Suits for All of ThemBlue T Shirt . Good for All Men and Suits for All of Them.Blue T Shirt . Good for All Men and Suits for All of ThemBlue T Shirt . Good for All Men and Suits for All of Them.Blue T Shirt . Good for All Men and Suits for All of ThemBlue T Shirt . Good for All Men and Suits for All of Them.Blue T Shirt . Good for All Men and Suits for All of ThemBlue T Shirt . Good for All Men and Suits for All of Them.Blue T Shirt . Good for All Men and Suits for All of ThemBlue T Shirt . Good for All Men and Suits for All of Them.Blue T Shirt . Good for All Men and Suits for All of ThemBlue T Shirt . Good for All Men and Suits for All of Them.Blue T Shirt . Good for All Men and Suits for All of Them",
                    style: AppStyles.subtitleStyle,
                  ),
                  Gap(
                    height: 150.h,
                  )
                ],
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                color: AppColors.whiteColor,
                child: Column(
                  children: [
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.all(24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Price",
                                style: AppStyles.subtitleStyle,
                              ),
                              Text(
                                "\$ 1,190",
                                style: AppStyles.primaryHeadLineStyle.copyWith(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          PrimaryButtonWidget(
                            onPress: () {},
                            width: 240.w,
                            height: 54.h,
                            buttonText: "Add to Cart",
                            icon: Icon(Icons.shopping_cart_outlined,
                                color: AppColors.whiteColor),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
