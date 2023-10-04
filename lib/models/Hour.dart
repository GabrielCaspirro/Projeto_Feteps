class Hour{
  final String horario;
  final String desc;
  final int NumIcone;
  final double temp;

  Hour(
    this.horario,
    this.desc, 
    this.NumIcone, 
    this.temp,
  );

  factory Hour.ChangeJSON(Map<String, dynamic> objJson){
    return Hour(
      Hour.ChangeStringHour(objJson['DateTime']),
      objJson['IconPhrase'],
      objJson['WeatherIcon'],
      objJson['Temperature']['Value']
    );
  }

  static String ChangeStringHour(String str){
    return str != null ? str.split('T')[1].substring(0, 5) : '';
  }
}