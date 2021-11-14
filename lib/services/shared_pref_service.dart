import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefService{
  late SharedPreferences _prefs;

  SharedPrefService(){
    init();
  }

  init()async{
    _prefs = await SharedPreferences.getInstance();
  }

  Future<bool> insertStringData({required String key,required String value})async{
    return await _prefs.setString(key, value);
  }
  getStringData({required String key}){
    return _prefs.get(key).toString();
  }

  void clearData() async{
    _prefs.clear();
  }


}