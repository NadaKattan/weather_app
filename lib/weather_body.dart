import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';


class WeatherBody extends StatelessWidget {
  const WeatherBody({super.key});
  @override
  Widget build(BuildContext context) {
    var weatherModel = BlocProvider.of<GetWeatherCubit>(context).weatherModel;
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Colors.blue.withOpacity(0.8),
        Colors.blue.withOpacity(0.5),
        Colors.white
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            weatherModel.city,
            style:const TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
          ),
          Text(
              "updated at ${weatherModel.date.hour}:${weatherModel.date.minute}"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.network(
                "https:${weatherModel.image}",
              ),
              // SizedBox(width: 50,),
              Text(
                "${weatherModel.temp}",
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              // SizedBox(width: 50,),
              Column(
                children: [
                  Text("maxTemp:${weatherModel.maxTemp}"),
                  Text("minTemp:${weatherModel.minTemp}"),
                ],
              )
            ],
          ),
          Text(
            weatherModel.weatherCondition,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
        ],
      ),
    );
  }
}
