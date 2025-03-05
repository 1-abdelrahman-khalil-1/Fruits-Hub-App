import 'package:flutter/material.dart';
import 'package:fruitsapp/Core/utils/assets/appcolors.dart';
import 'package:fruitsapp/Core/utils/assets/fontasset.dart';
import 'package:fruitsapp/Core/utils/router/gorouter.dart';
import 'package:go_router/go_router.dart';

class Forgetasswordbutton extends StatelessWidget {
  const Forgetasswordbutton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () { 
      context.push(AppRouter.forgetPasswordScreen);
     },
      child: Text(
        "نسيت كلمة المرور؟",
        style: AppTextStyles.semiBold13.copyWith(
          color: Appcolors.lightgreen,
        ),
      ),
    );
  }
}
