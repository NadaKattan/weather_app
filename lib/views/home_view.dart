import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/no_weather_body.dart';
import 'package:weather_app/views/search_view.dart';
import '../weather_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.blue,
        title: const Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            "Weather App",
            style: TextStyle(color: Colors.white),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(SearchView.routeName);
              },
              icon: const Icon(Icons.search_rounded),
              color: Colors.grey.shade100),
          const SizedBox(width: 16),
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherInitialState) {
            return const NoWeatherBody();
          } else if (state is WeatherLoadingState) {
            return const Center(child: CircularProgressIndicator(),);
          }
          else if (state is WeatherSuccessState) {
            return const WeatherBody();
          } else {
            return const Center(child: Text("oops, there is an error"));
          }
        },
      ),
    );
  }
}
