import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/weather_model.dart';
import '../provider/home_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeProvider? providerR;
  HomeProvider? providerW;
  TextEditingController txtSearch = TextEditingController();

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
        title: Text("Sky scrapper App"),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SearchBar(
            controller: txtSearch,
            onTap: () {
              providerR!.search = txtSearch.text;
              context.read<HomeProvider>().getWeather();
            },
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(""))),
              ),
              Icon(Icons.location_city),
              Text(
                "${providerW!.model!.name}",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
           SizedBox(height: 30,),
           Image(image: AssetImage("assets/images/img.png"),height: 150,width: 150,),
          Text(
            "Clouds",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Row(
                  children: [
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/img5.png"))),
                    ),
                    Text("${providerW!.model!.main!.pressure}")
                  ],
                ),]),
          )
          //     Row(
          //       children: [
          //         Container(
          //           height: 20,
          //           width: 20,
          //           decoration: BoxDecoration(
          //               image: DecorationImage(
          //                   image: AssetImage("assets/images/img6.png"))),
          //         ),
          //         Text("${providerW!.model!.main!.temp_max}")
          //       ],
          //     ),
          //     ListView.builder(
          //       itemCount: 5,
          //       itemBuilder: (context, index) {
          //         return Container(
          //           height: 50,
          //           width: 25,
          //           decoration: BoxDecoration(
          //               border: Border.all(color: Colors.deepPurple)),
          //           child: Column(
          //             children: [
          //               Text("14:30"),
          //               Container(
          //                 height: 20,
          //                 width: 20,
          //                 decoration: BoxDecoration(
          //                     image: DecorationImage(
          //                         image: AssetImage(
          //                             "assets/images/img7.png"))),
          //               )
          //             ],
          //           ),
          //         );
          //       },
          //     )
          //   ],
          // )
          // Text("${providerW!.model!.name}"),
          // Text("${providerW!.model!.main!.temp}")
        ],
      ),
    );
  }
}

// Future builder
// FutureBuilder(
// future: providerW!.model,
// builder: (context, snapshot) {
// print(snapshot.data!.name);
// if (snapshot.hasError)
// {
// Text("${snapshot.error}");
// }
// else if (snapshot.hasData)
// {
// WeatherModel? model = snapshot.data;
// print(model!.name);
// if (model != null)
// {
// // providerR!.weatherList.addAll(model as Iterable<WeatherModel>);
// }
// // else if (model == null)
// // {
// //   Text("No data found");
// // }
// else if (model == null)
// {
// Text("Some went wrong");
// }
// else {
// Column(
// children: [
// Text("${model.name}"),
// Text("${model.main!.temp}"),
// ],
// );
// }
// }
// return Center(
// child: CircularProgressIndicator(),
// );
// },
// ),
