import 'package:flutter/material.dart';
import 'package:fruitsapp/Core/utils/appcolors.dart';
import 'package:fruitsapp/Core/utils/assets/fontasset.dart';

class Forgetasswordbutton extends StatelessWidget {
  const Forgetasswordbutton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Text(
        "نسيت كلمة المرور؟",
        style: AppTextStyles.semiBold13.copyWith(
          color: Appcolors.klightgreen,
        ),
      ),
    );
  }
}
