import 'dart:convert';
import 'package:http/http.dart' as http;

class WorldTime { 
  
  String location,time,flag,url;

  WorldTime({this.location,this.flag,this.url});

  Future<void> getTime() async {
    
    try{
      var response = await http.get('http://worldtimeapi.org/api/timezone/$url');
    Map data = jsonDecode(response.body);
    
    // print(data);
    String datetime = data['datetime']; 
    String offset = data['utc_offset'].substring(1,3); 
    // print(datetime);
    // print(offset);

    DateTime now = DateTime.parse(datetime);
    now  = now.add(Duration(hours : int.parse(offset)));

    time = now.toString();
    // print(time);
    }
    catch(e){
      print('error : $e');
      time = 'Could not get time data';
    }
  }

}

