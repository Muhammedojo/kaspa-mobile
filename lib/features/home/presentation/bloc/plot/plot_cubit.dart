import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/api/api.dart';
import '../../../../../core/data/model/plot.dart';
import '../../../../../core/storage/istorage.dart';
import '../../../../../core/utils/global_variables.dart';
import '../../../repository/home_repository_contract.dart';
import '../api_request/api_request_bloc.dart';
import '../api_request/api_request_state.dart';

part 'plot_state.dart';

class PlotCubit extends Cubit<PlotState> {
  final IHomeRepository repository;
  final LocalStorage databaseManager;
  PlotCubit({required this.databaseManager, required this.repository})
    : super(PlotLoading());

  int currentPulledCount = 0;

  loadPlot({String? url}) async {
    try {
      emit(PlotLoading());
      final response =
          url != null && url.isNotEmpty
              ? await repository.getPlotList(endpoint: url)
              : await repository.getPlotList();

      final state =
          BlocProvider.of<ApiRequestBloc>(
            GlobalVariables.rootNavigatorKey.currentContext!,
          ).state;
      if (state is ApiRequestStateCompleted) {
        loadPlotsFromDb();
      } else {
        response.fold(
          (l) {
            GlobalVariables.rootNavigatorKey.currentContext!
                .read<ApiRequestBloc>()
                .add(ApiRequestCompleted());
            loadPlotsFromDb();
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
                    identifier: plotListEndpoint,
                    progress: progressPercent,
                  ),
                );

            savePlotsToDb(r.data ?? []);
            if (r.nextUrl != null && (r.nextUrl ?? "").isNotEmpty) {
              loadPlot(url: r.nextUrl);
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
      loadPlotsFromDb();
      debugPrint(e.toString());
    }
  }

  loadPlotsFromDb() async {
    try {
      final response = await repository.getPlot();
      emit(PlotLoaded(response));
    } catch (e) {
      emit(PlotNotLoaded());
    }
  }

  savePlotsToDb(List<Plot> plotList) async {
    try {
      await repository.savePlot(plotList);
      loadPlotsFromDb();
    } on Error catch (e) {
      debugPrint(e.toString());
    }
  }

  

}
