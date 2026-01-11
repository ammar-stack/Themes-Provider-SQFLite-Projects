import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Themeprovider extends ChangeNotifier{
  bool isLight = true;

  void checkMode() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isLight = prefs.getBool('isLight')!;
    notifyListeners();
  }

  void changeMode() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLight', !isLight);
    checkMode();
  }
}