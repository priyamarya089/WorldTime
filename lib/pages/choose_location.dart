import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'L'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'B'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'C'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'N'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'C'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'N'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'S'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'J'),
  ];

  void updateTime(index) async {
    await locations[index].getTime();
    Navigator.pop(context, {
      'location': locations[index].location,
      'time': locations[index].time,
      'flag': locations[index].flag,
      'isDaytime': locations[index].isDaytime,
    });
  }

  @override
  void initState() {
        super.initState();
        getData();
  }

      
    
  Future<void> getData() async {
    var url = 'http://worldtimeapi.org/api/timezone';
    var response = await http.get('http://worldtimeapi.org/api/timezone/$url');
    Map data = jsonDecode(response.body);
    
    print(data);
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  child: Text(locations[index].flag),
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}