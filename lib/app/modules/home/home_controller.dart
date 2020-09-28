import 'package:ayas_mobile/app/modules/auth/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:ayas_mobile/app/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  final box = GetStorage();

  final _version = ''.obs;
  get version => this._version.value;

  final _isUserLogin = false.obs;
  get isUserLogin => this._isUserLogin.value;

  final _curUserId = ''.obs;
  get curUserId => this._curUserId.value;

  @override
  void onInit() {
    super.onInit();
    checkIsUserLogin();
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

  openSignInPage() {
    Get.toNamed(Routes.SIGNIN);
  }

  checkIsUserLogin() {
    if (box.hasData('cur_user_id') && (box.hasData('cur_user_token'))) {
      //if (box.hasData('cur_user_token')) {
      this._isUserLogin.value = true;
      this._curUserId.value = box.read('cur_user_id');
    } else {
      this._isUserLogin.value = false;
      this._curUserId.value = '';
    }
  }

  logoutUser() {
    box.erase();
    this._isUserLogin.value = false;
    this._curUserId.value = '';
    print('LogOut done!');
    //box.erase('cur_user_id');
    // box.erase('cur_user_name');
    // box.erase('cur_user_password');
    // box.erase('cur_user_email');
    // box.erase('cur_user_avatar');
    // box.erase('cur_user_token');
  }
}
