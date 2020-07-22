import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data= {};

  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context).settings.arguments;
    print(data);

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
        body: SafeArea(
          child: Column(
            children: <Widget>[
              FlatButton.icon(
                onPressed: (){
                  Navigator.pushNamed(context, '/location');
                }, 
                icon: Icon(Icons.edit_location), 
                label: Text("Edit Location")
              )
            ],
          )
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: null,
          tooltip: "Add",
          child: Icon(Icons.add),),
      );
  }
}