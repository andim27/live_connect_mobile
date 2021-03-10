import 'package:live_connect_mobile/app/modules/auth/widgets/social_login_buttons.dart';
import 'package:live_connect_mobile/app/modules/livePageZoom/join_meeting_room.dart';
import 'package:live_connect_mobile/app/ui/app_colors.dart';
import 'package:flutter/material.dart';

class JoinZoom extends StatefulWidget {
  @override
  _JoinZoomState createState() => _JoinZoomState();
}

class _JoinZoomState extends State<JoinZoom> {
  TextEditingController meetingIdController = TextEditingController();
  TextEditingController meetingPasswordController = TextEditingController();

  @override
  void initState() {
    meetingIdController.text = "3192165749";
    meetingPasswordController.text = "BTm6Q4";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // new page needs scaffolding!
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorBranding.purpleDark,
        title: Text(
          'Join Meeting',
          style: TextStyle(color: ColorBranding.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
                ColorBranding.purple,
                ColorBranding.purpleLighter,
                ColorBranding.pinkDark,
                ColorBranding.pink,
                ColorBranding.pinkLight,
                ColorBranding.orangeDark,
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 32.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: TextField(
                      keyboardType: TextInputType.number,
                      controller: meetingIdController,
                      onSubmitted: (v) async {
                        meetingIdController.text = v;
                      },
                      decoration: InputDecoration(
                        labelText: 'Meeting ID',
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: TextField(
                      keyboardType: TextInputType.text,
                      controller: meetingPasswordController,
                      onSubmitted: (v) async {
                        meetingPasswordController.text = v;
                      },
                      decoration: InputDecoration(
                        labelText: 'Meeting Password',
                      )),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SocialLoginButtons(
                      onTap: () => joinMeeting(context),
                      loginText: "Join",
                      horizontalWidth: 60.0,
                      verticalWidth: 15.0,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  joinMeeting(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return JoinMeetingRoom(
              meetingId: meetingIdController.text,
              meetingPassword: meetingPasswordController.text);
        },
      ),
    );
  }
}
