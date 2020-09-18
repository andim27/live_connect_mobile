import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ayas_mobile/app/modules/rooms/room_controller.dart';
import 'package:chewie/chewie.dart';
import 'package:chewie/src/chewie_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:video_player/video_player.dart';

class RoomPage extends StatefulWidget {
  RoomPage({this.title = 'AYAS demo'});

  final String title;

  @override
  State<StatefulWidget> createState() {
    return _RoomPageState();
  }
}

class _RoomPageState extends State<RoomPage> {
  RoomController ctl = Get.put(RoomController());

  TargetPlatform _platform;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var chController = ctl.chewieController;
    return Scaffold(
      appBar: AppBar(title: Center(child: Text(' AYAS '))),
      body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Center(
                      child: Chewie(
                        controller: chController,
                      ),
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      ctl.playFullScreen();
                    },
                    child: Text('Fullscreen'),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: FlatButton(
                          onPressed: () {
                            setState(() {
                              ctl.playRoomVideo(1);
                            });
                          },
                          child: Padding(
                            child: Text("Room-1"),
                            padding: EdgeInsets.symmetric(vertical: 16.0),
                          ),
                        ),
                      ),
                      Expanded(
                        child: FlatButton(
                          onPressed: () {
                            setState(() {
                              ctl.playRoomVideo(2);
                            });
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 16.0),
                            child: Text("Room-2"),
                          ),
                        ),
                      )
                    ],
                  ),
                ]),
          )),
    );
  }
}
