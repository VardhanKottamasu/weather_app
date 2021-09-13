import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:geolocator/geolocator.dart';
import 'package:weather_app/screens/loading_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoadingScreen(),
    );
  }
}

class MyApp1 extends StatefulWidget {
  @override
  _MyApp1State createState() => _MyApp1State();
}

class _MyApp1State extends State<MyApp1> {
  @override
  void getData() async {
    String url =
        'https://api.openweathermap.org/data/2.5/weather?lat=23.12&lon=35&appid=6a34e323f1c6b1a4667c5f111ffc7cf7';
    http.Response response = await http.get(Uri.parse(url));
    print(response.statusCode);
    if (response.statusCode == 200) {
      String data = response.body;
      var variable = jsonDecode(data)['weather'][0]['main'];
      print(variable);
    } else
      print("some error!");
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Container(
        child: ElevatedButton(
            child: Text('Get Location'),
            onPressed: () {
              getData();
            },
        ),
      ),
    );
  }
}
