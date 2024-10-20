class WeatherModel {
  final String city;
  final String weatherCondition;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String? image;
  final DateTime date;

  WeatherModel(
      {required this.city,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.image,
      required this.weatherCondition,
      required this.date});

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
        city: json["location"]["name"],
        image: json["current"]["condition"]["icon"],
        date: DateTime.parse(json["current"]["last_updated"]),
        temp: json["current"]["temp_c"],
        maxTemp: json["forecast"]["forecastday"][0]["day"]["maxtemp_c"],
        minTemp: json["forecast"]["forecastday"][0]["day"]["mintemp_c"],
        weatherCondition: json["current"]["condition"]["text"]);
  }
  @override
  String toString() {
    return 'ArticleModel{temp: $temp, city: $city, weatherCondition: $weatherCondition}';
  }
}
