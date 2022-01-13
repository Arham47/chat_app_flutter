import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HelperFunction{
  static String SharedPreferencesLoggedInnKey="ISLOGGEDIN";
  static String SharedPreferencesUserNameKey="USERNAMEKEY";
  static String SharedPreferencesUserEmailKey="USEREMAILKEY";
// saving data to shared preference

static Future<bool> SaveUserLoggedInPreference(bool isUserLoggedIn)async{
  SharedPreferences prefs= await SharedPreferences.getInstance();
  return await prefs.setBool(SharedPreferencesLoggedInnKey, isUserLoggedIn);

}

  static Future<bool> SaveUserNamePreference(String UserName)async{
    SharedPreferences prefs= await SharedPreferences.getInstance();
    return await prefs.setString(SharedPreferencesUserNameKey, UserName);

  }
  static Future<bool> SaveUserEmailPreference(String UserName)async{
    SharedPreferences prefs= await SharedPreferences.getInstance();
    return await prefs.setString(SharedPreferencesUserEmailKey, UserName);

  }
  // get user shared preference

  static Future<bool?> getUserLoggedInPreference()async{
    SharedPreferences prefs= await SharedPreferences.getInstance();
    return await prefs.getBool(SharedPreferencesLoggedInnKey);

  }

  static Future<String?> getUserNamePreference(String UserNamell)async{
    SharedPreferences prefs= await SharedPreferences.getInstance();
    return await prefs.getString(SharedPreferencesUserNameKey);

  }
  static Future<String?> getUserEmailPreference(String UserName)async{
    SharedPreferences prefs= await SharedPreferences.getInstance();
    return await prefs.getString(SharedPreferencesUserEmailKey);

  }
}
