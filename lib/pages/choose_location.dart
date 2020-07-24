import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  bool check = true;
  List<WorldTime> locations = [];

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
    var response = await http.get(url);
    dynamic data = jsonDecode(response.body);
    
    setState(() {
      for(var i=0;i<data.length;i++){
        // print(data[i]);
        String loc = data[i].toString();
        dynamic list = loc.split('/');
        locations.add(
          WorldTime(url: loc , location: list[list.length-1], flag: list[list.length-1][0])
        );
        check = false;
      }
    });
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
      body: check ? 
        Center(
          child: SpinKitCircle(
          color: Colors.blue,
          size: 50.0,
        ),
        )
      : ListView.builder(
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