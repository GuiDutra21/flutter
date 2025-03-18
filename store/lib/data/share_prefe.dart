import 'dart:async'; // Required for Future
import 'dart:convert';
import 'dart:core';

import 'package:shared_preferences/shared_preferences.dart';

// Classe que contém os métodos responsáveis por salvar os dados para o login automático
class Shareprefe {

  static Future<bool> saveString(String key, String value) async
  {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString(key, value);
  }

  static Future<bool> saveMap(String key, Map<String, dynamic> value) async
  {
    return saveString(key, jsonEncode(value));
  }

  static Future<String> getString(String key, [String defaultValue = '']) async
  {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? defaultValue;
  }

  static Future<Map<String, dynamic>> getMap(String key) async
  {
    try{
      return jsonDecode(await getString(key));
    }catch(_)
    {
      return {};
    }
  }

  static Future<bool> remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove(key);
  }
}