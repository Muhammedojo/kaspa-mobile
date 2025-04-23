import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/api/exceptions/api_ecxeption.dart';
import '../../../repository/auth_repository_contract.dart';
import 'forgot_password_state.dart';


class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  final IAuthRepository repository;

  ForgotPasswordCubit({required this.repository}) : super(ForgotPasswordInitial());

  forgotPassword(String email) async{
    try{
      emit(ForgotPasswordLoading());
      var response = await repository.forgotPassword(email);
      response.fold((failure) {
        emit(ForgotPasswordFailure(error: failure));
      }, (disbursementResponse) async {
        emit(ForgotPasswordSuccess(disbursementResponse.data!));
      });
    }on Error catch(e){
      emit(ForgotPasswordFailure(error: ValidationFailure(e.toString())));
    }
  }
}