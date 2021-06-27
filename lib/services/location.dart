import 'package:geolocator/geolocator.dart';

class Location {
  // the properties of the class
  double latitude;
  double longitude;

  Future<void> getCurrentLocation() async {
    // this is the getCurrentLocation() method
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);

      latitude = position.latitude;
      longitude = position.longitude;
    }
    catch (e){
      print(e);
    }
  }
}