import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:worldtimeapp/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time='loading';

  void SetupWorldTIme() async{

    WorldTime instance=WorldTime(location:'Berlin',url:'Europe/Berlin',flag:'germany.png');
    await instance.getTime();
    Navigator.pushNamed(context,'/home', arguments: {
    'location':instance.location,
    'time':instance.time,
    'flag':instance.flag,
      'isDayTime':instance.isDayTime,
    });
    setState(() {
      time=instance.time;
    });



}

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SetupWorldTIme();

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      backgroundColor: Colors.blue[900],
      body:Center(
          child:SpinKitChasingDots(
            color: Colors.black45,
            size: 80.0,
          ),
      ),
    );
  }
}
