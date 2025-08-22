// ignore_for_file: file_names

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:app_e_commers/core/styling/app_styling.dart';
import 'package:app_e_commers/core/widgets/primary_button_widget.dart';
import 'package:app_e_commers/features/auth/cubit/auth_cubit.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../core/styling/app_colors.dart';
import '../../core/utils/animatedSnackBar.dart';
import '../../core/widgets/custom_text_filde.dart';

import '../../core/widgets/lading_widget.dart';
import '../../core/routing/app_routes.dart';
import 'cubit/auth_state.dart';

import '../../core/widgets/underText.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void initState() {
    super.initState();
    userName;
    password;
    // sl<StorageHeper>().getData(

    // ).then((value) {
    //   if (value != null && value.isNotEmpty) {
    //     GoRouter.of(context).pushReplacementNamed(AppRoutes.mainScreen);
    //   }
    // });
  }

  bool isPassword = true;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is ErrorAuthState) {
              showAnimatedSnackDialog(
                context,
                message: state.errorMessage,
                type: AnimatedSnackBarType.error,
              );
            } else if (state is SuccessAuthState) {
              showAnimatedSnackDialog(
                context,
                message: state.successMessage,
                type: AnimatedSnackBarType.success,
              );
              GoRouter.of(context).pushReplacementNamed(AppRoutes.mainScreen);
            }
          },
          builder: (context, state) {
            if (state is LoadingAuthState) {
              return const LoadingWidget();
            }
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 27.w),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gap(59.h),
                    SizedBox(
                      width: 335.w,
                      height: 42.h,
                      child: Text(
                        "Login to your account",
                        style: AppStyles.primaryHeadLineStyle,
                      ),
                    ),
                    Gap(8.h),
                    Text(
                      "It’s great to see you again.",
                      style: AppStyles.subtitleStyle,
                    ),
                    Gap(24.h),
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
                      controller: userName,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "enter your email";
                        }
                        return null;
                      },
                    ),
                    Gap(16.h),
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
                        if (value.length < 6) {
                          return "password must be at least 6 characters";
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
                          color: AppColors.feldeColor,
                          size: 25.sp,
                        ),
                      ),
                    ),
                    Gap(40.h),
                    PrimaryButtonWidget(
                      buttonText: "Sign In",
                      onPress: () {
                        if (formKey.currentState!.validate()) {
                          context.read<AuthCubit>().login(
                            userName: userName.text,
                            password: password.text,
                          );
                        } else {}
                      },
                    ),
                    // Gap(343.h),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        GoRouter.of(context).go(AppRoutes.createAccount);
                      },
                      child: UnderText(
                        textOne: "Don’t have an account?",
                        textTwo: " Join",
                        color: AppColors.blackColor,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
