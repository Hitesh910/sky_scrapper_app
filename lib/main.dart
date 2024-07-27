import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sky_scrapper_app/screen/home/provider/home_provider.dart';
import 'package:sky_scrapper_app/utils/app_routes.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider.value(value: HomeProvider())
    ],child: MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: app_routes,
    ),)
    // MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   routes: app_routes,
    // ),
  );
}
