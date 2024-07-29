import 'package:flutter/material.dart';
import 'package:sky_scrapper_app/screen/home/view/home_screen.dart';
import 'package:sky_scrapper_app/screen/search/view/search_screen.dart';

Map<String,WidgetBuilder> app_routes = {
  "/":(context) => HomeScreen(),
  "search":(context) => SearchScreen(),
};