import 'package:flutter/material.dart';

class Themeprovider extends ChangeNotifier{
  bool isLight = true;

  void changeTheme(){
    isLight = !isLight;
    notifyListeners();
  }
}