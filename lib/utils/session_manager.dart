import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  int? value;
  String? id;
  String? username;
  String? fullname;
  String? email;

  Future<void> saveSession(int val, String id, String username, String fullname, String email) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setInt("value", val);
    await pref.setString("id", id);
    await pref.setString("username", username);
    await pref.setString("fullname", fullname);
    await pref.setString("email", email);
  }

  Future<bool> getSession() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    value = pref.getInt("value");
    id = pref.getString("id");
    username = pref.getString("username");
    fullname = pref.getString("fullname");
    email = pref.getString("email");

    return username != null;
  }

  Future<void> clearSession() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.clear();
  }
}

SessionManager sessionManager = SessionManager();