import 'package:ayas_mobile/app/modules/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ayas_mobile/app/routes/app_routes.dart';
import 'package:ayas_mobile/app/modules/home/home_page.dart';

void main() async {
  await GetStorage.init();
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: true,
    //initialBinding: HomeBinding(),
    initialRoute: Routes.HOME,
    //theme: appThemeData,
    defaultTransition: Transition.fadeIn,
    getPages: AppPages.pages,
    home: HomePage(),
  ));
}
