import 'package:equatable/equatable.dart';
import '../../../../../core/api/exceptions/contracts/failure.dart';
import '../../../../../core/data/model/forgot_password.dart';

abstract class ForgotPasswordState extends Equatable {
  const ForgotPasswordState();

  @override
  List<Object> get props => [];
}

class ForgotPasswordInitial extends ForgotPasswordState {}
class ForgotPasswordLoading extends ForgotPasswordState {}

class ForgotPasswordSuccess extends ForgotPasswordState {
  final Map<String, dynamic> response;
  final ForgotPassword forgotPassword;

  const ForgotPasswordSuccess({required this.response, required this.forgotPassword});

  @override
  List<Object> get props => [response,forgotPassword];

  @override
  String toString() => 'ForgotPasswordSuccess { forgotPassword: $forgotPassword }';
}

class ForgotPasswordFailure extends ForgotPasswordState {
  final Failure error;

  const ForgotPasswordFailure({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'ForgotPasswordFailure { error: $error }';
}