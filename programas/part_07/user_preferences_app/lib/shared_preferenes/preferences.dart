import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _prefs;
  static String _name = 'benqui';
  static bool _isDarkmode = false;
  static int _gender = 1;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  //name
  static String get name {
    return _prefs.getString('name') ?? _name;
  }

  static set name(String name) {
    _name = name;
    _prefs.setString('name', name);
  }

  //bool dark mode
  static bool get isDarkMode {
    return _prefs.getBool('isDarkMode') ?? _isDarkmode;
  }

  static set isDarkMode(bool value) {
    _isDarkmode = value;
    _prefs.setBool('isDarkMode', value);
  }

  //int gender
  static int get gender {
    return _prefs.getInt('gender') ?? _gender;
  }

  static set gender(int value) {
    _gender = value;
    _prefs.setInt('gender', value);
  }
}
