import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';


class Loading extends StatefulWidget {


  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void get_time() async
  {
    Uri url = Uri.parse('http://worldtimeapi.org/api/timezone/Asia/Kolkata');
    Response response= await get(url);
    Map data = jsonDecode(response.body);

    String datetime = data['datetime'];
    String offset = data['utc_offset'];

    // Extract hours and minutes from the offset string
    int hours = int.parse(offset.substring(1, 3));
    int minutes = int.parse(offset.substring(4));

    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: hours, minutes: minutes));
    print(now);
  }



  @override
  void initState() {

    super.initState();
    get_time();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Loading'),
    );
  }
}
