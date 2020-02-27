import 'package:NinjaTime/services/world_time.dart';
import 'package:flutter/material.dart';


class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> location = [
    WorldTime(url: 'Europe/London' , location: 'London' , flag: 'lo.jpg'),
    WorldTime(url: 'Europe/Berlin' , location: 'Athens' , flag: 'gr.png'),
    WorldTime(url: 'Africa/Cairo' , location: 'Cairo' , flag: 'eg.png'),
    WorldTime(url: 'Africa/Nairobi' , location: 'Nairobi' , flag: 'ke.png'),
    WorldTime(url: 'Asia/Riyadh' , location: 'Riyadh' , flag: 'sa.png'),
    WorldTime(url: 'America/New_York' , location: 'New York' , flag: 'ny.png'),
    WorldTime(url: 'Asia/Seoul' , location: 'Seoul' , flag: 'ko.png'),
    WorldTime(url: 'America/Lima' , location: 'Lima' , flag: 'pe.png'),

  ];
  void updateTime(index) async{
    WorldTime instance = location[index];
    await instance.getTime();
    Navigator.pop(context,{
      'location' : instance.location,
      'flag' : instance.flag,
      'time' : instance.time,
      'isDaytime' : instance.isDaytime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose Location'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView.builder(
        itemCount: location.length,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0 , horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(location[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${location[index].flag}'),
                ),
              ),
            ),
          );
        } ,
      ),
    );
  }
}
