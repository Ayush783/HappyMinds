import 'dart:convert';
import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsServcie {
  //retreive the saved data from shared prefs
  Future<Map<String, bool>> getData() async {
    try {
      final _prefs = await SharedPreferences.getInstance();
      final jsonString = _prefs.getString('hashString');
      if (jsonString == null) await _prefs.setString('hashString', '{}');
      final map = json.decode(jsonString!);
      log(map.toString());
      return Map<String, bool>.from(map as Map);
    } catch (e) {
      log(e.toString());
      return {};
    }
  }
}
