import 'package:shared_preferences/shared_preferences.dart';

class SharedHelper {
  void setTheme(String mode) async
  {
    SharedPreferences sha = await SharedPreferences.getInstance();
    sha.setString('theme', mode);
  }

  Future<String?> getTheme() async
  {
    SharedPreferences sha = await SharedPreferences.getInstance();
    String? theme = sha.getString('theme');
    return theme;
  }

  void setData(List<String> weather) async
  {
    SharedPreferences sha = await SharedPreferences.getInstance();
    sha.setStringList("weather", weather);
  }

  Future<List<String>?> getData() async
  {
    SharedPreferences sha = await SharedPreferences.getInstance();
    List<String>? weather = sha.getStringList("weather");
    return weather;
  }
}