import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:live_connect_mobile/app/ui/app_colors.dart';

class TitleText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;

  const TitleText(
      {Key key,
      this.text,
      this.fontSize = 18,
      this.color = ColorBranding.white,
      this.fontWeight = FontWeight.w800})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.fitWidth,
      child: Wrap(
        direction: Axis.vertical,
        children: [
          Text(text,
              // overflow: TextOverflow.ellipsis,
              maxLines: 3,
              style: GoogleFonts.abel(
                  fontSize: fontSize, fontWeight: fontWeight, color: color)),
        ],
      ),
    );
  }
}
