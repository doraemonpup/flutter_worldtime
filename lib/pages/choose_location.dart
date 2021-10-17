import 'package:flutter/material.dart';

import '../services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(
      url: 'America/Argentina/Buenos_Aires',
      location: 'Buenos Aires',
      flag: 'images/argentina.png',
    ),
    WorldTime(
      url: 'Australia/Sydney',
      location: 'Sydney',
      flag: 'images/australia.png',
    ),
    WorldTime(
      url: 'America/Sao_Paulo',
      location: 'Rio de Janeiro',
      flag: 'images/brazil.png',
    ),
    WorldTime(
      url: 'America/Toronto',
      location: 'Totonto',
      flag: 'images/canada.png',
    ),
    WorldTime(
      url: 'Africa/Cairo',
      location: 'Cairo',
      flag: 'images/egypt.png',
    ),
    WorldTime(
      url: 'Europe/London',
      location: 'London',
      flag: 'images/england.png',
    ),
    WorldTime(
      url: 'Europe/Berlin',
      location: 'Berlin',
      flag: 'images/germany.png',
    ),
    WorldTime(
      url: 'Europe/Dublin',
      location: 'Dublin',
      flag: 'images/ireland.png',
    ),
    WorldTime(
      url: 'Asia/Tokyo',
      location: 'Tokyo',
      flag: 'images/japan.png',
    ),
    WorldTime(
      url: 'Europe/Amsterdam',
      location: 'Amsterdam',
      flag: 'images/netherlands.png',
    ),
    WorldTime(
      url: 'Asia/Seoul', // south korea capital
      location: 'Pyongyang',
      flag: 'images/northkorea.png',
    ),
    WorldTime(
      url: 'Europe/Oslo',
      location: 'Oslo',
      flag: 'images/norway.png',
    ),
    WorldTime(
      url: 'Europe/Moscow',
      location: 'Moscow',
      flag: 'images/russia.png',
    ),
    WorldTime(
      url: 'Asia/Riyadh',
      location: 'Riyadh',
      flag: 'images/saudiarabia.png',
    ),
    WorldTime(
      url: 'Africa/Johannesburg',
      location: 'Johannesburg',
      flag: 'images/southafrica.png',
    ),
    WorldTime(
      url: 'Asia/Bangkok',
      location: 'Bangkok',
      flag: 'images/thailand.png',
    ),
    WorldTime(
      url: 'Africa/Tunis',
      location: 'Tunis',
      flag: 'images/tunisia.png',
    ),
    WorldTime(
      url: 'Europe/Istanbul',
      location: 'Istanbul',
      flag: 'images/turkey.png',
    ),
    WorldTime(
      url: 'America/Los_Angeles',
      location: 'San Francisco',
      flag: 'images/usa.png',
    ),
    WorldTime(
      url: 'America/New_York',
      location: 'New York',
      flag: 'images/usa.png',
    )
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    // navigate to home screen
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          backgroundColor: Colors.blue.shade900,
          title: Text('Choose a Location'),
          centerTitle: true,
          elevation: 0,
        ),
        body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
              child: Card(
                child: ListTile(
                  onTap: () {
                    updateTime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/${locations[index].flag}'),
                  ),
                ),
              ),
            );
          },
        ));
  }
}
