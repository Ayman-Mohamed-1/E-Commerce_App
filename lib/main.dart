import 'package:app_e_commers/core/styling/theme_data.dart';
import 'package:app_e_commers/core/utils/service_locator.dart';
import 'package:app_e_commers/core/routing/router_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  // await ProductRepo().getPoructs();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          theme: AppThemes.lightTheme,
          routerConfig: RouterGenerator.goRouter,
        );
      },
    );
  }
}
