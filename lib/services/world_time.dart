import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime{
  String location, time, flag, url;
  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async{
    try{
      Response response = await get("http://worldtimeapi.org/api/timezone/$url");
      Map vientianeTime = jsonDecode(response.body);
      String datetime1 = vientianeTime['datetime'].substring(0,10);
      String datetime2 = vientianeTime['datetime'].substring(11, 16);
      String datetime = datetime1 + " " + datetime2;

      String offset = vientianeTime['utc_offset'].substring(1,3);
      DateTime now = DateTime.parse(datetime);
      now.add(Duration(hours: int.parse(offset)));
      time = DateFormat.jm().format(now);
//      time = now.toString();
    }catch(e){
      print("Error: $e");
    }
  }
}