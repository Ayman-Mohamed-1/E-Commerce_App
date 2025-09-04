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
  DioHelper dio = DioHelper();

  // Dio Helper
  sl.registerSingleton<DioHelper>(dio);

  //Storage Helper
  sl.registerLazySingleton(() => StorageHelper());

  // Repos
  sl.registerLazySingleton(() => AuthRepo(sl<DioHelper>()));
  sl.registerLazySingleton(() => ProductRepo(sl<DioHelper>()));
  sl.registerLazySingleton(() => CartRepo(sl<DioHelper>()));

  // Cubit
  sl.registerFactory(() => AuthCubit(sl<AuthRepo>()));
  sl.registerFactory(() => ProductCubit(sl<ProductRepo>()));
  sl.registerFactory(() => CategoriesCubit(sl<ProductRepo>()));
  sl.registerFactory(() => CartProductCubit(sl<CartRepo>()));
}
