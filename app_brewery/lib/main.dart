import 'package:flutter/material.dart';

void main() {
  runApp(
   DevonApp()
  );
}

class DevonApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: Center(child: Text("I am Rich")),
          backgroundColor: Colors.black,
        ),
        bottomNavigationBar: Text("@copyright devonblackbeard"),
        body: Center(
//          child: Image(
//            image: AssetImage('images/diamond.jpg'),
//          ),
          child: Icon(Icons.add_alarm, color: Colors.black),
        ),
      ),
    );
  }
}
