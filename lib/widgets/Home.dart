import 'package:flutter/material.dart';
import 'package:weather_flutter/widgets/Resume.dart';
import 'package:weather_flutter/models/Hour.dart';
import 'package:weather_flutter/services/PreService.dart';
import 'package:weather_flutter/widgets/Next_Pre.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home>{
  late Future<List<Hour>> LastPrevisions;

  @override
  void initState() {
    super.initState();
    carregar();
  }

  void carregar(){
    PreService service = PreService();
    LastPrevisions = service.RequestPrevision();
  }

  Future<Null> Atualizar() async {
    setState(() => carregar());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather App"),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: Atualizar,
        child: Center(
          child: FutureBuilder<List<Hour>>(
            future: LastPrevisions,
            builder: (context, snapshot){
              if(snapshot.hasData){
                List<Hour> previsoes = snapshot.data!;
                double tempAtual = previsoes[0].temp;
                double minTemp = double.maxFinite;
                double maxTemp = double.negativeInfinity;
                previsoes.forEach((obj){ 
                    if(obj.temp < minTemp){
                      minTemp = obj.temp;
                    }
                    if(obj.temp > maxTemp){
                      maxTemp = obj.temp;
                    }
                  }
                );
                String descricao = previsoes[0].desc;
                int num = previsoes[0].NumIcone;
                return Column(
                    children: [
                      Resume(
                        cidade: "Ribeirão Pires",
                        desc: descricao,
                        tempAtual: tempAtual,
                        tempMax: maxTemp,
                        tempMin: minTemp,
                        icone: num,
                      ),
                      Padding(padding: EdgeInsets.all(10)),
                      Next_Pre(
                        Previsions: previsoes.sublist(1, previsoes.length),
                      )
                  ]
                );
              }else if(snapshot.hasError){
                return Text("Erro ao carregar as previsões");
              }
              return CircularProgressIndicator();
            },
          )
        ),
      )
    );
  }
}