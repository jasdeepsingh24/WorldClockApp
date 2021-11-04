import 'package:flutter/material.dart';
import 'package:worldtimeapp/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {


    List<WorldTime> locations=[
    WorldTime(location:'Berlin',url:'Europe/Berlin',flag:'germany.png'),
    WorldTime(location:'India',url:'Asia/Kolkata',flag:'india.png'),
    WorldTime(location:'New York',url:'America/New_York',flag:'america.png'),
    WorldTime(location:'Chicago',url:'America/Chicago',flag:'america.png'),
    WorldTime(location:'London',url:'Europe/London',flag:'england.png'),
    WorldTime(location:'Jakarta',url:'Asia/Jakarta',flag:'indonesia.png'),



    ];

    void updateTime(index) async{
      WorldTime instance=locations[index];
      await instance.getTime();

      Navigator.pop(context,{
        'location':instance.location,
        'time':instance.time,
        'flag':instance.flag,
        'isDayTime':instance.isDayTime,
      });


    }

  @override

  Widget build(BuildContext context) {
    print('build state');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar:AppBar(
        backgroundColor:Colors.blue[900],
        title:Text('Choose Location'),
        centerTitle:true,
        elevation:0,
      ),
      body:ListView.builder(
        itemCount: locations.length,
        itemBuilder:(context,index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical:1,horizontal:4),
            child: Card(
              child:ListTile(
                onTap:(){
                updateTime(index);
                },
                title:Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage:AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },

      ),


    );
  }
}
