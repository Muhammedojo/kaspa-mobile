import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/api/api.dart';
import '../../../../../core/data/model/crop_activities.dart';
import '../../../../../core/storage/istorage.dart';
import '../../../../../core/utils/global_variables.dart';
import '../../../repository/home_repository_contract.dart';
import '../api_request/api_request_bloc.dart';
import '../api_request/api_request_state.dart';

part 'farm_crop_activity_state.dart';

class FarmCropActivityCubit extends Cubit<FarmCropActivityState> {
  final IHomeRepository repository;
  final LocalStorage databaseManager;
  FarmCropActivityCubit({
    required this.databaseManager,
    required this.repository,
  }) : super(FarmCropActivityLoading());

  int currentPulledCount = 0;

  loadFarmCropActivity({String? url}) async {
    try {
      emit(FarmCropActivityLoading());
      final response =
          url != null && url.isNotEmpty
              ? await repository.getFarmCropActivityList(url)
              : await repository.getFarmCropActivityList(null);

      final state =
          BlocProvider.of<ApiRequestBloc>(
            GlobalVariables.rootNavigatorKey.currentContext!,
          ).state;
      if (state is ApiRequestStateCompleted) {
        loadFarmCropActivitiesFromDb();
      } else {
        response.fold(
          (l) {
            GlobalVariables.rootNavigatorKey.currentContext!
                .read<ApiRequestBloc>()
                .add(ApiRequestCompleted());
            loadFarmCropActivitiesFromDb();
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
                    identifier: farmCropActivityListEndpoint,
                    progress: progressPercent,
                  ),
                );

            saveFarmCropActivitiesToDb(r.data ?? []);
            if (r.nextUrl != null && (r.nextUrl ?? "").isNotEmpty) {
              loadFarmCropActivity(url: r.nextUrl);
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
      loadFarmCropActivitiesFromDb();
      debugPrint(e.toString());
    }
  }

  loadFarmCropActivitiesFromDb() async {
    try {
      final response = await repository.getFarmCropActivity();
      emit(FarmCropActivityLoaded(response));
    } catch (e) {
      emit(FarmCropActivityNotLoaded());
    }
  }

  Future<void> getFarmCropActivities(int farmCropId) async {
    try {
      emit(FarmCropActivityLoading());
      final response = await repository.getFarmCropActivityList(null,
        farmCropId: farmCropId,
      );
      response.fold(
        (l) => emit(FarmCropActivityFailure(error: l.failureMessage())),
        (r) => emit(FarmCropActivityLoaded(r.data ?? [])),
      );
    } catch (e) {
      emit(FarmCropActivityFailure(error: e.toString()));
    }
  }

  saveFarmCropActivitiesToDb(List<CropActivities> farmCropActivityList) async {
    try {
      await repository.saveFarmCropActivity(farmCropActivityList);
      loadFarmCropActivitiesFromDb();
    } on Error catch (e) {
      debugPrint(e.toString());
    }
  }
}
