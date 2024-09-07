import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubits/get_weather_cubit/get_weather_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          //elevation: 10,
          automaticallyImplyLeading: false,
          title: const Center(
            child: Text(
              'Weather App',
              style: TextStyle(
                color: Color(0xff6B63FF),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        backgroundColor: const Color(0xffFFFFFF),
        body: ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      top: 150,
                    ),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/search_background.png',
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    child: TextField(
                      style: const TextStyle(
                        color: Color(0xff6B63FF),
                        fontSize: 22,
                      ),
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 25,
                        ),
                        prefixIcon: Icon(
                          Icons.search_outlined,
                        ),
                        prefixIconColor: Color(0xff6B63FF),
                        label: Text(
                          'Search',
                          style: TextStyle(
                            color: Color(0xff6B63FF),
                            fontSize: 20,
                          ),
                        ),
                        hintText: 'Enter Your City',
                        hintStyle: TextStyle(
                          color: Color(0xff6B63FF),
                          fontSize: 18,
                        ),
                        border: OutlineInputBorder(),
                      ),
                      onSubmitted: (value) async {
                        var getWeatherCubit =
                            BlocProvider.of<GetWeatherCubit>(context);
                        getWeatherCubit.getWeather(citName: value);
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ],
              );
            }));
  }
}
