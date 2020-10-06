import 'package:ayas_mobile/app/ui/app_colors.dart';
import 'package:flutter/material.dart';

Container circularProgress() {
  return Container(
    alignment: Alignment.center,
    padding: EdgeInsets.only(top: 10.0),
    child: CircularProgressIndicator(
      backgroundColor: ColorBranding.pink.withOpacity(0.5),
      valueColor: AlwaysStoppedAnimation(ColorBranding.purpleDarkest.withOpacity(0.8)),
    ),
  );
}

Container linearProgress() {
  return Container(
    padding: EdgeInsets.only(bottom: 10.0),
    child: LinearProgressIndicator(
      backgroundColor: ColorBranding.pink.withOpacity(0.5),
      valueColor: AlwaysStoppedAnimation(ColorBranding.purpleDarkest.withOpacity(0.8)),
    ),
  );
}
