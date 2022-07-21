import 'package:shared_preferences/shared_preferences.dart';

Future<String> getUser() async {
  SharedPreferences sp = await SharedPreferences.getInstance();
  return sp.getString('user') ?? '';
}
