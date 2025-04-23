import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/api/exceptions/api_ecxeption.dart';
import '../../../repository/auth_repository_contract.dart';
import 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final IAuthRepository repository;

  ResetPasswordCubit({required this.repository})
    : super(ResetPasswordInitial());

  changePassword(String token, String otp, String password) async {
    try {
      emit(ResetPasswordLoading());
      var response = await repository.changePassword(token, otp, password);
      response.fold(
        (failure) {
          emit(ResetPasswordFailure(error: failure));
        },
        (disbursementResponse) async {
          emit(ResetPasswordSuccess(disbursementResponse.data!));
        },
      );
    } on Error catch (e) {
      emit(ResetPasswordFailure(error: ValidationFailure(e.toString())));
    }
  }
}
