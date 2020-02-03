import 'package:flutter/material.dart';
import 'package:weather_app/screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {



  void _showDialog(){
    showDialog(
      context: context,
      builder: (context){
        return AlertDialog(
          title: Text('No Internet Connnection!', textAlign: TextAlign.center,),
          content: Text('Please turn on Internet,\nthen Close and Open again this App', textAlign: TextAlign.center,),
        );
      }
    );
  }



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocationData();
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
