import 'package:equatable/equatable.dart';
import '../../../../../core/api/exceptions/contracts/failure.dart';
import '../../../../../core/data/model/forgot_password.dart';

abstract class ResetPasswordState extends Equatable {
  const ResetPasswordState();

  @override
  List<Object> get props => [];
}

class ResetPasswordInitial extends ResetPasswordState {}
class ResetPasswordLoading extends ResetPasswordState {}

class ResetPasswordSuccess extends ResetPasswordState {
  final ForgotPassword forgotPassword;

  const ResetPasswordSuccess(this.forgotPassword);

  @override
  List<Object> get props => [forgotPassword];

  @override
  String toString() => 'ResetPasswordSuccess { forgotPassword: $forgotPassword }';
}

class ResetPasswordFailure extends ResetPasswordState {
  final Failure error;

  const ResetPasswordFailure({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'ResetPasswordFailure { error: $error }';
}