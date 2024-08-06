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
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  String dropdown = "Hello";

  @override
  void initState() {
    super.initState();
    context.read<HomeProvider>().getWeather();
    context.read<HomeProvider>().getData();
  }

  @override
  Widget build(BuildContext context) {
    providerR = context.read<HomeProvider>();
    providerW = context.watch<HomeProvider>();
    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Sky scrapper App"),
          actions: [
            PopupMenuButton(
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    child: const Text("Light"),
                    onTap: () {
                      //providerR!.changeTheme("light");
                      providerR!.setTheme("light");
                      // print(providerR?.theme);
                    },
                  ),
                  PopupMenuItem(
                    child: const Text("Dark"),
                    onTap: () {
                      // providerW!.changeTheme("dark");
                      providerR!.setTheme("dark");
                    },
                  ),
                ];
              },
            ),

]            //     icon: const Icon(Icons.color_lens))

        ),
        body: // Future builder
            context.watch<InternetProvider>().isInternet == true
                ? SingleChildScrollView(
                    child: FutureBuilder(
                      future: providerW!.model,
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
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SearchBar(
                                        hintText: "Search",
                                        trailing: [
                                          IconButton(
                                              onPressed: () {
                                                providerR!.search =
                                                    txtSearch.text;
                                                context
                                                    .read<HomeProvider>()
                                                    .searchWeather();
                                                Navigator.pushNamed(
                                                    context, 'search');
                                              },
                                              icon: const Icon(Icons.search))
                                        ],
                                        elevation:
                                            const WidgetStatePropertyAll(0),
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

                                    Image(
                                      image: AssetImage(
                                          "${providerW!.weatherImage[model.clouds![0]!.main]}"),
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
                    ),
                  )
                : const InternetComponets(),
        drawer: Drawer(
          child: Padding(
            padding: EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 10),
            child: Column(
              children: [
                // Expanded(
                //   child: ListView.builder(itemBuilder: (context, index) {},),
                // ),
                InkWell(
                  onTap: () {
                    bookmarkWeather();
                  },
                  child: const Row(
                    children: [
                      Icon(Icons.bookmark),
                      SizedBox(
                        height: 20,
                      ),
                      Text("Bookmark"),
                    ],
                  ),
                ),
                const Divider(
                  thickness: 2,
                ),
                const Row(
                  children: [
                    Icon(Icons.settings),
                    SizedBox(
                      height: 20,
                    ),
                    Text("Setting"),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                const Row(
                  children: [
                    Icon(Icons.privacy_tip),
                    SizedBox(
                      height: 20,
                    ),
                    Text("Privacy policy"),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                const Row(
                  children: [
                    Icon(Icons.help),
                    SizedBox(
                      height: 20,
                    ),
                    Text("Help"),
                  ],
                ),
              ],
            ),
          )
          // Text("hello"),)
          ,
        ));
  }

  void bookmarkWeather() {
    showModalBottomSheet(
      context: context,
      builder: (context) => BottomSheet(
          onClosing: () {},
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: providerW!.saveWeather.length,
                itemBuilder: (context, index) {
                  return Text("${providerW!.saveWeather[index]}");
                },
              ),
            );
          }),
    );
  }
}
