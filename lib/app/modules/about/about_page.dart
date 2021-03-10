import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ayas_mobile/app/modules/about/about_controller.dart';
import 'package:ayas_mobile/app/ui/app_texts.dart';

class AboutPage extends StatelessWidget {
  AboutController ctl = Get.put(AboutController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text(' Описание приложения: '))),
      body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("assets/images/logo-96.png"),
                  SizedBox(height: 20),
                  Text(AppTexts.appAboutTitle, style: titleAboutStyle),
                  SizedBox(height: 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(AppTexts.appVersionTitle, style: titleBoldStyle),
                      Text(ctl.version, style: titleNormalStyle),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(AppTexts.appInstallDateTitle, style: titleBoldStyle),
                      Text(ctl.installDate, style: titleNormalStyle),
                    ],
                  ),
                  SizedBox(height: 40),
                  AppButton(
                      title: "Назад",
                      typeBtn: 'small',
                      onPressFunc: () => ctl.backPage())
                ]),
          )),
    );
  }
}
