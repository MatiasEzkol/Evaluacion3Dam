import 'package:shared_preferences/shared_preferences.dart';

Future<String> getUserEmail() async {
  SharedPreferences sp = await SharedPreferences.getInstance();
  return sp.getString('userEmail') ?? '';
}
