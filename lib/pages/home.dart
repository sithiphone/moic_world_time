import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

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
    data = ModalRoute.of(context).settings.arguments;
    String bgImage = data['isDaytime']?'day.png':'night.png';

    print("Data from loading: $data");
    return Scaffold(
      appBar: AppBar(
        title: Text("WORLD TIME"),
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/$bgImage"),
              fit: BoxFit.cover
            ),
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(0.0, 120.0, 0.0, 0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FlatButton.icon(
                    onPressed: (){

                    },
                    icon: Icon(Icons.edit_location),
                    label: Text("Edit location")
                ),
                SizedBox(height: 20.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(data['location'], style: TextStyle(fontSize: 28.0, letterSpacing: 2.0),),
                  ],
                ),
                SizedBox(height: 20.0,),
                Text(data['time'], style: TextStyle(fontSize: 70.0),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
