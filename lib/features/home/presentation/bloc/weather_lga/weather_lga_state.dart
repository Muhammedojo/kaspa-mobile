part of 'weather_lga_cubit.dart';


sealed class LgaWeatherState extends Equatable {
  const LgaWeatherState();

  @override
  List<Object> get props => [];
}

class LgaWeatherLoading extends LgaWeatherState {}

class LgaWeatherLoaded extends LgaWeatherState {
  final List<Weather> weatherList;

  const LgaWeatherLoaded(this.weatherList);

  @override
  List<Object> get props => [weatherList];

  @override
  String toString() => 'LgaWeatherLoaded { LgaWeather: $weatherList }';
}

class LgaWeatherNotLoaded extends LgaWeatherState {}

class LgaWeatherFailure extends LgaWeatherState {
  final String error;

  const LgaWeatherFailure(this.error);

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'LgaWeatherFailure { error: $error }';
}
