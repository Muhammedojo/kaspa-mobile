import 'package:equatable/equatable.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../../../../core/api/api.dart';
import '../../../../../core/data/model/incident_report.dart';
import '../../../../../core/storage/istorage.dart';
import '../../../../../core/utils/global_variables.dart';
import '../../../repository/home_repository_contract.dart';
import '../api_request/api_request_bloc.dart';
import '../api_request/api_request_state.dart';

part 'incident_report_state.dart';

class IncidentCubit extends Cubit<IncidentState> {
  final IHomeRepository repository;
  final LocalStorage databaseManager;
  IncidentCubit({required this.repository, required this.databaseManager})
    : super(IncidentLoading());

  int currentPulledCount = 0;

  loadIncident({String? url}) async {
    try {
      emit(IncidentLoading());
      final response =
          url != null && url.isNotEmpty
              ? await repository.getIncidentList(endpoint: url)
              : await repository.getIncidentList();

      final state =
          BlocProvider.of<ApiRequestBloc>(
            GlobalVariables.rootNavigatorKey.currentContext!,
          ).state;
      if (state is ApiRequestStateCompleted) {
        loadIncidentsFromDb();
      } else {
        response.fold(
          (l) {
            GlobalVariables.rootNavigatorKey.currentContext!
                .read<ApiRequestBloc>()
                .add(ApiRequestCompleted());
            loadIncidentsFromDb();
          },
          (r) async {
            int totalCount = r.itemCount ?? 0;
            currentPulledCount += r.data?.length ?? 0;
            currentPulledCount = currentPulledCount.clamp(0, totalCount);
            double progressPercent =
                (currentPulledCount.toDouble() /
                    double.parse((r.itemCount ?? 0).toString())) *
                100.0;

            GlobalVariables.rootNavigatorKey.currentContext!
                .read<ApiRequestBloc>()
                .add(
                  ApiRequestLoading(
                    identifier: incidentReportListEndpoint,
                    progress: progressPercent,
                  ),
                );

            saveIncidentsToDb(r.data ?? []);
            if (r.nextUrl != null && (r.nextUrl ?? "").isNotEmpty) {
              loadIncident(url: r.nextUrl);
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
      loadIncidentsFromDb();
      debugPrint(e.toString());
    }
  }

  loadIncidentsFromDb() async {
    try {
      final response = await repository.getIncident();
      emit(IncidentLoaded(response));
    } catch (e) {
      emit(IncidentNotLoaded());
    }
  }

  logIncidentReport(IncidentReport data) async {
    try {
      debugPrint('Hey ${data.toJson()}');
      emit(IncidentLoading());
      final response = await repository.logIncident(data);
      response.fold((l) => emit(IncidentFailure(error: l.failureMessage())), (
        r,
      ) async {
        if (r.data != null) {
          emit(ReportIncidentSuccess(r.data!));

          GetIt.I.get<ApiRequestBloc>().add(
            ApiRequestTriggered(apiRequestList: [incidentReportListEndpoint]),
          );
        } else {
          emit(
            IncidentFailure(
              error: 'Something went wrong. Please try again later.',
            ),
          );
        }
      });
    } on Error catch (e) {
      emit(IncidentFailure(error: e.toString()));
    }
  }

  saveIncidentsToDb(List<IncidentReport> incidentList) async {
    try {
      await repository.saveIncident(incidentList);
      loadIncidentsFromDb();
    } on Error catch (e) {
      debugPrint(e.toString());
    }
  }
}
