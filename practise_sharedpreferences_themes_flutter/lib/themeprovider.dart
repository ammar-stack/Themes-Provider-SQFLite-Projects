import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Themeprovider extends ChangeNotifier{
  bool isLightt = true;

  void checkMode() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isLightt = prefs.getBool('isLight') ?? true;
    notifyListeners();
  }

  void changeMode() async{
    isLightt = !isLightt;
    SharedPreferences prefs =await SharedPreferences.getInstance();
    await prefs.setBool('isLight',isLightt);
    notifyListeners();
  }
}