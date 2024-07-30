class WeatherModel {
  String? name;
  double? timeZone;
  MainModel? main;
  WindModel? wind;
  List<CloudsModel?>? clouds = [];

  WeatherModel({this.name, this.timeZone, this.main,this.wind, this.clouds});

  factory WeatherModel.mapToModel(Map m1)
  {
    List l1 = m1['weather'];
    return WeatherModel(name: m1['name'],
        timeZone: m1['timeZone'],
        main: MainModel.mapToModel(m1['main']),wind: WindModel.mapToModel(m1['wind']),clouds: l1.map((e) => CloudsModel.mapToModel(e),).toList());
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

class CloudsModel
{
  String? main;
  int? id;

  CloudsModel({this.main,this.id});

  factory CloudsModel.mapToModel(Map m1)
  {
    return CloudsModel(main: m1['main'],id: m1['id']);
  }
}