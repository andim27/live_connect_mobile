import 'package:ayas_mobile/app/modules/auth/auth_controller.dart';
import 'package:ayas_mobile/app/modules/auth/widgets/custom_textfieldform.dart';
import 'package:ayas_mobile/app/modules/auth/widgets/social_login_buttons.dart';
import 'package:ayas_mobile/app/ui/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:validators/validators.dart' as validator;

class LoginForm extends GetWidget<AuthController> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 24, right: 42, left: 42),
      child: Form(
        child: Column(
          children: <Widget>[
            CustomTextFieldForm(
              controller: emailController,
              labelText: "Email",
              hintText: 'Email',
              isEmail: true,
              validator: (String value) {
                if (!validator.isEmail(value)) {
                  Get.snackbar(
                    "Please enter a",
                    "VALID EMAIL",
                    snackPosition: SnackPosition.BOTTOM,
                  );
                }
                return null;
              },
            ),
            CustomTextFieldForm(
              controller: passwordController,
              labelText: "Password",
              hintText: 'Password',
              suffixIcon: IconButton(
                icon: Icon(
                  // Based on passwordVisible state choose the icon
                  controller.passwordVisible.value ? Icons.visibility : Icons.visibility_off,
                  color: ColorBranding.pink,
                ),
                onPressed: () {
                  // Update the state i.e. toogle the state of passwordVisible variable
                  controller.updateRegisteringBool();
                },
              ),
              isPassword: controller.passwordVisible.value,
              validator: (String value) {
                if (value.length < 7) {
                  Get.snackbar(
                    "Password should be",
                    "minimum 7 characters",
                    snackPosition: SnackPosition.BOTTOM,
                  );
                }

                return null;
              },
            ),
            SocialLoginButtons(
              onTap: () => controller.login(emailController.text, passwordController.text),
              loginText: "Sign In",
              horizontalWidth: 5.0,
              verticalWidth: 15.0,
            ),
          ],
        ),
      ),
    );
  }
}
