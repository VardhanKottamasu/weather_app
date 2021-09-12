import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }
  void getLocation() async
  {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low
      );
      print(position);
    }
    catch(e)
    {
      print(e);
    }
  }

  void getData() async
  {
    String url='api.openweathermap.org/data/2.5/weather?q=London&appid=6a34e323f1c6b1a4667c5f111ffc7cf7';
    Response response=await get(Uri.parse(url));
    print(response.statusCode);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Container(
        child: ElevatedButton(
          child: Text('Get Location'),
          onPressed: (){
            getData();
          }
        ),
      ),
    );
  }
}