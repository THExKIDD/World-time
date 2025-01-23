import 'package:duniya_time/pages/Choose_Location.dart';
import 'package:duniya_time/pages/Home.dart';
import 'package:duniya_time/pages/Loading.dart';
import 'package:flutter/material.dart';

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
