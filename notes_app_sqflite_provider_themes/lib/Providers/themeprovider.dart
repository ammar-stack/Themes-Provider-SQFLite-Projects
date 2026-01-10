import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier{
  bool isDark = true;

  void getValue() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isDark = prefs.getBool('isLight')!;
    notifyListeners();
  }

  void changeValue() async{
    isDark = !isDark;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLight', isDark);
    notifyListeners();
    
  }
}