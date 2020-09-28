import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:ayas_mobile/app/modules/auth/auth_streem_controller.dart';
import 'package:ayas_mobile/app/ui/app_colors.dart';
import 'package:ayas_mobile/app/ui/app_texts.dart';

class SignInPage extends StatelessWidget {
  AuthStreemController ctl = AuthStreemController();
  final TextEditingController nameController = TextEditingController()..text;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String firstName = ctl.curUserName;
    String firstEmail = ctl.curUserEmail;
    // emailController.text = ctl.curUserEmail;
    // passwordController.text = ctl.curUserPassword;
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Login")),
        backgroundColor: ColorBranding.purpleDarkest,
      ),
      body: Material(
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
            child: Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
                child: Obx(() => SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          TextFormField(
                            //initialValue: firstName,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            decoration: InputDecoration(
                              hintText: "Your Name",
                              labelText: "Login",
                              fillColor: Colors.white,
                              hintStyle: hintInputStyle,
                              labelStyle: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            controller: nameController,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            //initialValue: firstEmail, //ctl.curUserEmail,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            decoration: InputDecoration(
                              hintText: "Email",
                              labelText: "Email",
                              fillColor: Colors.white,
                              hintStyle: hintInputStyle,
                              labelStyle: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            controller: emailController,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            //initialValue: ctl.curUserPassword,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            decoration: InputDecoration(
                              hintText: "Password",
                              labelText: "Password",
                              fillColor: Colors.white,
                              hintStyle: hintInputStyle,
                              labelStyle: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            obscureText: true,
                            controller: passwordController,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          FlatButton(
                            color: Colors.white,
                            onPressed: () => (ctl.isProcessRegister == true)
                                ? null
                                : ctl.loginUserStreemDB(
                                    nameController.text, emailController.text, passwordController.text),
                            child: Text("Sign In"),
                          )
                        ],
                      ),
                    )),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
