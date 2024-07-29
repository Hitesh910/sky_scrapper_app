import 'package:flutter/material.dart';

class InternetComponets extends StatefulWidget {
  const InternetComponets({super.key});

  @override
  State<InternetComponets> createState() => _InternetComponetsState();
}

class _InternetComponetsState extends State<InternetComponets> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Center(child: Icon(Icons.wifi_off),),
      Text("No internet Connection")
    ],);
  }
}
