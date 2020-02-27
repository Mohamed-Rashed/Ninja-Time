import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(new MaterialApp(
    home: new Home(),
  ));
}

class Home extends StatefulWidget{

  @override
  _State createState() => new _State();
}

class _State extends State<Home>{

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    print(data);

    String image = data['isDaytime'] ? 'day.jpeg' : 'night.jpeg' ;
    Color mm = data['isDaytime'] ? Colors.black  : Colors.white;
    Color m = data['isDaytime'] ? Colors.blue  : Colors.blue[700];

    return new Scaffold(
      backgroundColor: m,
      body: new SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$image'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
            child: new Column(
              children: <Widget>[
                new FlatButton.icon(onPressed: () async{
                  dynamic r = await Navigator.pushNamed(context, '/location');
                  setState(() {
                    data = {
                      'time' : r['time'],
                      'location' : r['location'],
                      'isDaytime' : r['isDaytime'],
                      'flag' : r['flag'],
                    };
                  });
                }, icon: Icon(Icons.edit_location , color: mm,), label: new Text('Edit Location' , style: TextStyle(
                  color: mm,
                ),)),
                SizedBox(height: 20.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(data['location'] , style:
                      TextStyle(
                        color: mm,
                       fontSize: 28.0,
                       letterSpacing: 2.0,
                      ),),
                  ],
                ),
                SizedBox(height: 20.0,),
                Text(
                  data['time'],
                  style: new TextStyle(
                    fontSize: 66.0,
                    color: mm
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}