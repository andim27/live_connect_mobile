import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_connect_mobile/app/ui/app_texts.dart';

class AppButton extends StatelessWidget {
  const AppButton(
      {Key key,
      @required this.title,
      this.typeBtn,
      this.pageUrl,
      this.onPressFunc})
      : super(key: key);
  final title;
  final String typeBtn;
  final String pageUrl;
  final Function() onPressFunc;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final height_btn = 50.00;
    final width_small_btn = mediaQuery.size.width * 0.25;
    final width_big_btn = mediaQuery.size.width * 0.50;
    final height_small_btn = 50.00;
    final height_big_btn = 80.00;

    openPage() {
      try {
        if (this.pageUrl != null) {
          Get.toNamed(this.pageUrl);
          return;
        }
        onPressFunc();
      } catch (e) {
        print(e);
      }
    }

    double getWidthBtn() {
      if (this.typeBtn == 'big') {
        return width_big_btn;
      } else {
        return width_small_btn;
      }
    }

    double getHeighBtn() {
      if (this.typeBtn == 'big') {
        return height_big_btn;
      } else {
        return height_small_btn;
      }
    }

    return Container(
      child: RaisedButton(
        onPressed: () => {openPage()},
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        textColor: Colors.white,
        padding: const EdgeInsets.all(0.0),
        child: Container(
          width: getWidthBtn(),
          height: getHeighBtn(),
          decoration: new BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(30.0),
          ),
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: appButtonTextStyle,
            ),
          ),
        ),
      ),
    );
  }
}
