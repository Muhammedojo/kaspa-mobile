import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/api/api.dart';
import '../../../../../core/api/exceptions/contracts/failure.dart';
import '../../../../../core/data/model/crop_calendar.dart';
import '../../../../../core/storage/istorage.dart';
import '../../../../../core/utils/global_variables.dart';
import '../../../repository/home_repository_contract.dart';
import '../api_request/api_request_bloc.dart';
import '../api_request/api_request_state.dart';

part 'crop_calendar_state.dart';

class CropCalendarCubit extends Cubit<CropCalendarState> {
  final IHomeRepository repository;
  final LocalStorage databaseManager;
  CropCalendarCubit({required this.databaseManager, required this.repository})
    : super(CropCalendarLoading());

  int currentPulledCount = 0;

  loadCropCalendar({String? url}) async {
    try {
      emit(CropCalendarLoading());
      final response =
          url != null && url.isNotEmpty
              ? await repository.getCropCalendarList(endpoint: url)
              : await repository.getCropCalendarList();

      final state =
          BlocProvider.of<ApiRequestBloc>(
            GlobalVariables.rootNavigatorKey.currentContext!,
          ).state;
      if (state is ApiRequestStateCompleted) {
        loadCropCalendarsFromDb();
      } else {
        response.fold(
          (l) {
            GlobalVariables.rootNavigatorKey.currentContext!
                .read<ApiRequestBloc>()
                .add(ApiRequestCompleted());
            loadCropCalendarsFromDb();
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
                    identifier: cropListEndpoint,
                    progress: progressPercent,
                  ),
                );

            saveCropCalendarsToDb(r.data ?? []);
            if (r.nextUrl != null && (r.nextUrl ?? "").isNotEmpty) {
              loadCropCalendar(url: r.nextUrl);
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
      loadCropCalendarsFromDb();
      debugPrint(e.toString());
    }
  }

  loadCropCalendarsFromDb() async {
    try {
      final response = await repository.getCropCalendar();
      emit(CropCalendarLoaded(response));
    } catch (e) {
      emit(CropCalendarNotLoaded());
    }
  }

  saveCropCalendarsToDb(List<CropCalendar> cropCalendarList) async {
    try {
      await repository.saveCropCalendar(cropCalendarList);
      loadCropCalendarsFromDb();
    } on Error catch (e) {
      debugPrint(e.toString());
    }
  }

}
