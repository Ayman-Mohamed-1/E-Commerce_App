import 'package:app_e_commers/core/utils/service_locator.dart';
import 'package:app_e_commers/features/auth/cubit/auth_cubit.dart';
import 'package:app_e_commers/features/cardScreen/cubit/cart_product_cubit.dart';
import 'package:app_e_commers/features/homeScreem/cubit/categories/cubit/categories_cubit.dart';
import 'package:app_e_commers/features/homeScreem/cubit/product/product_cubit.dart';
import 'package:app_e_commers/core/routing/router_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => sl<AuthCubit>()),
            BlocProvider(create: (_) => sl<ProductCubit>()..getAllProducts()),
            BlocProvider(
              create: (_) => sl<CategoriesCubit>()..getAllCategorie(),
            ),
            BlocProvider(create: (_) => sl<CartProductCubit>()),
          ],
          child: MaterialApp.router(routerConfig: RouterGenerator.goRouter),
        );
      },
    );
  }
}
