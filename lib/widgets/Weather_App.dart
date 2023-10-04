import 'package:flutter/material.dart';
import 'package:weather_flutter/Controllers/Theme_Control.dart';
import 'package:weather_flutter/widgets/Home.dart';

class Weather_App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Theme_Control.instance,
      builder: (context, child){
        return MaterialApp(
        title: "Weather App",
        theme: Theme_Control.instance.Dark? ThemeData.dark() : ThemeData.light(),
        debugShowCheckedModeBanner: false,
        home: Home(),
        );
      }
    );
  }
}