import 'package:flutter/material.dart';
import 'package:moic_world_time/services/world_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = "Loading...";

  void setupWorldTime() async{
    WorldTime world_time = new WorldTime(location: 'Vientiane', flag: 'lo.png', url: 'Asia/Vientiane');
    await world_time.getTime();
    Navigator.pushReplacementNamed(context, "/", arguments: {
      'location' : world_time.location,
      'flag' : world_time.flag,
      'time' : world_time.time
    });
    setState(() {
      time = world_time.time;
    });

    print("Current time: $time");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setupWorldTime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vientiane time"),
      ),
      body: Padding(
        padding: EdgeInsets.all(50.0),
        child: Text(time, style: TextStyle(fontSize: 40.0, color: Colors.blue),),
      ),
    );
  }
}
