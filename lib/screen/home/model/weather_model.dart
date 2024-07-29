class WeatherModel {
  String? name;
  double? timeZone;
  MainModel? main;
  WindModel? wind;

  WeatherModel({this.name, this.timeZone, this.main,this.wind});

  factory WeatherModel.mapToModel(Map m1)
  {
    return WeatherModel(name: m1['name'],
        timeZone: m1['timeZone'],
        main: MainModel.mapToModel(m1['main']),wind: WindModel.mapToModel(m1['wind']));
  }
}

class MainModel
{
  num? temp,feels_like,temp_min,temp_max;
  int? pressure,humidity;

  MainModel(
      {this.temp,
        this.feels_like,
        this.temp_min,
        this.temp_max,
        this.pressure,
        this.humidity});

  factory MainModel.mapToModel(Map m1)
  {
    return MainModel(temp: m1['temp'],feels_like: m1['feels_like'],humidity: m1['humidity'],pressure:m1['pressure'] ,temp_max:m1['temp_max'] ,temp_min:m1['temp_min'] );
  }
}

class WindModel
{
  // double? temp,feels_like,temp_min,temp_max;
  num? speed,deg;


  WindModel({this.speed, this.deg});

  factory WindModel.mapToModel(Map m1)
  {
    return WindModel(speed: m1['speed'],deg: m1['deg']);
  }
}
// class MainModel {
//   double? temp,
//       feels_like,
//       temp_min,
//       temp_max,
//       pressure,
//       humidity,
//       sea_level,
//       grnd_level;
//
//   MainModel(
//       {this.temp,
//       this.feels_like,
//       this.temp_min,
//       this.temp_max,
//       this.pressure,
//       this.humidity,
//       this.sea_level,
//       this.grnd_level});
//
//   factory MainModel.mapToModel(Map m1) {
//     return MainModel(
//         temp: m1['temp'],
//         feels_like: m1['feels_like'],
//         temp_min: m1['temp_min'],
//         temp_max: m1['temp_max'],
//         pressure: m1['pressure'],
//         humidity: m1['humidity'],
//         sea_level: m1['sea_level'],
//         grnd_level: m1['grnd_level']);
//   }
// }
