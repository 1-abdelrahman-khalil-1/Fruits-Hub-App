import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruitsapp/Core/utils/assets/appcolors.dart';
import 'package:fruitsapp/Core/utils/assets/apptextstyles.dart';
import 'package:go_router/go_router.dart';

class Logintext extends StatelessWidget {
  const Logintext({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: "تمتلك حساب بالفعل؟ ",
              style: AppTextStyles.semiBold16.copyWith(color: Appcolors.grey),
            ),
            TextSpan(
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  context.pop();
                },
              text: 'تسجيل دخول',
              style: AppTextStyles.semiBold16.copyWith(color: Appcolors.green500),
            )
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
