import 'package:live_connect_mobile/app/modules/auth/widgets/social_login_buttons.dart';
import 'package:live_connect_mobile/app/modules/livePageZoom/start_meeting.dart';
import 'package:live_connect_mobile/app/ui/app_colors.dart';
import 'package:flutter/material.dart';

class StartMeetingPage extends StatefulWidget {
  @override
  _StartMeetingPageState createState() => _StartMeetingPageState();
}

class _StartMeetingPageState extends State<StartMeetingPage> {
  TextEditingController meetingIdController = TextEditingController();

  @override
  void initState() {
    meetingIdController.text = "3192165749";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // new page needs scaffolding!
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorBranding.purpleDark,
        title: Text(
          'Start Meeting',
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SocialLoginButtons(
                      onTap: () => startMeeting(context),
                      loginText: "Start Meeting",
                      horizontalWidth: 30.0,
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

  startMeeting(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return StartMeeting(
            meetingId: meetingIdController.text,
          );
        },
      ),
    );
  }
}
