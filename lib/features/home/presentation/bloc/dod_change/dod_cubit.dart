import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/data/model/dod_change.dart';
import '../../../../../core/api/api.dart';
import '../../../../../core/storage/istorage.dart';
import '../../../../../core/utils/global_variables.dart';
import '../../../repository/home_repository_contract.dart';
import '../api_request/api_request_bloc.dart';
import '../api_request/api_request_state.dart';

part 'dod_state.dart';

class DodCubit extends Cubit<DodState> {
  final IHomeRepository repository;
  final LocalStorage databaseManager;
  DodCubit({required this.databaseManager, required this.repository})
    : super(DodLoading());

  int currentPulledCount = 0;

  loadDod({String? url}) async {
    try {
      debugPrint("Loading DOD Changes from API...");
      emit(DodLoading());
      final response =
          url != null && url.isNotEmpty
              ? await repository.getDodChangeList(endpoint: url)
              : await repository.getDodChangeList();

      final state =
          BlocProvider.of<ApiRequestBloc>(
            GlobalVariables.rootNavigatorKey.currentContext!,
          ).state;
      if (state is ApiRequestStateCompleted) {
        loadDodsFromDb();
      } else {
        debugPrint("Processing DOD Changes response...");
        response.fold(
          (l) {
            GlobalVariables.rootNavigatorKey.currentContext!
                .read<ApiRequestBloc>()
                .add(ApiRequestCompleted());
            loadDodsFromDb();
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
                    identifier: dodChangeListEndpoint,
                    progress: progressPercent,
                  ),
                );

            saveDodsToDb(r.data ?? []);
            if (r.nextUrl != null && (r.nextUrl ?? "").isNotEmpty) {
              loadDod(url: r.nextUrl);
            } else {
              GlobalVariables.rootNavigatorKey.currentContext!
                  .read<ApiRequestBloc>()
                  .add(ApiRequestCompleted());
            }
          },
        );
      }
    } on Exception catch (e) {
      debugPrint("Error loading DOD Changes: ");
      GlobalVariables.rootNavigatorKey.currentContext!
          .read<ApiRequestBloc>()
          .add(ApiRequestCompleted());
      loadDodsFromDb();
      debugPrint(e.toString());
    }
  }

  loadDodsFromDb() async {
    try {
      final response = await repository.getDodChange();
      emit(DodLoaded(response));
    } catch (e) {
      emit(DodNotLoaded());
    }
  }

  saveDodsToDb(List<DodChange> dodList) async {
    try {
      await repository.saveDodChange(dodList);
      loadDodsFromDb();
    } on Error catch (e) {
      debugPrint(e.toString());
    }
  }
}
