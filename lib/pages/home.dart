import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
//    String rs = data.isNotEmpty ? 'have' : 'no have';
    print("POP2: $data");
    String bgImage = data['isDaytime']?'day.png':'night.png';
//    String bgImage = 'night.png';
    Color bgColor = data['isDaytime']?Colors.blue:Colors.indigo[700];
//    Color bgColor = Colors.indigo[700];
    print("Data from loading: $data");
    return Scaffold(
      backgroundColor: bgColor,
//      appBar: AppBar(
//        title: Text("WORLD TIME"),
//      ),
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
                    onPressed: () async {
                      dynamic result = Navigator.pushNamed(context, "/choose_location");
                      setState(() {
                        data = {};
//                        data = {
//                          "flag" : result['flag'],
//                          "time" : result['time'],
//                          "isDaytime" : result['isDaytime'],
//                          "location" : result['location']
//                        };
                      });
                    },
                    icon: Icon(Icons.edit_location),
                    label: Text("Edit location", style: TextStyle(color: Colors.grey[300]),)
                ),
                SizedBox(height: 20.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(data['location'], style: TextStyle(fontSize: 28.0, letterSpacing: 2.0, color: Colors.grey[300]),),
                  ],
                ),
                SizedBox(height: 20.0,),
                Text(data['time'], style: TextStyle(fontSize: 70.0, color: Colors.white),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
