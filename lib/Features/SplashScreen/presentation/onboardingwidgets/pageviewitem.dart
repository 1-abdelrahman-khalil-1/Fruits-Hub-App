import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruitsapp/Core/utils/router/gorouter.dart';
import 'package:fruitsapp/Features/SplashScreen/presentation/onboardingwidgets/showdotindicator.dart';
import 'package:fruitsapp/Features/SplashScreen/presentation/onboardingwidgets/front_and_background_image.dart';
import 'package:fruitsapp/Core/utils/widgets/customtextbutton.dart';
import 'package:fruitsapp/Features/SplashScreen/presentation/onboardingwidgets/titleanddescription.dart';
import 'package:go_router/go_router.dart';

class Pageviewitem extends StatelessWidget {
  const Pageviewitem(
      {super.key,
      required this.backgroundimage,
      required this.frontimage,
      required this.title,
      required this.description,
      required this.first,
      required this.second,
      required this.show});
  final String backgroundimage, frontimage;
  final String title, first, second, description;
  final bool show;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FrontAndBackgroundImageandSkip(
          backgroundimage: backgroundimage,
          frontimage: frontimage,
          showtext: !show,
        ),
        SizedBox(
          height: 40.h,
        ),
        TitleAndDescription(
            title: title,
            first: first,
            second: second,
            description: description),
        SizedBox(
          height: 70.h,
        ),
        ShowDotIndicator(show: show),
        SizedBox(
          height: 30.h,
        ),
        CustomTextButton(
          onpressed: (){
            context.go(AppRouter.login);
          },
          show: show,
          text: "ابدأ الان",
          
        ),
      ],
    );
  }
}
