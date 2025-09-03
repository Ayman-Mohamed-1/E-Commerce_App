// ignore_for_file: file_names
import 'package:app_e_commers/core/styling/app_colors.dart';
import 'package:app_e_commers/core/styling/app_styling.dart';
import 'package:app_e_commers/core/widgets/custom_text_filde.dart';

import 'package:app_e_commers/features/homeScreem/cubit/categories/cubit/categories_cubit.dart';
import 'package:app_e_commers/features/homeScreem/cubit/product/product_cubit.dart';
import 'package:app_e_commers/features/homeScreem/widgets/category_item_widget.dart';
import 'package:app_e_commers/features/homeScreem/widgets/prodact_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:shimmer/shimmer.dart';

import '../../core/routing/app_routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String isSelectedIndex = "All";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap(49.h),
          Text("Discover", style: AppStyles.primaryHeadLineStyle),
          Gap(16.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextFilde(
                width: 281.w,
                height: 50.h,
                hintText: "Search for products",
                suffixIcon: Icon(Icons.search),
              ),
              Gap(8.w),
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
          Gap(16.h),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: BlocBuilder<CategoriesCubit, CategoriesState>(
              builder: (context, state) {
                if (state is CategorieLoading) {
                  return Container();
                } else if (state is CategorieLoaded) {
                  return Row(
                    children: state.categorie.map((cat) {
                      return CategoryItemWidget(
                        isSelected: isSelectedIndex == cat ? true : false,
                        onTap: () {
                          setState(() {
                            isSelectedIndex = cat;
                            if (isSelectedIndex == "All") {
                              context.read<ProductCubit>().getAllProducts();
                            } else {
                              context
                                  .read<ProductCubit>()
                                  .fetchProductCategories(cat);
                            }
                          });
                        },
                        text: cat,
                      );
                    }).toList(),
                  );

                  // Row(
                  //   children: List.generate(state.categorie.length, (index) {
                  //     final categorie = state.categorie[index];
                  //     final cat = state.categorie;

                  //     return CategoryItemWidget(
                  //       isSelected: isSelectedIndex == index ? true : false,
                  //       onTap: () {
                  //         setState(() {
                  //           isSelectedIndex = index;
                  //           // context.read<ProductCubit>().fetchProductCategories(
                  //           //   state.categorie[index] as String,
                  //           // );
                  //         });
                  //       },
                  //       text: categorie.name,
                  //     );
                  //   }),
                  // );
                } else if (state is CategorieError) {
                  return Text(state.message);
                }
                return const Center(child: Text('No products found'));
              },
            ),
          ),
          Gap(24.h),
          BlocBuilder<ProductCubit, ProductState>(
            builder: (context, state) {
              if (state is ProdectLoading) {
                return Expanded(
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey[400]!,
                    highlightColor: Colors.grey[100]!,
                    child: GridView.builder(
                      itemCount: 6,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 8.sp,
                        crossAxisSpacing: 16.sp,
                        childAspectRatio: 0.7,
                      ),
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(color: Colors.amber),
                          width: 150.w,
                          height: 120.h,
                        );
                      },
                    ),
                  ),
                );
              } else if (state is ProdectLoaded) {
                return Expanded(
                  child: RefreshIndicator(
                    color: AppColors.primaryColor,
                    backgroundColor: AppColors.whiteColor,
                    onRefresh: () async {
                      isSelectedIndex = "All";
                      setState(() {});
                      await context.read<ProductCubit>().getAllProducts();
                    },
                    child: AnimationLimiter(
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
                          return AnimationConfiguration.staggeredList(
                            position: index,
                            // columnCount: state.products.length,
                            duration: const Duration(milliseconds: 600),

                            child: SlideAnimation(
                              verticalOffset: 200.0,
                              child: FadeInAnimation(
                                child: GestureDetector(
                                  onTap: () {
                                    GoRouter.of(context).pushNamed(
                                      AppRoutes.detailsScreen,
                                      extra: product,
                                    );
                                  },
                                  child: ProdactItem(
                                    itemName: product.title.toString(),
                                    itemPrise: product.price.toString(),
                                    image: product.image,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
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
