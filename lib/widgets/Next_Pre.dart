import 'package:flutter/material.dart';
import 'package:weather_flutter/models/Hour.dart';

class Next_Pre extends StatelessWidget {
  final List<Hour> Previsions;

  const Next_Pre({super.key,
   required this.Previsions
  });

  Card MakePrevision(int i){
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(image: AssetImage("images/${Previsions[i].NumIcone}.png")),
          Padding(padding: EdgeInsets.all(2)),
          Text("${Previsions[i].horario}"),
          Padding(padding: EdgeInsets.all(5)),
          Text("${Previsions[i].temp.toStringAsFixed(0)}ºC"),
          Padding(padding: EdgeInsets.all(5)),
          Text("${Previsions[i].desc}"),
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
        itemCount: Previsions.length,
        shrinkWrap: true,
        itemBuilder: (context, i) {
          return MakePrevision(i);
        },
      ),
    );
  }
}