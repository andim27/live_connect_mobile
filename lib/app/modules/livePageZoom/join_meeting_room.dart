import 'dart:async';
import 'dart:io';

import 'package:live_connect_mobile/app/modules/livePageZoom/constants/api_keys.dart';
import 'package:live_connect_mobile/app/ui/app_colors.dart';
import 'package:live_connect_mobile/app/widgets/progress_indicator.dart';
import 'package:flutter_zoom_plugin/zoom_view.dart';
import 'package:flutter_zoom_plugin/zoom_options.dart';

import 'package:flutter/material.dart';

class JoinMeetingRoom extends StatelessWidget {
  ZoomOptions zoomOptions;
  ZoomMeetingOptions meetingOptions;

  Timer timer;

  JoinMeetingRoom({Key key, meetingId, meetingPassword}) : super(key: key) {
    this.zoomOptions = new ZoomOptions(
      domain: "zoom.us",
      appKey: APIKEYS.zoomApiKey,
      appSecret: APIKEYS.zoomApiSecret,
    );
    this.meetingOptions = new ZoomMeetingOptions(
        userId: APIKEYS.zoomUserID,
        meetingId: meetingId,
        meetingPassword: meetingPassword,
        disableDialIn: "true",
        disableDrive: "true",
        disableInvite: "true",
        disableShare: "true",
        noAudio: "false",
        noDisconnectAudio: "false");
  }

  bool _isMeetingEnded(String status) {
    var result = false;

    if (Platform.isAndroid) {
      result = status == "MEETING_STATUS_DISCONNECTING" ||
          status == "MEETING_STATUS_FAILED";
      print("result in Meeting Room $result");
    } else {
      result = status == "MEETING_STATUS_IDLE";
      print("result in Meeting Room Else $result");
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorBranding.purpleDark,
        title: Text(
          'Loading meeting ',
          style: TextStyle(color: ColorBranding.white),
        ),
      ),
      body: Column(
        children: [
          linearProgress(),
          Expanded(child: ZoomView(onViewCreated: (controller) {
            print("Created the view");

            controller.initZoom(this.zoomOptions).then((results) {
              print("initialised");
              print("Results in ZoomView Widget " + results.toString());

              if (results[0] == 0) {
                controller.zoomStatusEvents.listen((status) {
                  print("Meeting Status Stream: " +
                      status[0] +
                      " - " +
                      status[1]);
                  if (_isMeetingEnded(status[0])) {
                    Navigator.pop(context);
                    timer?.cancel();
                  }
                });

                print("listen on event channel");

                controller
                    .joinMeeting(this.meetingOptions)
                    .then((joinMeetingResult) {
                  timer = Timer.periodic(new Duration(seconds: 2), (timer) {
                    controller
                        .meetingStatus(this.meetingOptions.meetingId)
                        .then((status) {
                      print("Meeting Status Polling: " +
                          status[0] +
                          " - " +
                          status[1]);
                    });
                  });
                });
              }
            }).catchError((error) {
              print("Error");
              print(error);
            });
          })),
        ],
      ),
    );
  }
}
