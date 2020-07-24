import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time = "Loading";

  Future<void> setupWorldTime() async {
    WorldTime obj = WorldTime(location : 'Berlin', flag :'B',url :'Europe/Berlin');
    await obj.getTime();
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'location' : obj.location,
      'flag' : obj.flag,
      'time' : obj.time,
      'isDaytime' : obj.isDaytime,
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
      backgroundColor: Colors.blue,
      body: Center(
        child: SpinKitCircle(
          color: Colors.white,
          size: 50.0,
        )
        // child: SpinKitCircle(
        //   color: Colors.white,
        //   size: 50.0,
        // )
      ),
    );
  }
}