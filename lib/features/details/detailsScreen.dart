// ignore_for_file: file_names

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:app_e_commers/core/styling/app_colors.dart';
import 'package:app_e_commers/core/styling/app_styling.dart';
import 'package:app_e_commers/core/utils/animatedSnackBar.dart';
import 'package:app_e_commers/core/widgets/back.dart';
import 'package:app_e_commers/core/widgets/primary_button_widget.dart';
import 'package:app_e_commers/features/cardScreen/cubit/cart_product_cubit.dart';
import 'package:app_e_commers/features/cardScreen/cubit/cart_product_state.dart';
import 'package:app_e_commers/features/homeScreem/model/productModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:readmore/readmore.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.product});
  final ProductsModel product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(59.h),
                Row(
                  children: [
                    BackBtnAc(),
                    Gap(108.w),
                    Text(
                      "Details",
                      style: AppStyles.primaryHeadLineStyle.copyWith(
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
                Gap(20.h),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
                  child: SizedBox(
                    width: 341.w,
                    height: 368.h,
                    child: Hero(
                      tag: product.image,
                      child: Image.network(
                        product.image,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: 341.w,
                            height: 368.h,
                            color: AppColors.blackColor,
                          );
                        },
                      ),
                    ),
                    // color: Colors.grey,
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Gap(12.h),
                        Text(
                          product.title.toString(),
                          style: AppStyles.primaryHeadLineStyle.copyWith(
                            fontSize: 24.sp,
                          ),
                        ),
                        Gap(13.h),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Color(0xffFFA928),
                              size: 30,
                            ),
                            Text(
                              product.rating.rate.toString(),
                              style: AppStyles.subtitleStyle.copyWith(
                                color: AppColors.blackColor,
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            Text(
                              product.rating.count.toString(),
                              style: AppStyles.subtitleStyle.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Gap(13.h),
                        ReadMoreText(
                          product.description.toString(),
                          style: AppStyles.subtitleStyle,
                          trimMode: TrimMode.Line,
                          trimLines: 2,
                          colorClickableText: AppColors.primaryColor,
                          trimCollapsedText: 'Read More',
                          trimExpandedText: 'Read less',
                          moreStyle: TextStyle(
                            fontWeight: FontWeight.w800,
                            color: AppColors.primaryColor,
                          ),
                          lessStyle: TextStyle(
                            fontWeight: FontWeight.w800,
                            color: AppColors.primaryColor,
                          ),
                        ),
                        Gap(120.h),
                      ],
                    ),
                  ),
                ),
              ],
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
                            Text("Price", style: AppStyles.subtitleStyle),
                            Text(
                              product.price.toString(),
                              style: AppStyles.primaryHeadLineStyle.copyWith(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        BlocConsumer<CartProductCubit, CartState>(
                          listener: (context, state) {
                            if (state is SuccessAddingToCarts) {
                              showAnimatedSnackDialog(
                                context,
                                message:
                                    "Product Added Successfully To Our Cart",
                                type: AnimatedSnackBarType.success,
                              );
                            }
                          },
                          builder: (context, state) {
                            if (state is AddingToCart) {
                              return PrimaryButtonWidget(
                                width: 240.w,
                                height: 54.h,
                                buttonText: "Add to Cart",
                                isLoding: true,
                              );
                            }
                            return PrimaryButtonWidget(
                              onPress: () {
                                context.read<CartProductCubit>().addingCart(
                                  product: product,
                                  quantity: 1,
                                );
                              },
                              width: 240.w,
                              height: 54.h,
                              buttonText: "Add to Cart",
                              icon: Icon(
                                Icons.shopping_cart_outlined,
                                color: AppColors.whiteColor,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
