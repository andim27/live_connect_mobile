import 'dart:async';
import 'dart:io';

import 'package:ayas_mobile/app/modules/livePageZoom/constants/api_keys.dart';
import 'package:ayas_mobile/app/modules/livePageZoom/live_page_zoom_controller.dart';
import 'package:ayas_mobile/app/ui/app_colors.dart';
import 'package:ayas_mobile/app/widgets/progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_plugin/zoom_options.dart';
import 'package:flutter_zoom_plugin/zoom_view.dart';
import 'package:get/get.dart';

class NoLoginMeeting extends StatelessWidget {
  ZoomOptions zoomOptions;
  ZoomMeetingOptions meetingOptions;

  Timer timer;

  NoLoginMeeting({Key key, meetingId}) : super(key: key) {
    this.zoomOptions = new ZoomOptions(
      domain: "zoom.us",
      appKey: APIKEYS.zoomApiKey, // Replace with with key got from the Zoom Marketplace
      appSecret: APIKEYS.zoomApiSecret, // Replace with with key got from the Zoom Marketplace
    );
    this.meetingOptions = new ZoomMeetingOptions(
      userId: APIKEYS.zoomUserID, // Replace with the user email or Zoom user ID
      displayName: 'AZ Ackmatoff',
      meetingId: "3192165749",
      // meetingPassword: "BTm6Q4",
      zoomAccessToken: APIKEYS.zoomZAKtoken, // Replace with the token obtained from the Zoom API
      zoomToken: APIKEYS.zoomUserToken, // Replace with the token obtained from the Zoom API
      disableDialIn: "true",
      disableDrive: "true",
      disableInvite: "true",
      disableShare: "true",
      noAudio: "false",
      noDisconnectAudio: "false",
    );
  }

  bool _isMeetingEnded(String status) {
    var result = false;

    if (Platform.isAndroid)
      result = status == "MEETING_STATUS_DISCONNECTING" || status == "MEETING_STATUS_FAILED";
    else
      result = status == "MEETING_STATUS_IDLE";

    return result;
  }

  LivePageZoomController livePageZoomController = Get.put(LivePageZoomController());

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorBranding.purpleDark,
        title: Text(
          'Loading meeting...',
          style: TextStyle(color: ColorBranding.white),
        ),
      ),
      body: Column(
        children: [
          linearProgress(),
          Expanded(
            child: ZoomView(onViewCreated: (controller) {
              print("Created the view");

              controller.initZoom(this.zoomOptions).then((results) {
                print("initialised");
                print(results);

                if (results[0] == 0) {
                  controller.zoomStatusEvents.listen((status) {
                    if (status[1] == "No meeting is running") {
                      livePageZoomController.updateIsLiveBool(false);
                      print("isLive FALSE: " + livePageZoomController.isLiveRx.value.toString());
                    }

                    print("Meeting Status Stream: " + status[0] + " - " + status[1]);
                    if (_isMeetingEnded(status[0])) {
                      Navigator.pop(context);
                      timer?.cancel();
                    }
                  });

                  print("listen on event channel");

                  controller.startMeeting(this.meetingOptions).then((joinMeetingResult) {
                    timer = Timer.periodic(new Duration(seconds: 2), (timer) {
                      controller.meetingStatus(this.meetingOptions.meetingId).then((status) {
                        if (status[0] == "MEETING_STATUS_INMEETING") {
                          livePageZoomController.updateIsLiveBool(true);
                          print("isLive TRUE: " + livePageZoomController.isLiveRx.value.toString());
                        }

                        print("Meeting Status Polling: " + status[0] + " - " + status[1]);
                      });
                    });
                  });
                }
              }).catchError((error) {
                print("Error");
                print(error);
              });
            }),
          ),
        ],
      ),
    );
  }
}
