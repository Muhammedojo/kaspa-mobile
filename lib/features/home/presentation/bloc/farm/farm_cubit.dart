import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../../../../core/api/api.dart';
import '../../../../../core/data/model/farm.dart';
import '../../../../../core/storage/istorage.dart';
import '../../../repository/home_repository_contract.dart';
import '../api_request/api_request_bloc.dart';

part 'farm_state.dart';

class FarmCubit extends Cubit<FarmState> {
  final IHomeRepository repository;
  final LocalStorage databaseManager;
  FarmCubit({required this.databaseManager, required this.repository})
    : super(FarmLoading());

  int currentPulledCount = 0;

  createFarm(Farm farm, {String? folioId}) async {

    try {

      emit(FarmLoading());
      
        final response = await repository.createFarm(farm, folioId: folioId);

      response.fold((l) => emit(FarmFailure(error: l.failureMessage())), (
        r,
      ) async {
        if (r.data != null) {
          emit(FarmSuccess(r.data!));

          GetIt.I.get<ApiRequestBloc>().add(
            ApiRequestTriggered(apiRequestList: [farmersListEndpoint]),
          );
        } else {
          emit(FarmFailure(error: 'Something went wrong.'));
        }
      });
    } on Exception catch (e) {
      emit(FarmFailure(error: e.toString()));
    }
  }
}
