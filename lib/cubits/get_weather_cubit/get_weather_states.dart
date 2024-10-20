import 'package:weather_app/models/weather_model.dart';

class WeatherState {}

class WeatherInitialState extends WeatherState {}

class WeatherSuccessState extends WeatherState {
  WeatherModel weatherModel;
  WeatherSuccessState(this.weatherModel);
}

class WeatherFailureState extends WeatherState {}
