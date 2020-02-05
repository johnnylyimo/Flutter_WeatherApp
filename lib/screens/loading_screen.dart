import 'package:flutter/material.dart';
import 'package:weather_app/screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/services/weather.dart';
import 'package:connectivity/connectivity.dart';
import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  // Show Message if phone is not conneted to the Internet
  void _showDialogForInternet() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              'No Internet Connnection!',
              textAlign: TextAlign.center,
            ),
            content: Text(
              'Please turn on Internet,\nthen Close and Open again this App',
              textAlign: TextAlign.center,
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
            actions: <Widget>[
              FlatButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  void _showDialogForLocation() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              'Location is Disabled!',
              textAlign: TextAlign.center,
            ),
            content: Text(
              'Please turn on Location/GPS,\nthen Close and Open again this App',
              textAlign: TextAlign.center,
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
            actions: <Widget>[
              FlatButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  //  bring current user location of the device
  void getLocationData() async {
    var weatherData = await WeatherModel().getLocationWeather();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LocationScreen(
          locationWeather: weatherData,
        ),
      ),
    );
  }

  //Check device is device connected and location is on.
  void isConnectedLocationIsOn() async {
    var result = await Connectivity().checkConnectivity();
    bool isLocationEnabled = await Geolocator().isLocationServiceEnabled();
    if (result == ConnectivityResult.none) {
      _showDialogForInternet();
    } else if (isLocationEnabled == false) {
      _showDialogForLocation();
    } else {
      getLocationData();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    getLocationData();
    isConnectedLocationIsOn();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.grey,
          size: 100.0,
        ),
      ),
    );
  }
}
