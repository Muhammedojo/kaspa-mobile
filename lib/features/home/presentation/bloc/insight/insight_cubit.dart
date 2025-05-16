import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/api/api.dart';
import '../../../../../core/data/model/insight.dart';
import '../../../../../core/storage/istorage.dart';
import '../../../../../core/utils/global_variables.dart';
import '../../../repository/home_repository_contract.dart';
import '../api_request/api_request_bloc.dart';
import '../api_request/api_request_state.dart';

part 'insight_state.dart';

class InsightCubit extends Cubit<InsightState> {
  final IHomeRepository repository;
  final LocalStorage databaseManager;
  InsightCubit({required this.repository, required this.databaseManager})
    : super(InsightLoading());

  int currentPulledCount = 0;

  loadInsight({String? url}) async {
    try {
      emit(InsightLoading());
      final response = await repository.getInsightList();

      final state =
          BlocProvider.of<ApiRequestBloc>(
            GlobalVariables.rootNavigatorKey.currentContext!,
          ).state;
      if (state is ApiRequestStateCompleted) {
        loadInsightsFromDb();
      } else {
        response.fold(
          (l) {
            GlobalVariables.rootNavigatorKey.currentContext!
                .read<ApiRequestBloc>()
                .add(ApiRequestCompleted());
            loadInsightsFromDb();
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

            saveInsightsToDb(r.data ?? []);
            if (r.nextUrl != null && (r.nextUrl ?? "").isNotEmpty) {
              loadInsight(url: r.nextUrl);
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
      loadInsightsFromDb();
      debugPrint(e.toString());
    }
  }

  loadInsightsFromDb() async {
    try {
      final response = await repository.getInsight();
      emit(InsightLoaded(response));
    } catch (e) {
      emit(InsightNotLoaded());
    }
  }

  saveInsightsToDb(List<Insight> insight) async {
    try {
      await repository.saveInsight(insight);
      loadInsightsFromDb();
    } on Error catch (e) {
      debugPrint(e.toString());
    }
  }
}
