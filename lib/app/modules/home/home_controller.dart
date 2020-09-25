import 'package:ayas_mobile/app/modules/auth/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:ayas_mobile/app/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  final _version = ''.obs;
  get version => this._version.value;

  @override
  void onInit() {
    super.onInit();
  }

  openRoomPage() {
    Get.toNamed(Routes.ROOM);
  }

  openLiveZoomPage() {
    Get.toNamed(Routes.LIVEZOOMPAGE);
  }

  openJoinMeeting() {
    Get.toNamed(Routes.JOINMEETING);
  }

  openMeetingRoom() {
    Get.toNamed(Routes.MEETINGROOM);
  }

  openStartMeeting() {
    Get.toNamed(Routes.STARTMEETING);
  }

  openSignUpPage() {
    Get.toNamed(Routes.SIGNUP);
  }
}
