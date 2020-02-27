import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:NinjaTime/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = 'loading';

  void setupWorldTime() async {
    WorldTime instance = WorldTime(location: 'cairo' , flag: 'egypt.png' , url: 'Africa/Cairo');
    await instance.getTime();
    Future.delayed(Duration(seconds: 5), (){
      Navigator.pushReplacementNamed(context, '/home' , arguments: {
        'location' : instance.location,
        'flag' : instance.flag,
        'time' : instance.time,
        'isDaytime' : instance.isDaytime,
      });
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: SafeArea(
        child: new Padding(
          padding: const EdgeInsets.fromLTRB(0, 250.0, 0, 0),
          child: new Column(
            children: <Widget>[
              new Text('XGroup' , style: new TextStyle(
                  color: Colors.white,
                  fontSize: 60.0,
                  fontFamily: 'Mai',
              ),),
              SizedBox(height: 20.0,),
              new SpinKitPouringHourglass(
                color: Colors.amber[300],
                size: 50.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
