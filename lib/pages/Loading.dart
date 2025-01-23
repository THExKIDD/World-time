import 'package:flutter/material.dart';

import '../services/world_time.dart';


class Loading extends StatefulWidget {


  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


  void setUpworldtime() async
  {
    WorldTime instance = WorldTime(location: 'Kolkata', flag: 'India.png', urll: 'Asia/Kolkata');
    await instance.get_time();


    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });

  }


  @override
  void initState() {

    super.initState();
    setUpworldtime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child : CircularProgressIndicator()
      ),
    );
  }
}
