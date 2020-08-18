
import 'package:flutter/material.dart';
import 'package:moic_world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locatoins = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Vientiane', location: 'Vientaine', flag: 'laos.png'),
  ];

  void updateTime(index) async {
    WorldTime instance = locatoins[index];
    await instance.getTime();
    Navigator.pushReplacementNamed(context,"/", arguments: {
      "location" : instance.location,
      "flag" : instance.flag,
      "time" : instance.time,
      "isDaytime" : instance.isDaytime
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose location time"),
        centerTitle: true,
        elevation: 5.0,
      ),
      body: ListView.builder(
          itemCount: locatoins.length,
          itemBuilder: (context, index){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0),
              child: Card(
                child: ListTile(
                  onTap: (){
                    updateTime(index);
                  },
                  title: Text(locatoins[index].location),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage("assets/${locatoins[index].flag}"),
                  ),
                ),
              ),
            );
          }
      ),
    );
  }
}
