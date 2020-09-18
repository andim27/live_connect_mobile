import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ayas_mobile/app/modules/home/home_controller.dart';
import 'package:flutter/cupertino.dart';

class HomePage extends StatefulWidget {
  HomePage({this.title = 'AYAS demo'});

  final String title;

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  HomeController ctl = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: null, title: Center(child: Text(' AYAS '))),
      body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.deepPurple,
          child: Center(
              child: FlatButton(
                  color: Colors.pinkAccent,
                  onPressed: () => ctl.openRoomPage(),
                  child: Padding(
                    child: Text("Video Room"),
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                  )))),
    );
  }
}
