import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Sky scrapper"),),
      body: Column(children: [Container(height: 100,width: MediaQuery.sizeOf(context).width,color: Colors.red,)],),);
  }
}
