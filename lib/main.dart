import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wheatherapp/providers/registeration_provider.dart';
import 'package:wheatherapp/providers/weather_provider.dart';
import 'package:wheatherapp/screens/home_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
  return  MultiProvider(

      providers: [
        ChangeNotifierProvider(create: (context) => RegistrationProvider(),),
        ChangeNotifierProvider(create: (context) => WeatherProvider(),),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: WeatherPage(),
      ),

    );
  }
}

