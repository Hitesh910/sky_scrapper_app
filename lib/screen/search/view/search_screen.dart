import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sky_scrapper_app/screen/home/provider/home_provider.dart';

import '../../home/model/weather_model.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController txtSearch = TextEditingController();
  HomeProvider? providerR;
  HomeProvider? providerW;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<HomeProvider>().getWeather();
  }

  @override
  Widget build(BuildContext context) {
    providerR = context.read<HomeProvider>();
    providerW = context.watch<HomeProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Sky scrapper"),
      ),
      body: // Future builder
      FutureBuilder(
        future: providerW!.model,
        builder: (context, snapshot) {
          print(snapshot.data!.name);
          if (snapshot.hasError) {
            Text("${snapshot.error}");
          }
          else if (snapshot.hasData) {
            WeatherModel? model = snapshot.data;
            print(model!.name);
            if (model != null) {
// providerR!.weatherList.addAll(model as Iterable<WeatherModel>);
            }
// else if (model == null)
// {
//   Text("No data found");
// }
            else if (model == null) {
            return  Text("Some went wrong");
            }
            else {
            return  Column(
                children: [
                  SearchBar(controller: txtSearch,),
                  // ListView.builder(itemBuilder: (context, index) {
                  //
                  // },)
                  Container(
                    height: 100,
                    width: MediaQuery.sizeOf(context).width,
                    color: Colors.red,
                    child: Column(children: [
                      Row(
                        children: [
                          Text("${model.main!.temp}")
                        ],
                      )
                    ],),
                  )
                ],
              );
            }
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),

    );
  }
}
