import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../../core/data/model/forgot_password.dart';
import '../../../../../core/data/model/login.dart';
import '../../../repository/auth_repository_contract.dart';


part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final IAuthRepository? repository;

  AuthCubit({ this.repository}) : super(AuthInitial());
}
