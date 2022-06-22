import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefData {
  Future<String> getName() async {
    final pref = await SharedPreferences.getInstance();
    var name = pref.getString("name");
    if (name != null) {
      return name;
    } else {
      return "";
    }
  }

  Future<String> getEmail() async {
    final pref = await SharedPreferences.getInstance();
    var email = pref.getString("email");
    if (email != null) {
      return email;
    } else {
      return "";
    }
  }

  Future<String> getPassword() async {
    final pref = await SharedPreferences.getInstance();
    var password = pref.getString("password");
    if (password != null) {
      return password;
    } else {
      return "";
    }
  }

  Future<bool> getLoggedInStatus() async {
    final pref = await SharedPreferences.getInstance();
    var isLoggedIn = pref.getBool("isLoggedIn");
    if (isLoggedIn == true && isLoggedIn != null) {
      return true;
    } else {
      return false;
    }
  }
}
