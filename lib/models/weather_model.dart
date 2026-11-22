class CountryModel {
  final int id;
  final String name;
  final String tempreature;
  final String weatherImageUrl;
  final String countryImageUrl;
  final String weatherCondition;

  CountryModel({
    required this.id,
    required this.name,
    required this.tempreature,
    required this.weatherImageUrl,
    required this.countryImageUrl,
    required this.weatherCondition,
  });
}

class WeatherModel {
  List<CountryModel> country;

  WeatherModel({required this.country});

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    final tempList = json["country"]
        .map<CountryModel>(
          (country) => CountryModel(
            id: country["id"],
            name: country["name"],
            tempreature: country["tempreature"],
            weatherImageUrl: country["weatherImageUrl"],
            countryImageUrl: country["countryImageUrl"],
            weatherCondition: country["weatherCondition"],
          ),
        )
        .toList();

    return WeatherModel(country: tempList);
  }
}
