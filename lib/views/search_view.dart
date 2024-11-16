import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/views/home_view.dart';


class SearchView extends StatelessWidget {
  const SearchView({super.key});
  static const String routeName="/search";
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // foregroundColor: Colors.white,
        // backgroundColor: Colors.blue,
        title: const Text("Search City",style: TextStyle(color: Colors.white),),),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Center(
          heightFactor: 20/3,
          child: TextField(
            onSubmitted: (value){
              // print(value);
                BlocProvider.of<GetWeatherCubit>(context)
                      .getCurrentWeather(value);
                Navigator.of(context).pushNamed(HomeView.routeName);
            },
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 25,vertical: 25),
              suffixIcon: const Icon(Icons.search_rounded,),
                labelText: "Search",
                hintText: "Enter your city",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                ),
            ),
          ),
        ),
      )
    );
  }
}
