import 'package:app_e_commers/features/auth/CreateAccount.dart';
import 'package:app_e_commers/features/cardScreen/cubit/cart_product_cubit.dart';
import 'package:app_e_commers/features/details/detailsScreen.dart';
import 'package:app_e_commers/features/homeScreem/model/productModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../core/utils/service_locator.dart';

import '../features/address/address.dart';
import '../features/auth/cubit/auth_cubit.dart';
import '../features/auth/loginScreen.dart';
import '../features/main_screen/mainScreen.dart';

import 'app_routes.dart';

class RouterGenerator {
  static GoRouter goRouter = GoRouter(
    errorBuilder: (context, state) =>
        const Scaffold(body: Center(child: Text("route not found"))),
    initialLocation: AppRoutes.loginScreen,
    routes: [
      GoRoute(
        path: AppRoutes.createAccount,
        name: AppRoutes.createAccount,
        builder: (context, state) => const CreateAccount(),
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
        builder: (context, state) => BlocProvider(
          create: (context) => sl<CartProductCubit>(),
          child: const mainScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.detailsScreen,
        name: AppRoutes.detailsScreen,
        builder: (context, state) {
          final product = state.extra as ProductModel;
          return BlocProvider(
            create: (context) => sl<CartProductCubit>(),
            child: DetailsScreen(product: product),
          );
        },
      ),
      GoRoute(
        path: AppRoutes.address,
        name: AppRoutes.address,
        builder: (context, state) => const AddressScreen(),
      ),
    ],
  );
}
