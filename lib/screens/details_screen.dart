import 'package:flutter/material.dart';

class CountryDetailScreen extends StatelessWidget {
  final Map<String, dynamic> country;

  const CountryDetailScreen({super.key, required this.country});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text(country["name"] ,style: TextStyle(
    color: Colors.white,
    )
    ,),
    centerTitle: true,
    backgroundColor: Colors.deepOrange,
    ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SizedBox(
            width:300,
            height:300,
            child: Card(
             elevation :40,
               // optional
              semanticContainer:true,
              child: Column(

                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(country["weatherImageUrl"]),

                  ),

                  const SizedBox(height: 20),
                  Text(
                    country["name"],
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Weather: ${country["weatherCondition"]}',
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Temperature: ${country["tempreature"]}°C',
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
          ),
        )
      ),
    );
  }
}
