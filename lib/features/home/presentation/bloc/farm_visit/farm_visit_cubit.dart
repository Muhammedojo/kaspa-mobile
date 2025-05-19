import 'package:equatable/equatable.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:kaspa/core/api/exceptions/contracts/failure.dart';
import '../../../../../core/api/api.dart';
import '../../../../../core/api/exceptions/api_exception.dart';
import '../../../../../core/data/model/farm_visit.dart';
import '../../../../../core/storage/istorage.dart';
import '../../../../../core/utils/global_variables.dart';
import '../../../repository/home_repository_contract.dart';
import '../api_request/api_request_bloc.dart';
import '../api_request/api_request_state.dart';

part 'farm_visit_state.dart';

class FarmVisitCubit extends Cubit<FarmVisitState> {
  final IHomeRepository repository;
  final LocalStorage databaseManager;
  FarmVisitCubit({required this.repository, required this.databaseManager})
    : super(FarmVisitLoading());

  int currentPulledCount = 0;

  loadFarmVisit({String? url}) async {
    try {
      emit(FarmVisitLoading());
      final response =
          url != null && url.isNotEmpty
              ? await repository.getFarmVisitList(endpoint: url)
              : await repository.getFarmVisitList();

      final state =
          BlocProvider.of<ApiRequestBloc>(
            GlobalVariables.rootNavigatorKey.currentContext!,
          ).state;
      if (state is ApiRequestStateCompleted) {
        loadFarmVisitsFromDb();
      } else {
        response.fold(
          (l) {
            GlobalVariables.rootNavigatorKey.currentContext!
                .read<ApiRequestBloc>()
                .add(ApiRequestCompleted());
            loadFarmVisitsFromDb();
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
                    identifier: farmVisitListEndpoint,
                    progress: progressPercent,
                  ),
                );

            saveFarmVisitsToDb(r.data ?? []);
            if (r.nextUrl != null && (r.nextUrl ?? "").isNotEmpty) {
              loadFarmVisit(url: r.nextUrl);
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
      loadFarmVisitsFromDb();
      debugPrint(e.toString());
    }
  }

  loadFarmVisitsFromDb() async {
    try {
      final response = await repository.getFarmVisit();
      emit(FarmVisitLoaded(response));
    } catch (e) {
      emit(FarmVisitNotLoaded());
    }
  }

  saveFarmVisitsToDb(List<FarmVisit> farmVisitList) async {
    try {
      await repository.saveFarmVisit(farmVisitList);
      loadFarmVisitsFromDb();
    } on Error catch (e) {
      debugPrint(e.toString());
    }
  }

  createFarmVisit(FarmVisit data) async {
    try {
      emit(FarmVisitLoading());
      final response = await repository.createFarmVisit(data);
      response.fold((l) => emit(FarmVisitFailure(l)), (r) async {
        if (r.data != null) {
          emit(CreateVisitSuccess(r.data!));

          GetIt.I.get<ApiRequestBloc>().add(
            ApiRequestTriggered(apiRequestList: [farmVisitListEndpoint]),
          );
        } else {
          emit(
            FarmVisitFailure(
              UnknownFailure(message: "Farm visit creation returned no data"),
            ),
          );
        }
      });
    } on Error catch (e) {
      emit(FarmVisitFailure(UnknownFailure(message: e.toString())));
    }
  }
}
