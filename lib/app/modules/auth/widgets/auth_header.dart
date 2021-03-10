import 'package:live_connect_mobile/app/modules/home/home_controller.dart';
import 'package:live_connect_mobile/app/ui/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthHeader extends StatelessWidget {
  final String headerTitle;
  final String headerBigTitle;
  final String headerSmallTitle;
  final bool isLoginHeader;

  AuthHeader(
      {this.headerTitle,
      this.headerBigTitle,
      this.isLoginHeader,
      this.headerSmallTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: ColorBranding.purpleDarkest.withOpacity(0.6),
              blurRadius: 15,
              offset: Offset(0, 0),
            ),
          ],
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
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(24),
              bottomRight: Radius.circular(24))),
      padding: EdgeInsets.all(16),
      height: MediaQuery.of(context).size.height * 0.3,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: Text(
              headerTitle,
              style: GoogleFonts.abel(
                fontSize: 17,
                color: ColorBranding.white,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          this.isLoginHeader
              ? Container()
              : Align(
                  alignment: Alignment.topLeft,
                  child: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8, left: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    headerBigTitle,
                    style: GoogleFonts.abel(
                      fontSize: 40,
                      color: ColorBranding.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    headerSmallTitle,
                    style: GoogleFonts.abel(
                      fontSize: 23,
                      color: ColorBranding.white,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
