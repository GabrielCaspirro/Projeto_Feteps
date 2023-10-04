import 'package:flutter/material.dart';
import 'package:weather_flutter/widgets/Weather_App.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEn;

Future main() async {
  await DotEn.dotenv.load(fileName: '.env');
  runApp(Weather_App());
} 



