import 'package:app_e_commers/core/routing/app_routes.dart';
import 'package:app_e_commers/core/styling/images.dart';
import 'package:app_e_commers/core/utils/service_locator.dart';
import 'package:app_e_commers/core/utils/storage_hlper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    waitAnimationAndNavigate();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1, milliseconds: 370),
    )..repeat(reverse: true);
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeOut,
    );
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  waitAnimationAndNavigate() async {
    await Future.delayed(Duration(seconds: 3));
    sl<StorageHeper>().getData().then((value) {
      if (value != null && value.isNotEmpty) {
        GoRouter.of(context).pushReplacementNamed(AppRoutes.mainScreen);
      } else {
        GoRouter.of(context).pushReplacementNamed(AppRoutes.loginScreen);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ScaleTransition(
          scale: animation,
          child: Image.asset(AppImages.logo, width: 150.w, height: 150.h),
        ),
      ),
    );
  }
}
