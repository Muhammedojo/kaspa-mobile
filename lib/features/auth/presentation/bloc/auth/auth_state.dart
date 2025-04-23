part of 'auth_cubit.dart';


sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class AuthLoginLoading extends AuthState {}

final class AuthLoginSuccess extends AuthState {
  final Login response;
  const AuthLoginSuccess({required this.response});

  @override
  List<Object> get props => [response];
}

final class AuthLoginFailure extends AuthState {
  final String error;
  const AuthLoginFailure({required this.error});

  @override
  List<Object> get props => [error];
}

final class AuthVerifyOtpLoading extends AuthState {}

final class AuthVerifyOtpSuccess extends AuthState {
  final String response;
  const AuthVerifyOtpSuccess({required this.response});

  @override
  List<Object> get props => [response];
}

final class AuthVerifyOtpFailure extends AuthState {
  final String error;
  const AuthVerifyOtpFailure({required this.error});

  @override
  List<Object> get props => [error];
}

final class AuthResendOtpLoading extends AuthState {}

final class AuthResendOtpSuccess extends AuthState {
  final String response;
  const AuthResendOtpSuccess({required this.response});

  @override
  List<Object> get props => [response];
}

final class AuthResendOtpFailure extends AuthState {
  final String error;
  const AuthResendOtpFailure({required this.error});

  @override
  List<Object> get props => [error];
}

final class AuthForgotPasswordLoading extends AuthState {}

final class AuthForgotPasswordSuccess extends AuthState {
  final ForgotPassword response;
  const AuthForgotPasswordSuccess({required this.response});

  @override
  List<Object> get props => [response];
}

final class AuthForgotPasswordFailure extends AuthState {
  final String error;
  const AuthForgotPasswordFailure({required this.error});

  @override
  List<Object> get props => [error];
}

final class AuthChangePasswordLoading extends AuthState {}

final class AuthChangePasswordSuccess extends AuthState {
  final ForgotPassword response;
  const AuthChangePasswordSuccess({required this.response});

  @override
  List<Object> get props => [response];
}

final class AuthChangePasswordFailure extends AuthState {
  final String error;
  const AuthChangePasswordFailure({required this.error});

  @override
  List<Object> get props => [error];
}
