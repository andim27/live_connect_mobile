import 'package:get/get.dart';
import 'package:ayas_mobile/app/modules/home/home_page.dart';
import 'package:ayas_mobile/app/modules/home/home_ayas_page.dart';
import 'package:ayas_mobile/app/modules/about/about_page.dart';
import 'package:ayas_mobile/app/modules/rooms/room_page.dart';
import 'package:ayas_mobile/app/modules/auth/signup_page.dart';
import 'package:ayas_mobile/app/modules/auth/signin_page.dart';
import 'package:ayas_mobile/app/modules/livePageZoom/live_page_zoom.dart';
import 'package:ayas_mobile/app/modules/livePageZoom/join_zoom.dart';
import 'package:ayas_mobile/app/modules/livePageZoom/start_meeting.dart';
import 'package:ayas_mobile/app/modules/livePageZoom/start_meeting_page.dart';
import 'package:ayas_mobile/app/modules/livePageZoom/join_meeting_room.dart';
import 'package:ayas_mobile/app/modules/livePageZoom/no_login_meeting.dart';

abstract class Routes {
  static const HOME = '/home';
  static const HOME_AYAS = '/home-ayas';
  static const LOGIN = '/login';
  static const SIGNUP = '/signup';
  static const SIGNIN = '/signin';
  static const ROOM = '/room';
  static const ABOUT = '/about';
  static const LIVEZOOMPAGE = '/live_page_zoom';
  static const JOINMEETING = '/join_room';
  static const STARTMEETING = '/start_meeting';
  static const MEETINGROOM = '/meeting_room';
  static const STARTMEETINGPAGE = '/start_meeting_page';
  static const NOLOGINMEETINGPAGE = '/no_login_meeting';
}

abstract class AppPages {
  static final pages = [
    GetPage(name: Routes.HOME, page: () => HomePage()),
    GetPage(name: Routes.HOME_AYAS, page: () => HomeAyasPage()),
    GetPage(name: Routes.SIGNUP, page: () => SignUpPage()),
    GetPage(name: Routes.SIGNIN, page: () => SignInPage()),
    GetPage(name: Routes.ABOUT, page: () => AboutPage()),
    GetPage(name: Routes.ROOM, page: () => RoomPage()),
    GetPage(name: Routes.LIVEZOOMPAGE, page: () => LivePageZoom()),
    GetPage(name: Routes.JOINMEETING, page: () => JoinZoom()),
    GetPage(name: Routes.STARTMEETING, page: () => StartMeeting()),
    GetPage(name: Routes.MEETINGROOM, page: () => JoinMeetingRoom()),
    GetPage(name: Routes.STARTMEETINGPAGE, page: () => StartMeetingPage()),
    GetPage(name: Routes.NOLOGINMEETINGPAGE, page: () => NoLoginMeeting()),
    // GetPage(name: Routes.JOINMEETING, page: () => JoinZoom()),
    // GetPage(
    //     name: Routes.STARTMEETING,
    //     page: () => StartMeeting(
    //           meetingId: "12345678",
    //         )),
    // GetPage(
    //     name: Routes.MEETINGROOM,
    //     page: () => MeetingRoom(
    //           meetingId: "12345678",
    //           meetingPassword: "12345678",
    //         )),
  ];
}
