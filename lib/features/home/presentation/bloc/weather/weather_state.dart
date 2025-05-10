part of 'weather_cubit.dart';


sealed class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final List<Weather> weatherList;

  const WeatherLoaded(this.weatherList);

  @override
  List<Object> get props => [weatherList];

  @override
  String toString() => 'WeatherLoaded { Weather: $weatherList }';
}

class WeatherNotLoaded extends WeatherState {}

class WeatherFailure extends WeatherState {
  final String error;

  const WeatherFailure(this.error);

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'WeatherFailure { error: $error }';
}
