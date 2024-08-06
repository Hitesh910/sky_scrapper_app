import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sky_scrapper_app/screen/componets/internet_componet/provider/internet_provider.dart';
import 'package:sky_scrapper_app/screen/home/provider/home_provider.dart';
import 'package:sky_scrapper_app/utils/app_routes.dart';
import 'package:sky_scrapper_app/utils/app_themes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider.value(value: InternetProvider()..checkInternet()),
      ChangeNotifierProvider.value(value: HomeProvider())
    ],
    child: Consumer<HomeProvider>(builder: (context, value, child) {
      value.getTheme();
      return MaterialApp(
        themeMode: ThemeMode.dark,
        theme: value.theme == "light" ? lightTheme : darkTheme,
        debugShowCheckedModeBanner: false,
        routes: app_routes,
      );
    }),
  )
      // MaterialApp(
      //   debugShowCheckedModeBanner: false,
      //   routes: app_routes,
      // ),
      );
}
