import 'package:app_e_commers/core/styling/app_colors.dart';
import 'package:app_e_commers/core/styling/app_styling.dart';
import 'package:app_e_commers/core/widgets/custom_text_filde.dart';
import 'package:app_e_commers/core/widgets/gap.dart';
import 'package:app_e_commers/features/homeScreem/cubit/categories/cubit/categories_cubit.dart';
import 'package:app_e_commers/features/homeScreem/cubit/product/product_cubit.dart';
import 'package:app_e_commers/features/homeScreem/widgets/category_item_widget.dart';
import 'package:app_e_commers/features/homeScreem/widgets/prodact_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: BlocBuilder<CategoriesCubit, CategoriesState>(
              builder: (context, state) {
                if (state is CategorieLoading) {
                  return Container();
                } else if (state is CategorieLoaded) {
                  return Row(
                    children: List.generate(state.categorie.length, (index) {
                      final categorie = state.categorie[index];
                      return CategoryItemWidget(text: categorie.name);
                    }),
                  );
                } else if (state is CategorieError) {
                  return Text(state.message);
                }
                return const Center(child: Text('No products found'));
              },
            ),
          ),
          Gap(height: 24.h),
          BlocBuilder<ProductCubit, ProductState>(
            builder: (context, state) {
              if (state is ProdectLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is ProdectLoaded) {
                return Expanded(
                  child: GridView.builder(
                    itemCount: state.products.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 8.sp,
                      crossAxisSpacing: 16.sp,
                      childAspectRatio: 0.7,
                    ),
                    itemBuilder: (context, index) {
                      final product = state.products[index];
                      return GestureDetector(
                        onTap: () {
                          GoRouter.of(
                            context,
                          ).pushNamed(AppRoutes.detailsScreen, extra: product);
                        },
                        child: ProdactItem(
                          itemName: product.title,
                          itemPrise: product.price.toString(),
                          image: product.image,
                        ),
                      );
                    },
                  ),
                );
              } else if (state is ProductError) {
                return Text(state.message);
              }
              return const Center(child: Text('No products found'));
            },
          ),
        ],
      ),
    );
  }
}
