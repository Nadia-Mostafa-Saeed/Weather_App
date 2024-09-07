import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weatherapp/views/search_view.dart';

class WeatherInfo extends StatelessWidget {
  const WeatherInfo({super.key});

  @override
  Widget build(BuildContext context) {
    var weatherModel = BlocProvider.of<GetWeatherCubit>(context).weatherModel;
    weatherCondition = weatherModel.weatherCondition;
    return Scaffold(
      backgroundColor: const Color(0xff6B5DCD),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                bottom: 40,
                top: 40,
              ),
              child: Row(
                children: [
                  const Text(
                    'Today\'s Report',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    width: 140,
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return const SearchView();
                      }));
                    },
                    icon: const Icon(
                      Icons.search_outlined,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Center(
                child: Column(
              children: [
                Text(
                  weatherModel.cityName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Image.asset(
                  getImagePath(),
                  scale: 3,
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  '${weatherModel.temp.round()}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 60,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  weatherModel.weatherCondition,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Image.asset(
                            'assets/wind.png',
                            scale: 7,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            '${weatherModel.wind.round()} km/h',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Wind',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      Column(
                        children: [
                          Image.asset(
                            'assets/humidity.png',
                            scale: 7,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            '${weatherModel.humidity} %',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Humidity',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      Column(
                        children: [
                          Image.asset(
                            'assets/reainchance.png',
                            scale: 7,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            '${weatherModel.chanceOfRain} km/h',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Chance Of Rain',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )),
            // color: Color(0xff8A81C5),
          ],
        ),
      ),
    );
  }
}

late String weatherCondition;

String getImagePath() {
  switch (weatherCondition) {
    case "Sunny":
      return 'assets/clear.png';

    case "Patchy rain nearby":
    case "Cloudy":
    case "Overcast":
    case "Mist":
    case "Fog":
    case "Partly Cloudy":
    case "Freezing fog":
      return 'assets/cloudy.png';

    case "Patchy rain possible":
    case "Patchy light rain":
    case "Light rain":
    case "Moderate rain at times":
    case "Moderate rain":
    case "Heavy rain at times":
    case "Heavy rain":
    case "Light freezing rain":
    case "Moderate or heavy freezing rain":
    case "Light rain shower":
    case "Moderate or heavy rain shower":
    case "Torrential rain shower":
      return 'assets/rain.png';

    case "Patchy snow possible":
    case "Blowing snow":
    case "Blizzard":
    case "Patchy light snow":
    case "Light snow":
    case "Patchy moderate snow":
    case "Moderate snow":
    case "Patchy heavy snow":
    case "Heavy snow":
    case "Light snow showers":
    case "Moderate or heavy snow showers":
      return 'assets/snow.png';

    case "Thundery outbreaks possible":
    case "Patchy light rain with thunder":
    case "Moderate or heavy rain with thunder":
    case "Patchy light snow with thunder":
    case "Moderate or heavy snow with thunder":
      return 'assets/thunderstorm.png';

    default:
      return 'assets/clear.png';
  }
}
