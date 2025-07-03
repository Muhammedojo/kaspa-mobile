import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/storage/istorage.dart';
import '../../../../../core/data/model/insight.dart';
import '../../../repository/home_repository_contract.dart';

part 'crop_advisory_state.dart';

class CropAdvisoryCubit extends Cubit<CropAdvisoryState> {
  final IHomeRepository repository;
  final LocalStorage databaseManager;

  CropAdvisoryCubit({required this.databaseManager, required this.repository})
    : super(CropAdvisoryInitial());

  Future<void> generateAdvisory({
    required String cropName,
    required ActivityObject? lastActivity,
    required Insight weatherData,
  }) async {
    emit(CropAdvisoryLoading());
    try {
       final lastActivityData = {
        'title': lastActivity?.activity ?? 'N/A',
        'start_date': lastActivity?.startDate ?? 'N/A',
        'end_date': lastActivity?.endDate ?? 'N/A',
      };
        final weatherPayload = {
        'temperature': weatherData.weather.tempMean ?? 'N/A',
        'humidity': weatherData.weather.precipSum ?? 'N/A',
        'wind': weatherData.weather.windSpeedMax ?? 'N/A',
      };

     final payload = {
        'crop_name': cropName,
        'last_activity': lastActivityData,
        'weather_data': weatherPayload,
      };

      final advisoryResult = await repository.getAdvisory(payload);
      advisoryResult.fold(
        (failure) => emit(CropAdvisoryFailure(failure.failureMessage())),
        (advisory) => emit(CropAdvisoryLoaded(advisory)),
      );
    } catch (e) {
      emit(CropAdvisoryFailure(e.toString()));
    }
  }
}
