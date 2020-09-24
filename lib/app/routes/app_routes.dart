import 'package:get/get.dart';
import 'package:ayas_mobile/app/modules/home/home_page.dart';
import 'package:ayas_mobile/app/modules/home/home_ayas_page.dart';
import 'package:ayas_mobile/app/modules/about/about_page.dart';
import 'package:ayas_mobile/app/modules/rooms/room_page.dart';

abstract class Routes {
  static const HOME = '/home';
  static const HOME_AYAS = '/home-ayas';
  static const LOGIN = '/login';
  static const ROOM = '/room';
  static const ABOUT = '/about';
  static const LIVEZOOMPAGE = '/live_page_zoom';
  static const JOINMEETING = '/join_room';
  static const STARTMEETING = '/start_meeting';
  static const MEETINGROOM = '/meeting_room';
}

abstract class AppPages {
  static final pages = [
    GetPage(name: Routes.HOME, page: () => HomePage()),
    GetPage(name: Routes.HOME_AYAS, page: () => HomeAyasPage()),
    GetPage(name: Routes.ABOUT, page: () => AboutPage()),
    GetPage(name: Routes.ROOM, page: () => RoomPage()),
    GetPage(name: Routes.LIVEZOOMPAGE, page: () => LivePageZoom()),
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
