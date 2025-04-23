import 'dart:developer';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../../../../core/data/model/login.dart';
import '../../../repository/auth_repository_contract.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  late IAuthRepository repository;
  UserCubit({required this.repository})
      : super(UserLoading());

  Future<void> getUser() async {
    log('getting user');
    emit(UserLoading());
    try {
      final user = await repository.getUser();
      GetIt.I.registerSingleton<String>(
          instanceName: "accessToken",
          user.token ?? "",
          signalsReady: true);
      GetIt.I.registerSingleton<int>(
          instanceName: "userId",
          user.userId ?? 0,
          signalsReady: true);
      emit(UserLoaded(user));
    } catch (e) {
      emit(UserNotLoaded());
    }
  }
}
