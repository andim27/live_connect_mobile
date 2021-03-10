import 'package:live_connect_mobile/app/modules/auth/auth_controller.dart';
import 'package:live_connect_mobile/app/modules/auth/widgets/custom_textfieldform.dart';
import 'package:live_connect_mobile/app/modules/auth/widgets/social_login_buttons.dart';
import 'package:live_connect_mobile/app/ui/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:validators/validators.dart' as validator;

class RegisterForm extends GetWidget<AuthController> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 24, right: 42, left: 42),
      child: Form(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.topCenter,
              child: CustomTextFieldForm(
                controller: firstNameController,
                hintText: 'First Name',
                validator: (String value) {
                  if (value.isEmpty) {
                    Get.snackbar(
                      "Please enter your",
                      "FIRST NAME",
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  }
                  return null;
                },
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              child: CustomTextFieldForm(
                controller: lastNameController,
                hintText: 'Last Name',
                validator: (String value) {
                  if (value.isEmpty) {
                    Get.snackbar(
                      "Please enter your",
                      "LAST NAME",
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  }
                  return null;
                },
              ),
            ),
            CustomTextFieldForm(
              controller: emailController,
              labelText: "Email",
              hintText: 'Email',
              isEmail: true,
              validator: (String value) {
                if (!validator.isEmail(value)) {
                  Get.snackbar(
                    "Please enter",
                    "a valid email",
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
                  controller.passwordVisible.value
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: ColorBranding.pink,
                ),
                onPressed: () => controller.updateRegisteringBool(),
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
              onTap: () => controller.createUser(
                firstNameController.text,
                lastNameController.text,
                emailController.text,
                passwordController.text,
              ),
              loginText: "Register",
              horizontalWidth: 5.0,
              verticalWidth: 15.0,
            ),
          ],
        ),
      ),
    );
  }
}
