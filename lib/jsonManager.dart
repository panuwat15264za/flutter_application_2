import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class JsonManager {
  static Future<Map<String, dynamic>> loadJson() async {
    String jsonString = await rootBundle.loadString('assets/dataNike.json');
    return json.decode(jsonString);
  }
}