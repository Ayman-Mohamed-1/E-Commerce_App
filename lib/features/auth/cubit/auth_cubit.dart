import 'package:app_e_commers/core/utils/service_locator.dart';
import 'package:app_e_commers/features/auth/repo/auth_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../modles/login_response_model.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  // AuthCubit() : super(InitialAuthState());
  AuthCubit(this._authRepo) : super(InitialAuthState());
  final AuthRepo _authRepo;

  void login({required String userName, required String password}) async {
    emit(LoadingAuthState());

    final Either<String, LoginResponseModel> res = await _authRepo.login(
      userName,
      password,
    );

    res.fold(
      (l) => emit(ErrorAuthState(l)),
      (r) => emit(SuccessAuthState("Login successfully")),
    );
  }
}
