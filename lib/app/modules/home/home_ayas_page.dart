import 'package:flutter/material.dart';
import 'package:ayas_mobile/app/ui/app_colors.dart';
import 'package:ayas_mobile/app/modules/home/home_feed.dart';
import 'package:ayas_mobile/app/modules/home/widgets/title_text.dart';

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

Widget _appBarWidget() {
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
        _icon(Icons.account_circle, color: ColorBranding.white, bgColor: ColorBranding.purpleLighter),
      ],
    ),
  );
}

void setState(Null Function() param0) {}

class _HomeAyasPageState extends State<HomeAyasPage> {
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
                    _appBarWidget(),
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
