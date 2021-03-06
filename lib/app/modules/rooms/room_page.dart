import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:live_connect_mobile/app/modules/rooms/room_controller.dart';
import 'package:chewie/chewie.dart';
import 'package:chewie/src/chewie_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:video_player/video_player.dart';
import 'package:live_connect_mobile/app/ui/app_colors.dart';
import 'package:live_connect_mobile/app/modules/home/widgets/title_text.dart';

class RoomPage extends StatefulWidget {
  RoomPage({this.title = 'AYAS demo', this.roomId});

  final String title;
  final String roomId;

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

  // @override
  // void dispose() {
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    var chController = ctl.chewieController;
    ctl.roomId = this.widget.roomId;
    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(
            icon: new Icon(Icons.arrow_back), onPressed: () => ctl.backPage()),
        title: Center(child: Text(' AYAS room:' + this.widget.roomId)),
        backgroundColor: ColorBranding.purpleDarkest,
      ),
      body: Container(
          width: double.infinity,
          height: double.infinity,
          color: ColorBranding.purpleDark,
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
                  //--connected room----
                  SizedBox(height: 10),
                  (ctl.isRoomConnected)
                      ? Icon(Icons.visibility, color: Colors.green)
                      : Icon(Icons.visibility_off, color: Colors.redAccent),
                  SizedBox(height: 10),
                  FlatButton(
                    onPressed: () {
                      ctl.openLiveRoom();
                    },
                    color: Colors.white,
                    child: Text('Live Room'),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: FlatButton(
                          onPressed: () {
                            setState(() {
                              ctl.playRoomVideo(int.parse(this.widget.roomId));
                            });
                          },
                          child: Padding(
                            child: Text("Room-" + this.widget.roomId,
                                style: TextStyle(color: Colors.white)),
                            padding: EdgeInsets.symmetric(vertical: 16.0),
                          ),
                        ),
                      ),
                      // Expanded(
                      //   child: FlatButton(
                      //     onPressed: () {
                      //       setState(() {
                      //         ctl.playRoomVideo(2);
                      //       });
                      //     },
                      //     child: Padding(
                      //       padding: EdgeInsets.symmetric(vertical: 16.0),
                      //       child: Text("Room-2", style: TextStyle(color: Colors.white)),
                      //     ),
                      //   ),
                      // )
                    ],
                  ),
                ]),
          )),
    );
  }
}
