import 'package:weather_app/models/weather_model.dart';

class WeatherState {}
class WeatherLoadingState extends WeatherState {}
class WeatherInitialState extends WeatherState {}

class WeatherSuccessState extends WeatherState {
}

class WeatherFailureState extends WeatherState {}
