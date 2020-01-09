import 'package:geolocator/geolocator.dart';

class Location {
  // class member variables
  double latitude;
  double longitude;

  void getCurrentLocation() async {
    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    } catch (e) {}
  }
}
