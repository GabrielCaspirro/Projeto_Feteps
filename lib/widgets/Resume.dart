import 'package:flutter/material.dart';
import 'package:weather_flutter/Controllers/Theme_Control.dart';

class Resume extends StatelessWidget {
  final String cidade;
  final String desc;
  final double tempAtual;
  final double tempMax;
  final double tempMin;
  final int icone;

  const Resume({super.key,
    required this.cidade, 
    required this.desc, 
    required this.tempAtual, 
    required this.tempMax, 
    required this.tempMin, 
    required this.icone
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(padding: EdgeInsets.all(5)),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              children: [
                Icon(Icons.brightness_6_outlined),
                Switch(
                  value: Theme_Control.instance.Dark, 
                  onChanged: (bool value) {
                    Theme_Control.instance.ChangeTheme();
                  },
                )
              ]
            )
          ],
        ),
        Text(
          cidade, 
          style: TextStyle(fontSize: 18),
        ),
        Padding(padding: EdgeInsets.all(5)),
        IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: AssetImage("images/$icone.png")),
              Padding(padding: EdgeInsets.all(2)),
              Text(
                '${tempAtual.toStringAsFixed(0)} ºC',
                style: TextStyle(fontSize: 40)
              ),
              

              VerticalDivider(
              color: Color.fromARGB(255, 11, 11, 11),
              thickness: 1,
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('${tempMax.toStringAsFixed(0)} ºC'),
                  Text('${tempMin.toStringAsFixed(0)} ºC'),
                ],
              )
            ]
          ),
        ),
        Padding(padding: EdgeInsets.all(10)),
        Text(desc, style: TextStyle(fontSize: 16)),
      ],
    );
  }
}