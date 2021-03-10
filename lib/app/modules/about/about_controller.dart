import 'package:flutter/material.dart';
import 'package:live_connect_mobile/app/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AboutController extends GetxController {
  final _version = ''.obs;
  get version => this._version.value;
  final _installDate = ''.obs;
  get installDate => this._installDate.value;

  @override
  void onInit() {
    super.onInit();
    this._version.value = '0.01';
    this._installDate.value = '17.09.20 18:15';
  }

  backPage() {
    Get.back();
  }
}
