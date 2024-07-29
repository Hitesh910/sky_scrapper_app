import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sky_scrapper_app/screen/componets/internet_componet/provider/internet_provider.dart';
import 'package:sky_scrapper_app/screen/componets/internet_componet/view/internet_componets.dart';

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
  int? temp;
  GlobalKey<ScaffoldState> ScaffoldKey = GlobalKey<ScaffoldState>();
  String dropdown = "Hello";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<HomeProvider>().getWeather();
    // temp = (context.read<HomeProvider>().model!.main!.temp!.ceil() - 273.15).ceil();
  }

  @override
  Widget build(BuildContext context) {
    providerR = context.read<HomeProvider>();
    providerW = context.watch<HomeProvider>();
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          // leading: IconButton(
          //     onPressed: () {
          //       ScaffoldKey.currentState!.openDrawer();
          //     },
          //     icon: Icon(Icons.menu)),
          title: const Text("Sky scrapper App"),
          actions: [
            IconButton(
                onPressed: () {
                  DropdownButton(
                    value: dropdown,
                    items: const [DropdownMenuItem(child: Text("hello"))],
                    onChanged: (value) {},
                  );
                },
                icon: const Icon(Icons.color_lens))
          ],
        ),
        body: // Future builder
        context.watch<InternetProvider>().isInternet
            ? SingleChildScrollView(
          child: FutureBuilder(
            future: providerW!.model,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text("${snapshot.error}");
              } else if (snapshot.hasData) {
                WeatherModel? model = snapshot.data;
                print(model!.name);
                if (model == null) {
                  // providerR!.weatherList.addAll(model as Iterable<WeatherModel>);
                  return Text("${snapshot.error}");
                }
                // else if (model == null)
                // {
                //   Text("No data found");
                // }
                else {
                  return //stack
                    Stack(
                      children: [
                        Container(
                          height: MediaQuery
                              .sizeOf(context)
                              .height,
                          width: MediaQuery
                              .sizeOf(context)
                              .width,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/background.jpg"),
                                  fit: BoxFit.fill)),
                        ),
                        Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SearchBar(
                                hintText: "Search",
                                trailing: [
                                  IconButton(
                                      onPressed: () {
                                        providerR!.search = txtSearch.text;
                                        context.read<HomeProvider>()
                                            .getWeather();
                                        // Navigator.pushNamed(context, 'search');

                                      },
                                      icon: Icon(Icons.search))
                                ],
                                elevation: const WidgetStatePropertyAll(0),
                                controller: txtSearch,
                                onTap: () {
                                  // Navigator.pushNamed(context, 'search');
                                  // providerR!.search = txtSearch.text;
                                  // context.read<HomeProvider>().getWeather();
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 20,
                                  width: 20,
                                  decoration: const BoxDecoration(
                                    // image: DecorationImage(image: AssetImage(""))
                                  ),
                                ),
                                const Icon(Icons.location_on),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "${model.name}",
                                  style: const TextStyle(fontSize: 22),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Image(
                              image: AssetImage("assets/images/img.png"),
                              height: 120,
                              width: 150,
                            ),
                            Text(
                              "${model.main!.temp!.ceil() - 273}ºC",
                              style: const TextStyle(
                                  fontSize: 50, fontWeight: FontWeight.w800),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "Clouds",
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            Container(
                              height: 95,
                              width: MediaQuery
                                  .sizeOf(context)
                                  .width,
                              margin: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              height: 35,
                                              width: 35,
                                              decoration: const BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          "assets/images/img3.png"))),
                                            ),
                                            const SizedBox(
                                              width: 8,
                                            ),
                                            Text(
                                              "${model.main!.humidity}",
                                              style: const TextStyle(
                                                  fontSize: 18),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              height: 30,
                                              width: 30,
                                              decoration: const BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          "assets/images/img7.png"))),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              "${model.wind!.deg}º",
                                              style: const TextStyle(
                                                  fontSize: 18),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              height: 28,
                                              width: 28,
                                              decoration: const BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          "assets/images/img5.png"))),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              "${model.main!.pressure}",
                                              style: const TextStyle(
                                                  fontSize: 18),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              height: 30,
                                              width: 30,
                                              decoration: const BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          "assets/images/img6.png"))),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text("${model.main!.temp_max}",
                                                style:
                                                const TextStyle(fontSize: 18))
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10,),
                            // Row(
                            //   children: [
                            //     Container(
                            //       height: 20,
                            //       width: 20,
                            //       decoration: BoxDecoration(
                            //           image: DecorationImage(
                            //               image: AssetImage("assets/images/img6.png"))),
                            //     ),
                            //     Text("${providerW!.model!.main!.temp_max}")
                            //   ],
                            // ),
                            Container(
                              height: 120,
                              width: MediaQuery
                                  .sizeOf(context)
                                  .width,
                              // color: Colors.white10,
                              margin: const EdgeInsets.all(8),
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(color: Colors.white10,
                                  borderRadius: BorderRadius.circular(10)),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children:
                                  // ListView.builder(
                                  //   itemCount: 5,
                                  //   itemBuilder: (context, index) {
                                  //     return Container(
                                  //       height: 50,
                                  //       width: 25,
                                  //       decoration: BoxDecoration(
                                  //           border: Border.all(color: Colors.deepPurple)),
                                  //       child: Column(
                                  //         children: [
                                  //           Text("14:30"),
                                  //           Container(
                                  //             height: 20,
                                  //             width: 20,
                                  //             decoration: BoxDecoration(
                                  //                 image: DecorationImage(
                                  //                     image: AssetImage(
                                  //                         "assets/images/img7.png"))),
                                  //           )
                                  //         ],
                                  //       ),
                                  //     );
                                  //   },
                                  // ),
                                  List.generate(12, (index) {
                                    return Container(
                                        height: 100,
                                        width: 70,
                                        margin: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.deepPurple),
                                            borderRadius: const BorderRadius
                                                .all(
                                                Radius.circular(5))),
                                        child: Column(children: [
                                          Text("${index}:00 AM"),
                                          Container(
                                            height: 45,
                                            width: 35,
                                            decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        "assets/images/img7.png"))),
                                          )
                                        ]));
                                  }),
                                ),
                              ),
                            )
                            //   ],
                            // )
                            // Text("${providerW!.model!.name}"),
                            // Text("${providerW!.model!.main!.temp}")
                          ],
                        ),
                      ],
                    );
                }
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        )
            : InternetComponets(),
        drawer: const Drawer(
    child:
    // Column(
    //   children: [
    //     Expanded(
    //       child: ListView.builder(itemBuilder: (context, index) {},),
    //     ),
    //     const Row(
    //       children: [
    //         Icon(Icons.bookmark),
    //         Text("Bookmark"),
    //       ],
    //     ),
    //     const Divider(thickness: 2,),
    //     const Row(
    //       children: [
    //         Icon(Icons.settings),
    //         Text("Setting"),
    //       ],
    //     ),
    //     const Row(
    //       children: [
    //         Icon(Icons.privacy_tip),
    //         Text("Privacy policy"),
    //       ],
    //     ),
    //     const Row(
    //       children: [
    //         Icon(Icons.help),
    //         Text("Help"),
    //       ],
    //     ),
    //   ],
    // )
    Text("hello"),)
    ,
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

// Column(
// children: [
// Text("${model.name}"),
// Text("${model.main!.temp}"),
// ],
// );

//stack
// Stack(
// children: [
// Container(
// height: MediaQuery.sizeOf(context).height,
// width: MediaQuery.sizeOf(context).width,
// decoration: const BoxDecoration(
// image: DecorationImage(
// image: AssetImage("assets/images/background.jpg"),
// fit: BoxFit.fill)),
// ),
// Column(
// // mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Padding(
// padding: const EdgeInsets.all(8.0),
// child: SizedBox(
// width: MediaQuery.sizeOf(context).width * 1,
// child: SearchBar(
// elevation: const WidgetStatePropertyAll(0),
// controller: txtSearch,
// onTap: () {
// providerR!.search = txtSearch.text;
// context.read<HomeProvider>().getWeather();
// },
// ),
// ),
// ),
// const SizedBox(
// height: 20,
// ),
// Row(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Container(
// height: 20,
// width: 20,
// decoration: const BoxDecoration(
// // image: DecorationImage(image: AssetImage(""))
// ),
// ),
// const Icon(Icons.location_on),
// const SizedBox(
// width: 5,
// ),
// Text(
// "${providerW!.model!.name}",
// style: const TextStyle(fontSize: 22),
// ),
// ],
// ),
// const SizedBox(
// height: 20,
// ),
// const Image(
// image: AssetImage("assets/images/img.png"),
// height: 120,
// width: 150,
// ),
// Text(
// "${providerW!.temp.ceil() - 273}ºC",
// style:
// const TextStyle(fontSize: 50, fontWeight: FontWeight.w800),
// ),
// const SizedBox(
// height: 10,
// ),
// const Text(
// "Clouds",
// style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
// ),
// Row(
// children: [
// Padding(
// padding: const EdgeInsets.all(10),
// child: Column(
// children: [
// Row(
// children: [
// Container(
// height: 35,
// width: 35,
// decoration: const BoxDecoration(
// image: DecorationImage(
// image: AssetImage(
// "assets/images/img3.png"))),
// ),
// const SizedBox(
// width: 8,
// ),
// Text(
// "${providerW!.model!.main!.humidity}",
// style: const TextStyle(fontSize: 18),
// )
// ],
// ),
// const SizedBox(
// height: 10,
// ),
// Row(
// children: [
// Container(
// height: 30,
// width: 30,
// decoration: const BoxDecoration(
// image: DecorationImage(
// image: AssetImage(
// "assets/images/img7.png"))),
// ),
// const SizedBox(
// width: 10,
// ),
// Text(
// "${providerW!.model!.wind!.deg}º",
// style: const TextStyle(fontSize: 18),
// )
// ],
// ),
// ],
// ),
// ),
// const Spacer(),
// Padding(
// padding: const EdgeInsets.all(10),
// child: Column(
// children: [
// Row(
// children: [
// Container(
// height: 28,
// width: 28,
// decoration: const BoxDecoration(
// image: DecorationImage(
// image: AssetImage(
// "assets/images/img5.png"))),
// ),
// const SizedBox(
// width: 10,
// ),
// Text(
// "${providerW!.model!.main!.pressure}",
// style: const TextStyle(fontSize: 18),
// )
// ],
// ),
// const SizedBox(
// height: 10,
// ),
// Row(
// children: [
// Container(
// height: 30,
// width: 30,
// decoration: const BoxDecoration(
// image: DecorationImage(
// image: AssetImage(
// "assets/images/img6.png"))),
// ),
// const SizedBox(
// width: 10,
// ),
// Text("${providerW!.model!.main!.temp_max}",
// style: const TextStyle(fontSize: 18))
// ],
// ),
// ],
// ),
// ),
// ],
// ),
// // Row(
// //   children: [
// //     Container(
// //       height: 20,
// //       width: 20,
// //       decoration: BoxDecoration(
// //           image: DecorationImage(
// //               image: AssetImage("assets/images/img6.png"))),
// //     ),
// //     Text("${providerW!.model!.main!.temp_max}")
// //   ],
// // ),
// Container(
// height: 120,
// width: MediaQuery.sizeOf(context).width,
// color: Colors.white10,
// margin: const EdgeInsets.all(5),
// child: SingleChildScrollView(
// scrollDirection: Axis.horizontal,
// child: Row(
// children:
// // ListView.builder(
// //   itemCount: 5,
// //   itemBuilder: (context, index) {
// //     return Container(
// //       height: 50,
// //       width: 25,
// //       decoration: BoxDecoration(
// //           border: Border.all(color: Colors.deepPurple)),
// //       child: Column(
// //         children: [
// //           Text("14:30"),
// //           Container(
// //             height: 20,
// //             width: 20,
// //             decoration: BoxDecoration(
// //                 image: DecorationImage(
// //                     image: AssetImage(
// //                         "assets/images/img7.png"))),
// //           )
// //         ],
// //       ),
// //     );
// //   },
// // ),
// List.generate(12, (index) {
// return Container(
// height: 100,
// width: 70,
// margin: const EdgeInsets.all(10),
// decoration: BoxDecoration(
// border: Border.all(color: Colors.deepPurple),
// borderRadius:
// const BorderRadius.all(Radius.circular(5))),
// child: Column(children: [
// Text("${index}:00 AM"),
// Container(
// height: 45,
// width: 35,
// decoration: const BoxDecoration(
// image: DecorationImage(
// image: AssetImage(
// "assets/images/img7.png"))),
// )
// ]));
// }),
// ),
// ),
// )
// //   ],
// // )
// // Text("${providerW!.model!.name}"),
// // Text("${providerW!.model!.main!.temp}")
// ],
// ),
// ],
// ),
