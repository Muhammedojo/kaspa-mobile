import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/api/exceptions/api_exception.dart';
import '../../../../../core/data/model/forgot_password.dart';
import '../../../repository/auth_repository_contract.dart';
import 'forgot_password_state.dart';


class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  final IAuthRepository repository;

  ForgotPasswordCubit({required this.repository}) : super(ForgotPasswordInitial());

  forgotPassword(String email) async{
     emit(ForgotPasswordLoading());
    try{
     
      var response = await repository.forgotPassword(email);
      response.fold((failure) {
        emit(ForgotPasswordFailure(error: failure));
      }, (response) async {
          final Map<String, dynamic> responseData = response.data!.toJson();
        final ForgotPassword forgotPasswordModel = ForgotPassword.fromJson(responseData); 
        emit(ForgotPasswordSuccess(response: responseData, forgotPassword: forgotPasswordModel));
     
       
      });
    }on Error catch(e){
      emit(ForgotPasswordFailure(error: ValidationFailure(e.toString())));
    }
  }
}