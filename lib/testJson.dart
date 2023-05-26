import 'jsonManager.dart';

void main() async {
  Map<String, dynamic> jsonData = await JsonManager.loadJson();
  
  print(jsonData);
  // ทดสอบการใช้งานข้อมูล JSON
}