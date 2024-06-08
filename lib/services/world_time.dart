import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  String? location;
  String? time;
  String? flag;
 late String? urll;
 late bool isDaytime;


  WorldTime({this.location,this.flag,this.urll});

  Future<void> get_time() async
  {
    try{
      Uri url = Uri.parse('http://worldtimeapi.org/api/timezone/$urll');
      Response response = await get(url);
      Map data = jsonDecode(response.body);

      String datetime = data['datetime'];
      String offset = data['utc_offset'];

      // Extract hours and minutes from the offset string
      int hours = int.parse(offset.substring(1, 3));
      int minutes = int.parse(offset.substring(4));

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: hours, minutes: minutes));
      isDaytime = now.hour>6 && now.hour<20 ? true : false;
      time = DateFormat.jm().format(now);
      // print(now);
    }
    catch (e)
    {
      print('caught error :$e');
      time='couldnt get time';
    }

  }
}
