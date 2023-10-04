import 'package:weather_flutter/models/Hour.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';
import 'dart:convert';

class PreService {
  final String UrlApi = 'dataservice.accuweather.com';
  final String Path = '/forecasts/v1/hourly/12hour/41442';
  final Map<String, String> Params = {
    'apikey': "bq3P2wGWVo3nCvQAGGUtSieWo19uF06U",
    'language': "pt-BR",
    'metric': "true"
  };

  Future<List<Hour>> RequestPrevision() async{
    final Response resp = await get(Uri.https(UrlApi, Path, Params));
    if(resp.statusCode == 200){
      Iterable it = json.decode(resp.body);
      List<Hour> previsions = List.from(
        it.map((objJson) => Hour.ChangeJSON(objJson))
      );
      return previsions;
    }else{
      throw Exception("Falha ao carregar as previsões");
    }
  }
}