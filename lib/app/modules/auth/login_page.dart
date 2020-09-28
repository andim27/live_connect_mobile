import 'package:ayas_mobile/app/modules/auth/widgets/auth_header.dart';
import 'package:ayas_mobile/app/modules/auth/widgets/login_form.dart';
import 'package:ayas_mobile/app/modules/auth/widgets/social_login_buttons.dart';
import 'package:ayas_mobile/app/modules/auth/auth_streem_controller.dart';
import 'package:ayas_mobile/app/ui/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  AuthStreemController ctl = Get.put(AuthStreemController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [
                  ColorBranding.purple,
                  ColorBranding.purpleLighter,
                  ColorBranding.pinkDark,
                  ColorBranding.pink,
                  ColorBranding.pinkLight,
                  ColorBranding.orangeDark,
                ],
              ),
            ),
            child: Column(
              children: <Widget>[
                AuthHeader(
                    headerTitle: "Login Page",
                    headerBigTitle: "Sing In",
                    headerSmallTitle: "with your email or social accounts",
                    isLoginHeader: true),
                SizedBox(
                  height: 36,
                ),
                LoginForm(),
                SizedBox(
                  height: 8,
                ),
                routeLoginWidget(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SocialLoginButtons(
                      loginText: "Facebook",
                      horizontalWidth: 10.0,
                      verticalWidth: 15.0,
                    ),
                    SocialLoginButtons(
                      loginText: "Google",
                      horizontalWidth: 25.0,
                      verticalWidth: 15.0,
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget routeLoginWidget() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 22.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Do you have an account?",
            style: GoogleFonts.abel(
              fontSize: 14,
              color: ColorBranding.orangeLight,
              fontWeight: FontWeight.w200,
            ),
          ),
          FlatButton(
              child: Text(
                "Register",
                style: GoogleFonts.abel(
                  fontSize: 14,
                  color: ColorBranding.white,
                  fontWeight: FontWeight.w300,
                ),
              ),
              onPressed: () => {} //ctl.openRegisterPage()
              )
        ],
      ),
    );
  }
}
