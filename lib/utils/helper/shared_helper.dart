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
}