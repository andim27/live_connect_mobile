import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ayas_mobile/app/ui/app_colors.dart';
import 'package:ayas_mobile/app/modules/home/home_feed.dart';
import 'package:ayas_mobile/app/modules/home/widgets/title_text.dart';
import 'package:ayas_mobile/app/modules/home/home_controller.dart';

class HomeAyasPage extends StatefulWidget {
  HomeAyasPage({Key key}) : super(key: key);

  @override
  _HomeAyasPageState createState() => _HomeAyasPageState();
}

Widget _icon(IconData icon, {Color color = ColorBranding.orangeLight, Color bgColor}) {
  return Container(
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(13)),
      color: bgColor,
    ),
    child: Icon(
      icon,
      color: color,
    ),
  );
}

Widget _appBarWidget(HomeController ctl) {
  return Container(
    padding: EdgeInsets.all(10.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        RotatedBox(
          quarterTurns: 4,
          child: _icon(Icons.sort, color: ColorBranding.white, bgColor: ColorBranding.purple),
        ),
        TitleText(
          text: 'AYAS',
          fontSize: 62,
          fontWeight: FontWeight.w400,
        ),
        _registerButton(ctl),
        //_icon(Icons.account_circle, color: ColorBranding.white, bgColor: ColorBranding.purpleLighter),
      ],
    ),
  );
}

Widget _registerButton(HomeController ctl) {
  return FlatButton(
      child: Text(
        "Register",
        style: GoogleFonts.abel(
          fontSize: 14,
          color: ColorBranding.white,
          fontWeight: FontWeight.w500,
        ),
      ),
      onPressed: () => ctl.openSignUpPage());
}

void setState(Null Function() param0) {}

class _HomeAyasPageState extends State<HomeAyasPage> {
  HomeController ctl = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              ColorBranding.purpleDarkest,
              ColorBranding.purpleDark,
              ColorBranding.purple,
              ColorBranding.purpleLighter,
              ColorBranding.pinkDark,
              ColorBranding.pink,
            ],
          ),
        ),
        child: SafeArea(
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              SingleChildScrollView(
                child: Column(
                  children: [
                    _appBarWidget(ctl),
                    HomeFeed(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
