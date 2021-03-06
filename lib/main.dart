import 'package:flutter/material.dart';
import 'package:moic_world_time/pages/choose_location.dart';
import 'package:moic_world_time/pages/home.dart';
import 'package:moic_world_time/pages/loading.dart';

void main() => runApp(MaterialApp(
  initialRoute: "/loading",
  routes: {
    "/" : (context) => Home(),
    "/loading" : (context) => Loading(),
    "/choose_location" : (context) => ChooseLocation(),
  },
));