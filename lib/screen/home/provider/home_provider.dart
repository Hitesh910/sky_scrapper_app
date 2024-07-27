import 'package:flutter/material.dart';
import 'package:sky_scrapper_app/utils/helper/API_helper.dart';

import '../model/weather_model.dart';
class HomeProvider with ChangeNotifier
{
  // List<WeatherModel> weatherList = [];
   WeatherModel? model;
  List<WeatherModel> weatherList = [];
  String search = "Surat";

  Future<void> getWeather()
  async {
    APIHelper helper = APIHelper();
    // weatherList = helper.getAPI();
    model =await helper.getAPI(search);
//notifyListeners();
    // print(model);
    if(model!=null)
      {
        notifyListeners();
      }
  }
}