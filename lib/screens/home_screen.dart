import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/weather_provider.dart';
import 'details_screen.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Weather App",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      body: Consumer<WeatherProvider>(
        builder: (context, weatherProvider, child) {
          final weatherObjectModel = weatherProvider.weatherModel;
          if (weatherObjectModel == null) {
            weatherProvider.fetchWeather();
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemCount: weatherObjectModel.country.length,
              itemBuilder: (context, index) {
                final country = weatherObjectModel.country[index];

                return Card(
                  elevation: 30,
                  child: ListTile(
                    leading: SizedBox(
                      width: 50,
                      height: 50,
                      child: Image.network(
                        country["countryImageUrl"],
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(Icons.flag, size: 40, color: Colors.red);
                        },
                      ),
                    ),
                    title: Text(country["name"]),
                    subtitle: Text(
                      '${country["tempreature"]}°C',
                    ),

                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CountryDetailScreen(country: country),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

