import 'package:flutter/material.dart';

import 'package:live_connect_mobile/app/ui/app_colors.dart';

class SocialLoginButtons extends StatelessWidget {
  final bool isSocial;
  final String loginText;
  final double horizontalWidth;
  final double verticalWidth;
  final allWidthAndHeight;
  final VoidCallback onTap;

  const SocialLoginButtons({
    Key key,
    this.isSocial,
    this.loginText,
    this.horizontalWidth,
    this.verticalWidth,
    this.allWidthAndHeight,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: horizontalWidth, vertical: verticalWidth),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: ColorBranding.purpleDarkest.withOpacity(0.6),
              blurRadius: 15,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalWidth,
            vertical: verticalWidth,
          ),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                ColorBranding.pinkDark,
                ColorBranding.pink,
                ColorBranding.pinkLight,
              ],
            ),
            color: Colors.transparent,
            border: Border.all(
              color: ColorBranding.orange,
              width: 1,
            ),
            // boxShadow: <BoxShadow>[
            //   BoxShadow(
            //     color: model.isSelected ? Color(0xfffbf2ef) : Colors.white,
            //     blurRadius: 10,
            //     spreadRadius: 5,
            //     offset: Offset(5, 5),
            //   ),
            // ],
          ),
          child: Text(
            loginText,
            style: TextStyle(
              color: ColorBranding.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
