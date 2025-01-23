import 'package:flutter/material.dart';

import '../services/world_time.dart';


class ChooseLocation extends StatefulWidget {


  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {


  List<WorldTime> locations = [
    WorldTime(urll: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(urll: 'Europe/Athens', location: 'Athens', flag: 'greece.png'),
    WorldTime(urll: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(urll: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(urll: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(urll: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(urll: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(urll: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
    WorldTime(urll: 'Asia/Kolkata', location: 'Kolkata', flag: 'india.jpg'),
  ];

  void updateTime(int index) async
  {
    WorldTime loinstance =locations[index];
    await loinstance.get_time();
    Navigator.pop(context, {
      'location': loinstance.location,
      'flag': loinstance.flag,
      'time': loinstance.time,
      'isDaytime': loinstance.isDaytime,
    });
  }

  @override
  Widget build(BuildContext context) {
    print('build function ran');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0,horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: (){
                  updateTime(index);

                },
                title: Text(
                  locations[index].location ?? "Default location",

                ),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
