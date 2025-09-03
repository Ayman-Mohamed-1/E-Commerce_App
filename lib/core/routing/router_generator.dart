import 'package:app_e_commers/features/auth/CreateAccount.dart';
import 'package:app_e_commers/features/details/detailsScreen.dart';
import 'package:app_e_commers/features/homeScreem/cubit/categories/cubit/categories_cubit.dart';
import 'package:app_e_commers/features/homeScreem/cubit/product/product_cubit.dart';
import 'package:app_e_commers/features/homeScreem/homeScreen.dart';
import 'package:app_e_commers/features/homeScreem/model/productModel.dart';
import 'package:app_e_commers/features/main_screen/mainScreen.dart';
import 'package:app_e_commers/features/splashScreen/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:go_transitions/go_transitions.dart';

import '../utils/service_locator.dart';

import '../../features/address/address.dart';
import '../../features/auth/cubit/auth_cubit.dart';
import '../../features/auth/loginScreen.dart';

import 'app_routes.dart';

class RouterGenerator {
  static GoRouter goRouter = GoRouter(
    errorBuilder: (context, state) =>
        Scaffold(body: Center(child: Text("route not found"))),
    initialLocation: AppRoutes.splashScreen,
    routes: [
      GoRoute(
        path: AppRoutes.createAccount,
        name: AppRoutes.createAccount,
        builder: (context, state) => CreateAccount(),
      ),
      GoRoute(
        path: AppRoutes.home,
        name: AppRoutes.home,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => ProductCubit()),
            BlocProvider(create: (context) => CategoriesCubit()),
          ],
          child: HomeScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.loginScreen,
        name: AppRoutes.loginScreen,
        builder: (context, state) => BlocProvider(
          create: (context) => sl<AuthCubit>(),
          child: const LoginScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.mainScreen,
        name: AppRoutes.mainScreen,
        builder: (context, state) => MainScreen(),
      ),
      GoRoute(
        pageBuilder: GoTransitions.fadeUpwards,
        path: AppRoutes.detailsScreen,
        name: AppRoutes.detailsScreen,
        builder: (context, state) {
          final product = state.extra as ProductsModel;
          return DetailsScreen(product: product);
        },
      ),
      GoRoute(
        // pageBuilder: GoTransitions.fadeUpwards,
        path: AppRoutes.address,
        name: AppRoutes.address,
        builder: (context, state) => AddressScreen(),
      ),
      GoRoute(
        path: AppRoutes.splashScreen,
        name: AppRoutes.splashScreen,
        builder: (context, state) => SplashScreen(),
      ),
    ],
  );
}
