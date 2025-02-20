import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruitsapp/Core/utils/assets/appcolors.dart';
import 'package:fruitsapp/Core/utils/assets/fontasset.dart';

class Termsandconditionstext extends StatelessWidget {
  const Termsandconditionstext({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 80,
      child: Text.rich(
            TextSpan(   
              children: [
                 TextSpan(
                  text:  "من خلال إنشاء حساب ، فإنك توافق على ", 
                  style: AppTextStyles.semiBold13.copyWith(color: Appcolors.kgrey),
                ),
                TextSpan(
                  recognizer: TapGestureRecognizer()..onTap=(){
                 
                  },
                  text: 'الشروط والأحكام الخاصة بنا',
                  style: AppTextStyles.semiBold13.copyWith(color: Appcolors.kgreen),
                )
              ],
            ),
            textAlign: TextAlign.start,
          ),
    );
  }
}