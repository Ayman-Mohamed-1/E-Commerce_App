// ignore_for_file: file_names

import 'package:app_e_commers/core/styling/app_styling.dart';
import 'package:app_e_commers/core/widgets/primary_button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../core/styling/app_colors.dart';
import '../../core/widgets/custom_text_filde.dart';

import '../../core/routing/app_routes.dart';
import '../../core/widgets/underText.dart';

// import 'package:gap/gap.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final formKey = GlobalKey<FormState>();
  TextEditingController fullName = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  @override
  void initState() {
    super.initState();
    fullName;
    username;
    password;
    confirmPassword;
  }

  bool isPassword = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 27.w),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(59.h),
                  SizedBox(
                    width: 335.w,
                    height: 42.h,
                    child: Text(
                      "Create an account",
                      style: AppStyles.primaryHeadLineStyle,
                    ),
                  ),
                  Gap(8.h),
                  Text(
                    "Let’s create your account.",
                    style: AppStyles.subtitleStyle,
                  ),
                  Gap(24.h),
                  Text(
                    "Full Name",
                    style: AppStyles.subtitleStyle.copyWith(
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Gap(4.h),
                  CustomTextFilde(
                    hintText: "Enter your full name",
                    controller: fullName,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter your full name";
                      }
                      return null;
                    },
                  ),
                  Gap(10.h),
                  Text(
                    "User Name",
                    style: AppStyles.subtitleStyle.copyWith(
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Gap(4.h),
                  CustomTextFilde(
                    hintText: "Enter your email address",
                    controller: username,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "enter your email";
                      }
                      return null;
                    },
                  ),
                  Gap(10.h),
                  Text(
                    "Password",
                    style: AppStyles.subtitleStyle.copyWith(
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Gap(4.h),
                  CustomTextFilde(
                    controller: password,
                    hintText: "Enter your password",
                    isPassword: isPassword,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "enter your password";
                      }
                      if (value.length < 8) {
                        return "password must be at least 8 characters";
                      }
                      return null;
                    },
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isPassword = !isPassword;
                        });
                      },
                      icon: Icon(
                        isPassword
                            ? CupertinoIcons.eye_slash
                            : CupertinoIcons.eye,
                        // Icons.remove_red_eye,
                        color: AppColors.feldeColor,
                        size: 25.sp,
                      ),
                    ),
                  ),
                  Gap(10.h),
                  Text(
                    "Confirm Password",
                    style: AppStyles.subtitleStyle.copyWith(
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Gap(4.h),
                  CustomTextFilde(
                    controller: confirmPassword,
                    hintText: "Enter your password",
                    isPassword: isPassword,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "enter your password";
                      }
                      if (value.length < 8) {
                        return "password must be at least 8 characters";
                      }
                      return null;
                    },
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isPassword = !isPassword;
                        });
                      },
                      icon: Icon(
                        isPassword
                            ? CupertinoIcons.eye_slash
                            : CupertinoIcons.eye,
                        // Icons.remove_red_eye,
                        color: AppColors.feldeColor,
                        size: 25.sp,
                      ),
                    ),
                  ),
                  Gap(35.h),
                  PrimaryButtonWidget(
                    buttonText: "Create Account",
                    onPress: () {
                      if (formKey.currentState!.validate()) {
                        GoRouter.of(
                          context,
                        ).pushReplacementNamed(AppRoutes.loginScreen);
                      }
                    },
                  ),
                  Gap(131.h),
                  InkWell(
                    onTap: () {
                      GoRouter.of(
                        context,
                      ).pushReplacementNamed(AppRoutes.mainScreen);
                    },
                    child: UnderText(
                      textOne: "Already have an account?",
                      textTwo: " Log In",
                      color: AppColors.blackColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
