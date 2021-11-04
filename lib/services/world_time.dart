import 'package:http/http.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WorldTime {

  String time;
  String location;
  String flag;
  String url;
  bool isDayTime;

  WorldTime({this.location,this.url,this.flag});

  Future<void> getTime() async
  {
    Response response= await get('http://worldtimeapi.org/api/timezone/$url');
    Map data=jsonDecode(response.body);
    String datetime=data['utc_datetime'];
    String offset=data['utc_offset'].substring(1,3);
//    print(datetime);
//    print(offset);

    DateTime now=DateTime.parse(datetime);
    now=now.add(Duration(hours:int.parse(offset)));
    isDayTime=now.hour>6&& now.hour<20? true:false;
    time=DateFormat.jm().format(now);


  }


}