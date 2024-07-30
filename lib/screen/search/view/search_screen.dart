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
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    providerR = context.read<HomeProvider>();
    providerW = context.watch<HomeProvider>();
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text("Sky scrapper"),
      ),
      body: FutureBuilder(
        future: providerW!.searchModel,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("${snapshot.error}");
          } else if (snapshot.hasData) {
            WeatherModel? model = snapshot.data;
            print("=========$model=========");
            print(model?.name);
            if (model == null) {
              return const Text("No data found");
            } else {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      showWeather();
                    },
                    child: Container(
                      height: 100,
                      width: MediaQuery.sizeOf(context).width,
                      margin: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                              image: AssetImage("assets/images/img11.jpg"),
                              fit: BoxFit.cover,
                              opacity: 2)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5),
                            child: Row(
                              children: [
                                // Text(
                                //   "${model.main!.temp!.ceil() - 273}ºC",
                                //   style: TextStyle(fontSize: 15),
                                // ),
                                Text(
                                  "${model.name}",
                                  style: const TextStyle(fontSize: 18),
                                ),
                                const Spacer(),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.bookmark_add_outlined),
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5),
                            child: Text(
                              "${model.main!.temp!.ceil() - 273}ºC",
                              style: const TextStyle(fontSize: 15),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              );
            }
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  void showWeather()
  {
    scaffoldKey.currentState!.showBottomSheet((context) => BottomSheet(onClosing: () {

    }, builder: (context) {
    return  FutureBuilder(
        future: providerW!.searchModel,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("${snapshot.error}");
          } else if (snapshot.hasData) {
            WeatherModel? model = snapshot.data;
            // print(model!.name);
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
                      height: MediaQuery.sizeOf(context).height,
                      width: MediaQuery.sizeOf(context).width,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  "assets/images/background.jpg"),
                              fit: BoxFit.fill)),
                    ),
                    Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Padding(
                        //   padding: const EdgeInsets.all(8.0),
                        //   child: SearchBar(
                        //     hintText: "Search",
                        //     trailing: [
                        //       IconButton(
                        //           onPressed: () {
                        //             providerR!.search =
                        //                 txtSearch.text;
                        //             context
                        //                 .read<HomeProvider>()
                        //                 .searchWeather();
                        //             Navigator.pushNamed(
                        //                 context, 'search');
                        //           },
                        //           icon: const Icon(Icons.search))
                        //     ],
                        //     elevation:
                        //     const WidgetStatePropertyAll(0),
                        //     controller: txtSearch,
                        //     onTap: () {
                        //       // Navigator.pushNamed(context, 'search');
                        //       // providerR!.search = txtSearch.text;
                        //       // context.read<HomeProvider>().getWeather();
                        //     },
                        //   ),
                        // ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.center,
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
                        // Expanded(
                        // child: List.generate(2,(index) {
                        // Text("${model.clouds[index].main}")
                        // },
                        // ),

                        const Image(
                          image:
                          AssetImage("assets/images/img.png"),
                          height: 120,
                          width: 150,
                        ),
                        Text(
                          "${model.main!.temp!.ceil() - 273}ºC",
                          style: const TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.w800),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Clouds",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                        Container(
                          height: 95,
                          width: MediaQuery.sizeOf(context).width,
                          margin: const EdgeInsets.all(5),
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
                                          decoration:
                                          const BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/images/img6.png"),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                            "${model.main!.temp_max}",
                                            style: const TextStyle(
                                                fontSize: 18))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 120,
                          width: MediaQuery.sizeOf(context).width,
                          // color: Colors.white10,
                          margin: const EdgeInsets.all(8),
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.white10,
                              borderRadius:
                              BorderRadius.circular(10)),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: List.generate(
                                12,
                                    (index) {
                                  return Container(
                                    height: 100,
                                    width: 70,
                                    margin:
                                    const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color:
                                            Colors.deepPurple),
                                        borderRadius:
                                        const BorderRadius.all(
                                            Radius.circular(
                                                5))),
                                    child: Column(
                                      children: [
                                        Text("$index:00 AM"),
                                        Container(
                                          height: 45,
                                          width: 35,
                                          decoration:
                                          const BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/images/img7.png"),
                                            ),
                                          ),
                                        ),
                                        Text("24ºC")
                                      ],
                                    ),
                                  );
                                },
                              ),
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
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      );
    },),);
  }
}
