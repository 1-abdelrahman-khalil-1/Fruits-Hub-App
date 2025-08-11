import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruitsapp/Core/utils/assets/appcolors.dart';
import 'package:fruitsapp/Core/utils/assets/apptextstyles.dart';
import 'package:fruitsapp/Features/Auth/presentation/views/signup.dart';
import 'package:get/get.dart';

class Signuptext extends StatelessWidget {
  const Signuptext({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: "لا تمتلك حساب؟",
              style: AppTextStyles.semiBold16.copyWith(color: Appcolors.grey),
            ),
            TextSpan(
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Get.to(const SignupScreen());
                },
              text: ' قم بإنشاء حساب',
              style:
                  AppTextStyles.semiBold16.copyWith(color: Appcolors.green500),
            )
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
