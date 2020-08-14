import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void getVientianeTime() async{
    Response response = await get("http://worldtimeapi.org/api/timezone/Asia/Vientiane");
    Map vientianeTime = jsonDecode(response.body);

    String datetime1 = vientianeTime['datetime'].substring(0,10);
    String datetime2 = vientianeTime['datetime'].substring(11, 16);
    print(vientianeTime['datetime']);
    print(datetime1);
    print(datetime2);
    String datetime = datetime1 + " " + datetime2;
    print(datetime);

    DateTime now = DateTime.parse(datetime);
    print(now);

//    print(vientianeTime);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getVientianeTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WORLD TIME"),
      ),
    );
  }
}
