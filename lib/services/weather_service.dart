import 'dart:developer';

import '../models/weather_model.dart';
import 'package:dio/dio.dart';

class WeatherService{
  final String city;
  WeatherService(this.city);
  final String baseUrl="https://api.weatherapi.com/v1";
  final String apiKey="15160c6844a941b0831190436241710";
  Future<WeatherModel> getWeather() async{
    try{
      Response response = await Dio().get(
          "$baseUrl/forecast.json?key=$apiKey&q=$city&days=1&aqi=yes&alerts=no");
      Map<String, dynamic> jsonData = response.data;
      WeatherModel weatherModel = WeatherModel.fromJson(jsonData);
      return weatherModel;
    } on DioException catch(e){
      final String errMessage= e.response?.data["error"]["message"]??"oops,there is an error, try again later";
      throw Exception(errMessage);
    }catch(e){
      log(e.toString());
      throw Exception("there is an error, try again later");
    }
  }
}
