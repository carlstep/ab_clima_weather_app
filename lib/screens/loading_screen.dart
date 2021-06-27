import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


const apiKey = 'cc50e02b100ed10e750d651224f7efc8';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  double latitude;
  double longitude;
  @override
  void initState() {
    // initState gets called once, when the state is created.
    // TODO: implement initState
    super.initState();
    getLocationData();// this triggers the getLocation class to return the location at the point the app is started.

  }

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();

    latitude = location.latitude;
    longitude = location.longitude;

    NetworkHelper networkHelper = NetworkHelper('https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');

    var weatherData = await networkHelper.getData();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen();
    }));
    //print(locationCity);
    //print(locationTemperature);
    //print(locationConditionID);
    //print(weatherDescription);

  }

  @override
  Widget build(BuildContext context) {
    // build is called repeatedly when new events happen within iniState.

    return Scaffold(
      body: Center(
        child: SpinKitFadingCircle(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
