
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sky_scrapper_app/utils/helper/API_helper.dart';

import '../model/weather_model.dart';
class HomeProvider with ChangeNotifier
{
  // List<WeatherModel> weatherList = [];
   Future<WeatherModel?>? model;
  List<WeatherModel> weatherList = [];
  String search = "Surat";
  int temp = 0;

  getWeather()
   async {
    APIHelper helper = APIHelper();
    // weatherList = helper.getAPI();
    model = helper.getAPI(search);
//notifyListeners();
    // print(model);
    //
    // temp = {model!.main!.temp!.ceil() - 273.15} as int;
     model?.then((value) {
       if(model!=null)
       {
         // tempureChange();
         notifyListeners();
       }
     },);

  }

  // void tempureChange()
  // {
  //   temp = model!.main!.temp!.ceil();
  //   notifyListeners();
  //   print(temp);
  // }


}