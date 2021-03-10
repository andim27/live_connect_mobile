import 'package:live_connect_mobile/app/modules/home/home_controller.dart';
import 'package:live_connect_mobile/app/services/api_client_srv.dart';
import 'package:live_connect_mobile/app/ui/app_colors.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LivePageZoom extends StatefulWidget {
  LivePageZoom({Key key}) : super(key: key);

  @override
  _LivePageZoomState createState() => _LivePageZoomState();
}

class _LivePageZoomState extends State<LivePageZoom> {
  HomeController ctl = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: null, title: Center(child: Text(' AYAS '))),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: ColorBranding.purpleDarkest,
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FlatButton(
                color: ColorBranding.orangeLight,
                onPressed: () => ctl.openMeetingRoom(),
                child: Padding(
                  child: Text("Get from API"),
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                ),
              ),
              FlatButton(
                color: ColorBranding.orangeLight,
                onPressed: () => ctl.openStartMeeting(),
                child: Padding(
                  child: Text("Start meeting"),
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                ),
              ),
              FlatButton(
                color: ColorBranding.orangeLight,
                onPressed: () => ctl.openJoinMeeting(),
                child: Padding(
                  child: Text("Join meeting"),
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  getFromApi() async {
    var response = await ApiClient().connectStreamRooms(1, true);
    print("response $response");
  }
}
