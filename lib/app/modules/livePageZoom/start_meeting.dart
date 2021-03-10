import 'dart:async';
import 'dart:io';

import 'package:live_connect_mobile/app/modules/livePageZoom/constants/api_keys.dart';
import 'package:live_connect_mobile/app/modules/livePageZoom/live_page_zoom_controller.dart';
import 'package:live_connect_mobile/app/ui/app_colors.dart';
import 'package:live_connect_mobile/app/widgets/progress_indicator.dart';
import 'package:flutter_zoom_plugin/zoom_view.dart';
import 'package:flutter_zoom_plugin/zoom_options.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class StartMeeting extends StatelessWidget {
  ZoomOptions zoomOptions;
  ZoomMeetingOptions meetingOptions;

  Timer timer;

  StartMeeting({Key key, meetingId}) : super(key: key) {
    this.zoomOptions = new ZoomOptions(
      domain: "zoom.us",
      appKey: APIKEYS.zoomApiKey,
      appSecret: APIKEYS.zoomApiSecret,
    );
    this.meetingOptions = new ZoomMeetingOptions(
      userId: APIKEYS.zoomUserID,
      displayName: 'Example display Name',
      meetingId: meetingId,
      // meetingPassword: "BTm6Q4",
      zoomAccessToken: APIKEYS.zoomZAKtoken,
      zoomToken: APIKEYS.zoomUserToken,
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
      result = status == "MEETING_STATUS_DISCONNECTING" ||
          status == "MEETING_STATUS_FAILED";
    else
      result = status == "MEETING_STATUS_IDLE";

    return result;
  }

  LivePageZoomController livePageZoomController =
      Get.put(LivePageZoomController());
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
        // mainAxisAlignment: MainAxisAlignment.center,
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
                      print("isLive FALSE: " +
                          livePageZoomController.isLiveRx.value.toString());
                    }
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
                      .startMeeting(this.meetingOptions)
                      .then((joinMeetingResult) {
                    timer = Timer.periodic(new Duration(seconds: 1), (timer) {
                      controller
                          .meetingStatus(this.meetingOptions.meetingId)
                          .then((status) {
                        print("Meeting Status Polling: " +
                            status[0] +
                            " - " +
                            status[1]);
                        if (status[0] == "MEETING_STATUS_INMEETING") {
                          livePageZoomController.updateIsLiveBool(true);
                          print("isLive TRUE: " +
                              livePageZoomController.isLiveRx.value.toString());
                        } else if (status[0] == "MEETING_STATUS_IDLE") {
                          livePageZoomController.updateIsLiveBool(false);
                          print("isLive FALSE status[0]: " +
                              livePageZoomController.isLiveRx.value.toString());
                        }
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
