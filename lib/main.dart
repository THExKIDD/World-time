import 'package:flutter/material.dart';
import 'package:world_time/pages/Home.dart';
import 'package:world_time/pages/Loading.dart';
import 'package:world_time/pages/Choose_Location.dart';
void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/home' : (context) => Home(),
      '/location' : (context) => ChooseLocation(),
    },
  ));
}
