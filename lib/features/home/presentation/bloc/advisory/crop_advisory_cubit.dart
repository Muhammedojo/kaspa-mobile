
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/data/model/insight.dart';
import '../../../repository/home_repository_contract.dart';


part 'crop_advisory_state.dart';

class CropAdvisoryCubit extends Cubit<CropAdvisoryState> {
  final IHomeRepository repository ;

  

  CropAdvisoryCubit({required this.repository}) : super(CropAdvisoryInitial());

  Future<void> generateAdvisory({
    required String cropName,
    required ActivityObject? lastActivity,
    required Insight? weatherData,
  }) async {
    emit(CropAdvisoryLoading());
    try {
      // For a robust solution, ensure your ActivityObject and Insight models
      // have a toJson() method, likely by using the json_serializable package.
      final lastActivityData = {
        'title': lastActivity?.activity ?? 'N/A',
        'start_date': lastActivity?.startDate ?? 'N/A',
        'end_date': lastActivity?.endDate ?? 'N/A',
      };

      // This assumes the Insight model has relevant fields.
      // A real implementation would use something like: final weatherPayload = weatherData.toJson();
      final weatherPayload = {
        'temperature': weatherData?.weather.tempMean ?? 'N/A',
        'humidity': weatherData?.weather.precipSum ?? 'N/A',
        'wind':weatherData?.weather.windSpeedMax ?? 'N/A',
        
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
    }
    catch (e) {
      emit(CropAdvisoryFailure(e.toString()));
    }
  }
}
