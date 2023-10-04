import 'package:flutter/material.dart';

class Theme_Control extends ChangeNotifier{
  late bool Dark;
  static Theme_Control instance = new Theme_Control();

  Theme_Control(){
    Dark = false;
  }

  ChangeTheme(){
    Dark = !Dark;
    notifyListeners();
  }
}