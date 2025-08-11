class AuthState {}

class LoadingAuthState extends AuthState {}

class InitialAuthState extends AuthState {}

class ErrorAuthState extends AuthState {
  final String errorMessage;
  ErrorAuthState(this.errorMessage);
}

class SuccessAuthState extends AuthState {
  final String successMessage;
  SuccessAuthState(this.successMessage);
}
