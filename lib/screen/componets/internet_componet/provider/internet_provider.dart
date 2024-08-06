import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class InternetProvider with ChangeNotifier {
  bool isInternet = false;

  void checkInternet() {
    Connectivity checkConnectivity = Connectivity();

    checkConnectivity.onConnectivityChanged.listen(
      (event) {
        if (event.contains(ConnectivityResult.none)) {
          isInternet = false;
        } else {
          isInternet = true;
        }
        print(isInternet);
        notifyListeners();
      },
    );
  }
}
