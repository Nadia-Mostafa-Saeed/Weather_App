class WeatherModel {
  final String cityName;
  final double temp;
  final double wind;
  final int humidity;
  final int chanceOfRain;
  final String weatherCondition;

  WeatherModel({
    required this.chanceOfRain,
    required this.cityName,
    required this.humidity,
    required this.wind,
    required this.temp,
    required this.weatherCondition,
  });
  factory WeatherModel.fromjson(json) {
    return WeatherModel(
      chanceOfRain: json['forecast']['forecastday'][0]['day']
          ['daily_chance_of_rain'],
      cityName: json['location']['name'],
      humidity: json['forecast']['forecastday'][0]['day']['avghumidity'],
      wind: json['forecast']['forecastday'][0]['day']['maxwind_kph'],
      temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      weatherCondition: json['forecast']['forecastday'][0]['day']['condition']
          ['text'],
    );
  }
}
