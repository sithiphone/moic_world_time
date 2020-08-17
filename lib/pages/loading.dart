import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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
      'time' : world_time.time,
      'isDaytime' : world_time.isDaytime
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
      backgroundColor: Colors.blue[900],
      appBar: AppBar(
        title: Text("Vientiane time"),
      ),
      body: Center(
        child: SpinKitPouringHourglass(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
