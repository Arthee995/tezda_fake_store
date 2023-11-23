import 'package:shared_preferences/shared_preferences.dart';

MySharedPreference mySharedPreference = MySharedPreference();

class MySharedPreference {
  static String? loginToken;

  setLoginToken(String key, String data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("loginToken", data);
    getLoginToken();
  }

  getLoginToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    loginToken = prefs.getString("loginToken");
    return loginToken;
  }

  clearData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
