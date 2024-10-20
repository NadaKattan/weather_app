import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class GetWeatherCubit extends Cubit <WeatherState>{
  GetWeatherCubit() : super(WeatherInitialState());
    late WeatherModel weatherModel;
    getCurrentWeather(String cityName) async{
    try{
      weatherModel = await WeatherService(cityName).getWeather();
      emit(WeatherSuccessState(weatherModel));
    }catch(e){
      emit(WeatherFailureState());
    }
 }
}
