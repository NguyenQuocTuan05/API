import 'dart:convert';

import 'package:api_news/apps/configs/const_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShareCustom {
  static Future<void> setString(String key, Object value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, jsonEncode(value));
  }

  static Future<List> getStringToList(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? actions = prefs.getString(key);
    List<int> result = List.from(jsonDecode(actions ?? "[]"));
    return result;
  }
}
