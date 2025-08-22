// ignore_for_file: file_names

import 'package:app_e_commers/features/cardScreen/cubit/cart_product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/styling/app_colors.dart';
import '../account/accountScreem.dart';
import '../cardScreen/cardScreen.dart';
import '../homeScreem/homeScreen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  List<Widget> screens = [
    const HomeScreen(),
    const CardScreen(),
    const AccountScreen(),
    // const AddressScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: screens[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          elevation: 1,
          unselectedItemColor: Colors.grey,
          selectedItemColor: AppColors.primaryColor,
          currentIndex: currentIndex,
          onTap: (value) {
            setState(() {
              currentIndex = value;
              if (value == 1) {
                context.read<CartProductCubit>().getCart();
              }
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined, size: 30.sp),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined, size: 30.sp),
              label: "Cart",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined, size: 30.sp),
              label: "Account",
            ),
          ],
        ),
      ),
    );
  }
}
