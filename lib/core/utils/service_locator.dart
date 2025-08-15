import 'package:app_e_commers/core/networking/dio_helper.dart';
import 'package:app_e_commers/core/utils/storage_hlper.dart';
import 'package:app_e_commers/features/auth/cubit/auth_cubit.dart';
import 'package:app_e_commers/features/auth/repo/auth_repo.dart';
import 'package:app_e_commers/features/cardScreen/cubit/cart_product_cubit.dart';
import 'package:app_e_commers/features/cardScreen/repo/cart_repo.dart';
import 'package:app_e_commers/features/homeScreem/cubit/categories/cubit/categories_cubit.dart';
import 'package:app_e_commers/features/homeScreem/cubit/product/product_cubit.dart';
import 'package:app_e_commers/features/homeScreem/repo/productRepo.dart';

import 'package:get_it/get_it.dart';

GetIt sl = GetIt.instance;

void setupServiceLocator() {
  // DioHelper dio = DioHelper();

  sl.registerLazySingleton(() => StorageHeper());

  // sl.registerSingleton<DioHelper>(dio);

  // sl.registerLazySingleton(() => AuthRepo(sl()));

  // sl.registerFactory(() => AuthCubit(sl()));
  sl.registerLazySingleton<DioHelper>(() => DioHelper());
  sl.registerLazySingleton<ProductRepo>(() => ProductRepo());
  sl.registerLazySingleton<ProductCubit>(() => ProductCubit());
  sl.registerLazySingleton<CartProductCubit>(() => CartProductCubit());
  sl.registerLazySingleton<AuthCubit>(() => AuthCubit());
  sl.registerLazySingleton<CategoriesCubit>(() => CategoriesCubit());
  sl.registerLazySingleton<AuthRepo>(() => AuthRepo());
  sl.registerLazySingleton<CartRepo>(() => CartRepo());
}
