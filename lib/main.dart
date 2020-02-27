import 'package:NinjaTime/pages/choose_location.dart';
import 'package:NinjaTime/pages/loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'pages/home.dart';
import 'pages/loading.dart';
import 'pages/choose_location.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/' : (context) => Loading(),
    '/home' : (context) => Home(),
    '/location' : (context) => ChooseLocation(),
  },
));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: new Text('Mohamed Rashed C.V'),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
        elevation: 0.0,
      ),
      body: new Padding(
          padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Center(
              child: new CircleAvatar(
                backgroundImage: new AssetImage('assets/imgme.jpg'),
                radius: 40.0,
              ),
            ),
            new Divider(
              height: 60.0,
              color: Colors.blue[400],
            ),

            new Text('Name', style: new TextStyle(
              color: Colors.grey,
              letterSpacing: 2.0,
            ),),
            SizedBox(height: 10.0),
            new Text('Mohamed Rashed' , style: new TextStyle(
              color: Colors.amberAccent,
              letterSpacing: 2.0,
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
            ),),
            SizedBox(height: 30.0,),

            ///////////////////////
            new Text('Mobile:', style: new TextStyle(
              color: Colors.grey,
              letterSpacing: 2.0,
            ),),
            SizedBox(height: 10.0),
            new Text('Native Android ( Java ) , Cross Platform ( Flutter )' , style: new TextStyle(
              color: Colors.amberAccent,
              letterSpacing: 2.0,
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
            ),),
            SizedBox(height: 30.0,),
            ///////////////////////////
            new Row(
              children: <Widget>[
                new Icon(Icons.email, color: Colors.grey[400],),
                SizedBox(width: 10.0,),
                new Text('mohamedrashed88@gmail.com' , style: new TextStyle(
                  color: Colors.grey[400],
                  letterSpacing: 1.0,
                  fontSize: 15.0,
                ),)
              ],
            ),
            SizedBox(height: 30.0,),
            Center(
              child: new RaisedButton(onPressed:() {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home() ),
                );},
                child: new Text('Next Page' , style: new TextStyle(
                  color: Colors.blue[400],
                ),),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

