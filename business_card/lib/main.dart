import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(BusinessCard());

class BusinessCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SafeArea(
        minimum: EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          CircleAvatar(
            radius: 60.0,
            backgroundImage: AssetImage('images/devon.PNG'),
          ),
            Container(
              height: 40,
              margin: EdgeInsets.fromLTRB(9, 18, 9, 9),
              child: Text('DEVON BLACKBEARD',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Yellowtail',
                      fontSize: 23)
              ),
            ),
            Container(
              child: Text(
                'FLUTTER DEVELOPER',
                style: TextStyle(
                    color: Colors.white, backgroundColor: null, fontSize: 16),
              ),
            ),
            Row(
                children: <Widget>
                [
                  Expanded(
                      child: Divider(thickness: 1, color: Colors.white, indent: 60, endIndent: 60,)
                  ),
                ]
            ),
            Container(
              padding: EdgeInsets.fromLTRB(30, 12, 12, 12),
              color: Colors.white,
              width: 400,
              height: 50,
              margin: EdgeInsets.fromLTRB(12, 30, 9, 9),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.email,
                    size: 28,
                    color: Colors.orange,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Text(
                      'Email: devon.blackbeard@gmail.com',
                      style: TextStyle(fontFamily: 'Raleway', fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(30, 9, 12, 12),
              color: Colors.white,
              width: 400,
              height: 50,
              margin: EdgeInsets.fromLTRB(12, 0, 9, 9),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.phone,
                    size: 28,
                    color: Colors.orange,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Text(
                      'Phone: 403 681 3191',
                      style: TextStyle(fontFamily: 'Raleway', fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
