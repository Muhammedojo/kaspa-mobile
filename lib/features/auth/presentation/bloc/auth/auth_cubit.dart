import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import '../../../../../config/di/app_initializer.dart';
import '../../../../../core/data/model/forgot_password.dart';
import '../../../../../core/data/model/login.dart';
import '../../../../../core/storage/istorage.dart';
import '../../../repository/auth_repository_contract.dart';


part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final IAuthRepository repository;

  AuthCubit({required this.repository}) : super(AuthInitial());

  void login({required String username, required String password, bool? rememberMe = false}) async {
    try {
      emit(AuthLoginLoading());
      final response = await repository.login(username, password);
      response.fold((l) {
        emit(AuthLoginFailure(error: l.failureMessage()));
      }, (r) async {
        AppInitializer.instanceLocator.registerSingleton<String>(
            instanceName: "accessToken",
            r.data?.token ?? "",
            signalsReady: true);
        AppInitializer.instanceLocator.registerSingleton<int>(
            instanceName: "userId",
            r.data?.userId ?? 0,
            signalsReady: true);
        GetIt.I.get<LocalStorage>().saveLoggedInUser(r.data as Login);
        GetIt.I.get<LocalStorage>().setLoggedIn(true);
        await repository.openDb(r.data?.username ?? 'defaultUsername');
        await repository.setRememberMe(rememberMe!);
        await repository.setUsername(username);
        emit(AuthLoginSuccess(response: r.data as Login));
      });
    } on Error catch (e) {
      emit(AuthLoginFailure(error: e.toString()));
    }
  }
}
