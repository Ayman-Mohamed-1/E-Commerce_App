// ignore_for_file: file_names

import 'package:app_e_commers/core/widgets/lading_widget.dart';
import 'package:app_e_commers/core/widgets/primary_button_widget.dart';
import 'package:app_e_commers/features/cardScreen/cubit/cart_product_cubit.dart';
import 'package:app_e_commers/features/cardScreen/cubit/cart_product_state.dart';
import 'package:app_e_commers/features/cardScreen/widget/Caart_Item_totalPrice.dart';
import 'package:app_e_commers/features/cardScreen/widget/Card_item_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../core/styling/app_styling.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartProductCubit, CartState>(
      builder: (context, state) {
        if (state is LoadingCarts) {
          return LoadingWidget(
            height: MediaQuery.of(context).size.height * 0.65,
          );
        }
        if (state is SuccessGettingCarts) {
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
                      "My Cart",
                      style: AppStyles.primaryHeadLineStyle.copyWith(
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
                Gap(20.h),
                ...state.cart.products.map((p) {
                  return CardItemScreen(product: p);
                }),
                Spacer(),
                // Gap( 120.h),
                const CardTotalePrice(price: "\$ 5,870", total: "Sub-total"),
                const CardTotalePrice(price: "\$ 5,870", total: "Sub-total"),
                const CardTotalePrice(price: "\$ 5,870", total: "Sub-total"),
                Divider(),
                const TotalPriceWidget(price: "\$ 5,870", total: "Sub-total"),
                Gap(30.h),
                PrimaryButtonWidget(
                  onPress: () {},
                  buttonText: "Go To Checkout",
                  trailingIcon: const Icon(
                    Icons.arrow_circle_right_outlined,
                    size: 30,
                  ),
                ),
                Gap(5.h),
              ],
            ),
          );
        }
        return Container();
      },
    );
  }
}
