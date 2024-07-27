import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../screen/home/model/weather_model.dart';

class APIHelper {
  Future<WeatherModel?> getAPI(String city) async {
    String link =
        "https://api.openweathermap.org/data/2.5/weather?q=${city}&appid=834e69bbceebef3b3911cedd4bdcfa7b";

    var respons = await http.get(Uri.parse(link));

    if (respons.statusCode == 200)
    {
      var json = jsonDecode(respons.body);
      print(json);
      WeatherModel model = WeatherModel.mapToModel(json);
      print(model);
      return model;
    }
    return null;
  }
}
