import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data= {};

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    print('data');
    print(data);

    String bgImage = data['isDaytime'] ? 'day.jpeg' : 'night.jpeg';
    print(bgImage);

    return Scaffold(
        // appBar: AppBar(
        //   // leading: Center(child: Text("icon")),
        //   title: Text("ShowTime"),
        //   actions: <Widget>[
        //     IconButton(
        //       icon: Icon(Icons.search,color: Colors.white),
        //       tooltip: "Search",
        //       onPressed: null),
        //     IconButton(
        //       icon: Icon(Icons.notifications,color: Colors.white),
        //       tooltip: "Notification", 
        //       onPressed: null),
        //   ],
        // ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/$bgImage'),
              fit: BoxFit.cover,
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0,100.0,0,0),
            child: Column(
              children: <Widget>[
                FlatButton.icon(
                  onPressed: () async {
                    dynamic result = await  Navigator.pushNamed(context, '/location');
                    setState(() {
                      data ={
                        'time' : result['time'],
                        'location' : result['location'],
                        'flag' : result['flag'],
                        'isDaytime' : result['isDaytime'],
                      };
                    });
                  }, 
                  icon: Icon(
                    Icons.edit_location,
                    // color: Colors.white,
                  ), 
                  label: Text("Edit Location")
                ),
                SizedBox(height: 20.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 28.0,
                        letterSpacing: 2.0
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20.0,),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 60.0,
                  ),
                )
              ],
            ),
          ),
        ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: null,
        //   tooltip: "Add",
        //   child: Icon(Icons.add),),
      );
  }
}