import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  final String url;
  NetworkHelper(this.url);

  void getData() async {
    http.Response response = await http.get(url);
  }
}