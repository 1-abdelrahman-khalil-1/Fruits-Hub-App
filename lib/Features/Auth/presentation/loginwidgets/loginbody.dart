import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruitsapp/Core/utils/appcolors.dart';
import 'package:fruitsapp/Core/utils/assets/picture_assets.dart';
import 'package:fruitsapp/Core/utils/router/gorouter.dart';
import 'package:fruitsapp/Core/utils/widgets/customappbar.dart';
import 'package:fruitsapp/Core/utils/widgets/customtextbutton.dart';
import 'package:fruitsapp/Core/utils/widgets/customtextform.dart';
import 'package:fruitsapp/Core/utils/widgets/ordividor.dart';
import 'package:fruitsapp/Features/Auth/presentation/loginwidgets/forgetpasswordbutton.dart';
import 'package:fruitsapp/Core/utils/widgets/otherloginservices.dart';
import 'package:fruitsapp/Features/Auth/presentation/loginwidgets/signuptext.dart';

class Loginbody extends StatelessWidget {
  const Loginbody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Customappbar(
              title: "تسجيل دخول",
            ),
            SizedBox(height: 35.h),
            const CustomTextfield(
              textInputType: TextInputType.emailAddress,
              hinttext: "البريد الإلكتروني",
              icon: null,
            ),
            SizedBox(height: 18.h),
            CustomTextfield(
              textInputType: TextInputType.visiblePassword,
              hinttext: "كلمة المرور",
              icon: Icon(
                Icons.visibility,
                color: Appcolors.kgrey,
                size: 24.w,
              ),
            ),
            SizedBox(height: 18.h),
            const Forgetasswordbutton(),
            SizedBox(height: 35.h),
            const CustomTextButton(
              show: true,
              text: "تسجيل دخول",
              navigatelocation: AppRouter.login,
            ),
            SizedBox(height: 35.h),
            const Signuptext(),
            SizedBox(height: 35.h),
            const ORdividor(),
            SizedBox(height: 16.h),
            const Othersigninservices(
              text: "تسجيل بواسطة جوجل",
              image: PictureAssets.assetsImagesGoogleicon,
            ),
            SizedBox(height: 16.h),
            const Othersigninservices(
              text: "تسجيل بواسطة أبل",
              image: PictureAssets.assetsImagesAppleicon,
            ),
            SizedBox(height: 16.h),
            const Othersigninservices(
              text: "تسجيل بواسطة فيسبوك",
              image: PictureAssets.assetsImagesFacebookicon,
            ),
          ],
        ),
      ),
    );
  }
}
