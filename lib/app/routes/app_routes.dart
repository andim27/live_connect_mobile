import 'package:get/get.dart';
import 'package:ayas_mobile/app/modules/home/home_page.dart';
import 'package:ayas_mobile/app/modules/about/about_page.dart';
import 'package:ayas_mobile/app/modules/rooms/room_page.dart';

abstract class Routes {
  static const HOME = '/home';
  static const LOGIN = '/login';
  static const ROOM = '/room';
  static const ABOUT = '/about';
}

abstract class AppPages {
  static final pages = [
    GetPage(name: Routes.HOME, page: () => HomePage()),
    GetPage(name: Routes.ABOUT, page: () => AboutPage()),
    GetPage(name: Routes.ROOM, page: () => RoomPage()),
  ];
}
