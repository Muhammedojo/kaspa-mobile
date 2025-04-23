import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/api/api.dart';
import '../../../../../core/data/model/lga.dart';
import '../../../../../core/storage/istorage.dart';
import '../../../../../core/utils/global_variables.dart';
import '../../../repository/home_repository_contract.dart';
import '../api_request/api_request_bloc.dart';
import '../api_request/api_request_state.dart';

part 'lga_state.dart';

class LgaCubit extends Cubit<LgaState> {
  final IHomeRepository repository;
  final LocalStorage databaseManager;
  LgaCubit({required this.databaseManager, required this.repository})
    : super(LgaLoading());

  int currentPulledCount = 0;

  loadLga({String? url}) async {
    try {
      emit(LgaLoading());
      final response =
          url != null && url.isNotEmpty
              ? await repository.getLgaList(endpoint: url)
              : await repository.getLgaList();

      final state =
          BlocProvider.of<ApiRequestBloc>(
            GlobalVariables.rootNavigatorKey.currentContext!,
          ).state;
      if (state is ApiRequestStateCompleted) {
        loadLgasFromDb();
      } else {
        response.fold(
          (l) {
            GlobalVariables.rootNavigatorKey.currentContext!
                .read<ApiRequestBloc>()
                .add(ApiRequestCompleted());
            loadLgasFromDb();
          },
          (r) async {
            currentPulledCount += r.data?.length ?? 0;
            double progressPercent =
                (currentPulledCount.toDouble() /
                    double.parse((r.itemCount ?? 0).toString())) *
                100.0;

            GlobalVariables.rootNavigatorKey.currentContext!
                .read<ApiRequestBloc>()
                .add(
                  ApiRequestLoading(
                    identifier: lgaListEndpoint,
                    progress: progressPercent,
                  ),
                );

            saveLgasToDb(r.data ?? []);
            if (r.nextUrl != null && (r.nextUrl ?? "").isNotEmpty) {
              loadLga(url: r.nextUrl);
            } else {
              GlobalVariables.rootNavigatorKey.currentContext!
                  .read<ApiRequestBloc>()
                  .add(ApiRequestCompleted());
            }
          },
        );
      }
    } on Exception catch (e) {
      GlobalVariables.rootNavigatorKey.currentContext!
          .read<ApiRequestBloc>()
          .add(ApiRequestCompleted());
      loadLgasFromDb();
      debugPrint(e.toString());
    }
  }

  loadLgasFromDb() async {
    try {
      final response = await repository.getLga();
      emit(LgaLoaded(response));
    } catch (e) {
      emit(LgaNotLoaded());
    }
  }

  saveLgasToDb(List<Lga> lgaList) async {
    try {
      await repository.saveLga(lgaList);
      loadLgasFromDb();
    } on Error catch (e) {
      debugPrint(e.toString());
    }
  }
}
