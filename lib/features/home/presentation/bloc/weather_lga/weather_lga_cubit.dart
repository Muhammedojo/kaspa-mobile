
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

part 'weather_lga_state.dart';

class LgaWeatherCubit extends Cubit<LgaWeatherState> {
  final IHomeRepository repository;
  final LocalStorage databaseManager;
  LgaWeatherCubit({required this.repository, required this.databaseManager})
    : super(LgaWeatherLoading());

  int currentPulledCount = 0;

  loadLgaWeather({String? url}) async {
    try {
      emit(LgaWeatherLoading());
      final response =
          url != null && url.isNotEmpty
              ? await repository.getLGAWeatherList(endpoint: url)
              : await repository.getLGAWeatherList();

      final state =
          BlocProvider.of<ApiRequestBloc>(
            GlobalVariables.rootNavigatorKey.currentContext!,
          ).state;
            if (state is ApiRequestStateCompleted) {
        loadLgaWeathersFromDb();
      } else {
        response.fold(
          (l) {
            GlobalVariables.rootNavigatorKey.currentContext!
                .read<ApiRequestBloc>()
                .add(ApiRequestCompleted());
            loadLgaWeathersFromDb();
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
                    identifier: lgaWeatherListEndpoint,
                    progress: progressPercent,
                  ),
                );

            saveLgaWeathersToDb(r.data ?? []);
            if (r.nextUrl != null && (r.nextUrl ?? "").isNotEmpty) {
              loadLgaWeather(url: r.nextUrl);
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
      loadLgaWeathersFromDb();
      debugPrint('LgaWeather: ${e.toString()}');
    }
  }

    loadLgaWeathersFromDb() async {
    try {
      final response = await repository.getLgaWeather();
      emit(LgaWeatherLoaded(response));
    } catch (e) {
      emit(LgaWeatherNotLoaded());
    }
  }

  saveLgaWeathersToDb(List<Weather> weatherList) async {
    try {
      await repository.saveLgaWeather(weatherList);
      loadLgaWeathersFromDb();
    } on Error catch (e) {
      debugPrint(e.toString());
    }
  }
}
