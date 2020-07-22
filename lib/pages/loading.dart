import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time = "Loading";

  Future<void> setupWorldTime() async {
    WorldTime obj = WorldTime(location : 'Berlin', flag :'',url :'Europe/Berlin');
    await obj.getTime();
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'location' : obj.location,
      'flag' : obj.flag,
      'time' : obj.time,
     });
    // setState(() {
    //   time = obj.time;
    // });
  }

  @override
  void initState(){
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Loading...')),
    );
  }
}