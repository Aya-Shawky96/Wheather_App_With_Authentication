class WeatherModel {
 List<dynamic>country;

  WeatherModel({
    required this.country,

  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      country: json["country"],
    );
  }
}
