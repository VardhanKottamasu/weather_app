import 'package:flutter/material.dart';

import 'package:geolocator/geolocator.dart';
import 'package:weather_app/services/location.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen>
{
  void getCurrentLocation() async
  {
    try {
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    } catch (e) {print(e);}
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: getCurrentLocation,
          child: Text('Get Location'),
        )
      ),
    );
  }
}
