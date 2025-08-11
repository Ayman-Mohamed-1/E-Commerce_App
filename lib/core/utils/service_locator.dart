import 'package:app_e_commers/core/networking/dio_helper.dart';
import 'package:app_e_commers/core/utils/storage_hlper.dart';
import 'package:app_e_commers/features/auth/cubit/auth_cubit.dart';
import 'package:app_e_commers/features/auth/repo/auth_repo.dart';

import 'package:get_it/get_it.dart';

GetIt sl = GetIt.instance;

void setupServiceLocator() {
  DioHelper dio = DioHelper();

  sl.registerLazySingleton(() => StorageHeper());

  sl.registerSingleton<DioHelper>(dio);

  sl.registerLazySingleton(() => AuthRepo(sl()));

  sl.registerFactory(() => AuthCubit(sl()));
}
