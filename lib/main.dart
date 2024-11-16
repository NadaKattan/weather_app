import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/views/home_view.dart';
import 'package:weather_app/views/search_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<GetWeatherCubit>(
      create: (context) => GetWeatherCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Weather App',
        theme:ThemeData.dark(
            // colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber,),
          // useMaterial3: true,
        ),
        routes: {
          HomeView.routeName: (_) => const HomeView(),
          SearchView.routeName: (_) => const SearchView(),
        },
        initialRoute: HomeView.routeName,
        // home: HomeView(),
      ),
    );
  }
}
getThemeColor(){

}
