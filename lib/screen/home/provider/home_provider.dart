import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sky_scrapper_app/utils/helper/API_helper.dart';

import '../../../utils/helper/shared_helper.dart';
import '../model/weather_model.dart';

class HomeProvider with ChangeNotifier {
  // List<WeatherModel> weatherList = [];
  Future<WeatherModel?>? model;
  Future<WeatherModel?>? searchModel;
  List<WeatherModel> weatherList = [];
  String search = "Surat";
  int temp = 0;
  String? theme;
  SharedHelper share = SharedHelper();

  getWeather() async {
    APIHelper helper = APIHelper();
    model = helper.getAPI(search);
    model?.then(
      (value) {
        if (model != null) {
          // tempureChange();
          notifyListeners();
        }
      },
    );
  }

  searchWeather() async {
    APIHelper helper = APIHelper();
    searchModel = helper.getAPI(search);

    print("DATA ========================================== $searchModel ");
    searchModel?.then(
      (value) {
        if (value != null) {
          print("DATA1 ========================================== $searchModel ");
          notifyListeners();
        } else {
          print("DATA2 ========================================== $searchModel ");
          searchModel = null;
          notifyListeners();
        }
      },
    );
  }

  // void tempureChange()
  // {
  //   temp = model!.main!.temp!.ceil();
  //   notifyListeners();
  //   print(temp);
  // }

  // void changeTheme(String value)
  // {
  //   theme = value;
  //   notifyListeners();
  //   // print(theme);
  // }

  void setTheme(String value) {
    theme = value;
    share.setTheme(theme!);
    notifyListeners();
    print(theme);
  }

  Future<void> getTheme() async {
    theme = await share.getTheme();
    notifyListeners();
    // print(theme);
  }
}
