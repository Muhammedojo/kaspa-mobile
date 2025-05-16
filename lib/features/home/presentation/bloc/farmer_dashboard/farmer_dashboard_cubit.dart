import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/api/api.dart';
import '../../../../../core/data/model/dashboard_data.dart';
import '../../../../../core/storage/istorage.dart';
import '../../../../../core/utils/global_variables.dart';
import '../../../repository/home_repository_contract.dart';
import '../api_request/api_request_bloc.dart';
import '../api_request/api_request_state.dart';

part 'farmer_dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  final IHomeRepository repository;
  final LocalStorage databaseManager;
  DashboardCubit({required this.repository, required this.databaseManager})
    : super(DashboardLoading());

  int currentPulledCount = 0;

  loadDashboard({String? url}) async {
    try {
      emit(DashboardLoading());
      final response = await repository.getDashboardList();

      final state =
          BlocProvider.of<ApiRequestBloc>(
            GlobalVariables.rootNavigatorKey.currentContext!,
          ).state;
      if (state is ApiRequestStateCompleted) {
        loadDashboardsFromDb();
      } else {
        response.fold(
          (l) {
            GlobalVariables.rootNavigatorKey.currentContext!
                .read<ApiRequestBloc>()
                .add(ApiRequestCompleted());
            loadDashboardsFromDb();
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
                    identifier: dashboardEndpoint,
                    progress: progressPercent,
                  ),
                );

            saveDashboardsToDb(r.data ?? []);
            if (r.nextUrl != null && (r.nextUrl ?? "").isNotEmpty) {
              loadDashboard(url: r.nextUrl);
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
      loadDashboardsFromDb();
      debugPrint(e.toString());
    }
  }

  loadDashboardsFromDb() async {
    try {
      final response = await repository.getDashboard();
      emit(DashboardLoaded(response));
    } catch (e) {
      emit(DashboardNotLoaded());
    }
  }

  saveDashboardsToDb(List<DashboardData> dashboard) async {
    try {
      await repository.saveDashboard(dashboard);
      loadDashboardsFromDb();
    } on Error catch (e) {
      debugPrint(e.toString());
    }
  }
}
