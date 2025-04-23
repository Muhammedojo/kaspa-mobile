import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/api/api.dart';
import '../../../../../core/data/model/ward.dart';
import '../../../../../core/storage/istorage.dart';
import '../../../../../core/utils/global_variables.dart';
import '../../../repository/home_repository_contract.dart';
import '../api_request/api_request_bloc.dart';
import '../api_request/api_request_state.dart';

part 'ward_state.dart';

class WardCubit extends Cubit<WardState> {
  final IHomeRepository repository;
  final LocalStorage databaseManager;
  WardCubit({required this.databaseManager, required this.repository})
    : super(WardLoading());

  int currentPulledCount = 0;

  loadWard({String? url}) async {
    try {
      emit(WardLoading());
      final response =
          url != null && url.isNotEmpty
              ? await repository.getWardList(endpoint: url)
              : await repository.getWardList();

      final state =
          BlocProvider.of<ApiRequestBloc>(
            GlobalVariables.rootNavigatorKey.currentContext!,
          ).state;
      if (state is ApiRequestStateCompleted) {
        loadWardsFromDb();
      } else {
        response.fold(
          (l) {
            GlobalVariables.rootNavigatorKey.currentContext!
                .read<ApiRequestBloc>()
                .add(ApiRequestCompleted());
            loadWardsFromDb();
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
                    identifier: wardListEndpoint,
                    progress: progressPercent,
                  ),
                );

            saveWardsToDb(r.data ?? []);
            if (r.nextUrl != null && (r.nextUrl ?? "").isNotEmpty) {
              loadWard(url: r.nextUrl);
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
      loadWardsFromDb();
      debugPrint(e.toString());
    }
  }

  loadWardsFromDb() async {
    try {
      final response = await repository.getWard();
      emit(WardLoaded(response));
    } catch (e) {
      emit(WardNotLoaded());
    }
  }

  saveWardsToDb(List<Ward> wardList) async {
    try {
      await repository.saveWard(wardList);
      loadWardsFromDb();
    } on Error catch (e) {
      debugPrint(e.toString());
    }
  }
}
