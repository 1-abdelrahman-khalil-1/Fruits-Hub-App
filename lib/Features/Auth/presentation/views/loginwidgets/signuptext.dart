import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruitsapp/Core/utils/appcolors.dart';
import 'package:fruitsapp/Core/utils/assets/fontasset.dart';
import 'package:fruitsapp/Core/utils/router/gorouter.dart';
import 'package:fruitsapp/Features/Auth/Data/repo/AuthrepoImp.dart';
import 'package:fruitsapp/Features/Auth/Data/repo/authrepo.dart';
import 'package:go_router/go_router.dart';

class Signuptext extends StatelessWidget {
  const Signuptext({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Text.rich(
            TextSpan(   
              children: [
                 TextSpan(
                  text:  "لا تمتلك حساب؟",
                  style: AppTextStyles.semiBold16.copyWith(color: Appcolors.kgrey),
                ),
                TextSpan(
                  recognizer: TapGestureRecognizer()..onTap=(){
                   context.push(AppRouter.signup);
                  },
                  text: ' قم بإنشاء حساب',
                  style: AppTextStyles.semiBold16.copyWith(color: Appcolors.kgreen),
                )
              ],
            ),
            textAlign: TextAlign.center,
          ),
    );
  }
}