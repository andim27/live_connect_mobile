import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
                  Container(
                      height: 100,
                      padding: EdgeInsets.all(10),
                      child: Obx(() => ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              for (var item in ctl.activeStreamUsers)
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: CircleAvatar(
                                      radius: 35,
                                      backgroundColor: Colors.purpleAccent,
                                      child: Text(
                                        item['name'],
                                        style: TextStyle(fontSize: 12),
                                      )),
                                ),
                            ],
                          ))),
                  Obx(() => (ctl.isLiveRoom == true)
                      ? Expanded(
                          child: Center(
                              child: Container(
                                  //--TODO: replace on Zoom container
                                  width: Get.width,
                                  height: 300,
                                  color: Colors.lightGreenAccent,
                                  child: Center(child: Text('Live stream')))))
                      : Expanded(
                          child: Center(
                            child: Chewie(
                              controller: chController,
                            ),
                          ),
                        )),
                  FlatButton(
                    onPressed: () {
                      ctl.openLiveRoom();
                    },
                    child: Text('Live Room'),
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
