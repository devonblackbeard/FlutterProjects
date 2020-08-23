import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';
//import 'package:carousel_slider/carousel_slider.dart';
//import 'carouselView.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Capstone App',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'LA Auto Detail'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List imageData;
  String urlpath = "http://api.opendota.com/api/heroStats";

  Future<String> getData() async {
    var response = await http.get(
        Uri.encodeFull(urlpath),
        headers: {"Accept": "application/json"});

    setState(() {
      imageData = json.decode(response.body);
    });
    return "success";
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.title)
      ),
      body: buildListView(),
    );
  }

  Widget buildListView()
  {
    return ListView.builder(
        padding: const EdgeInsets.all(0),
        itemCount: imageData == null ? 0 : imageData.length,
        itemBuilder: (context,index)
        {
          return buildImageColumn(imageData[index]);
        });
  }

  Widget buildImageColumn(dynamic item) => Container(
    decoration: BoxDecoration(color: Colors.purple),
    margin: const EdgeInsets.fromLTRB(0, 3, 0, 6),
    child: Column(
      children: [
        new CachedNetworkImage(
          //imageUrl: item['img']+ "/"+urlpath ,
          imageUrl: "https://api.opendota.com" + item['img'],
          placeholder: (context, url) => new CircularProgressIndicator(),
          errorWidget: (context, url, error) => new Icon(Icons.error),
          fadeOutDuration: new Duration(seconds: 2),
          fadeInDuration: new Duration(seconds: 4),
        ),
        buildRow(item)
      ],
    ),
  );

  Widget buildRow(dynamic item) {
    return ListTile(
        title: Align(
          child: new Text(
              item['localized_name'] == null ? '' : item['localized_name']),
          alignment: Alignment(0, 0),
        ),
        onTap: () {
          showDialog(
              context: context,
              child: new AlertDialog(
                titlePadding: new EdgeInsets.symmetric(vertical: 2.0, horizontal: 2),
                // contentPadding: EdgeInsets.fromLTRB(12,0,32,0),
                elevation: 50.0,
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(18)
                ),
                backgroundColor: Colors.lightGreen,
                title: new Column(
                  children: <Widget>[
                    new Text("You clicked:", ),
                  ],
                ),
                content: new Text(item['localized_name']),
                actions: <Widget>[
                  new FlatButton(
//                  onPressed: () {
//                    Navigator.push(
//                      context,
//                      MaterialPageRoute(
//                        builder: (context) => DetailScreen(
//                            name: item['name'],
//                            attackType: item['attack_type']),
//                      ),
//                    );
//                  },
//                  child: new Text('OK'),
                  ),
                ],
              ));
        });
  }


  @override
  void initState() {
    super.initState();
    // Call the getData() method when the app initializes
    this.getData();
  }
}