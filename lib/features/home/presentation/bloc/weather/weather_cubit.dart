
import 'package:equatable/equatable.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/api/api.dart';
import '../../../../../core/data/model/weather.dart';
import '../../../../../core/storage/istorage.dart';
import '../../../../../core/utils/global_variables.dart';
import '../../../repository/home_repository_contract.dart';
import '../api_request/api_request_bloc.dart';
import '../api_request/api_request_state.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final IHomeRepository repository;
  final LocalStorage databaseManager;
  WeatherCubit({required this.repository, required this.databaseManager})
    : super(WeatherLoading());

  int currentPulledCount = 0;

  loadWeather({String? url}) async {
    try {
      emit(WeatherLoading());
      final response =
          url != null && url.isNotEmpty
              ? await repository.getWeatherList(endpoint: url)
              : await repository.getWeatherList();

      final state =
          BlocProvider.of<ApiRequestBloc>(
            GlobalVariables.rootNavigatorKey.currentContext!,
          ).state;
            if (state is ApiRequestStateCompleted) {
        loadWeathersFromDb();
      } else {
        response.fold(
          (l) {
            GlobalVariables.rootNavigatorKey.currentContext!
                .read<ApiRequestBloc>()
                .add(ApiRequestCompleted());
            loadWeathersFromDb();
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
                    identifier: weatherListEndpoint,
                    progress: progressPercent,
                  ),
                );

            saveWeathersToDb(r.data ?? []);
            if (r.nextUrl != null && (r.nextUrl ?? "").isNotEmpty) {
              loadWeather(url: r.nextUrl);
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
      loadWeathersFromDb();
      debugPrint(e.toString());
    }
  }

    loadWeathersFromDb() async {
    try {
      final response = await repository.getWeather();
      emit(WeatherLoaded(response));
    } catch (e) {
      emit(WeatherNotLoaded());
    }
  }

  saveWeathersToDb(List<Weather> weatherList) async {
    try {
      await repository.saveWeather(weatherList);
      loadWeathersFromDb();
    } on Error catch (e) {
      debugPrint(e.toString());
    }
  }
}
