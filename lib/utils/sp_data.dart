import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class sp_data {
  static Object? put( String key , Object value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(value is  int ){
      await prefs.setInt(key, value);
    }else if(value is double){
      await prefs.setDouble(key, value);
    }else if(value is bool){
      await prefs.setBool(key, value);
    }else if(value is String){
      await prefs.setString(key, value);
    }else if(value is List<String>){
      await prefs.setStringList(key, value);
    }
  }

  static Future  get(String key ,Object defaultValue) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(defaultValue is  int) {
      return prefs.getInt(key);
    }
    else if(defaultValue is  double) {
      return prefs.getDouble(key);
    }
    else if(defaultValue is bool) {
      return prefs.getBool(key);
    }
    else if(defaultValue is String) {
      return prefs.getString(key);
    }
    else if(defaultValue is List) {
      return prefs.getStringList(key);
    }

  }

  static void del(String key)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key); //删除指定键
  }

  static void clear()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear(); ////清空缓存
  }
}
