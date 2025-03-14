import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:svg_flutter/svg.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

import '../../../../Core/services/authentication_service.dart';
import '../../../../Core/services/get_it.dart';
import '../../../../Core/services/services.dart';
import '../../../../Core/services/sharedprefrence.dart';
import '../../../../Core/utils/assets/picture_assets.dart';
import '../../../../Core/utils/router/gorouter.dart';
import '../../../../Features/Auth/Data/repo/authrepo.dart';
import '../../../../Features/Auth/Data/repo/authrepoimpl.dart';
class Splashbody extends StatefulWidget {
  const Splashbody({super.key});

  @override
  State<Splashbody> createState() => _SplashbodyState();
}

class _SplashbodyState extends State<Splashbody> {
  @override
  void initState() {
    super.initState();
    navigate();
  }

  void navigate() {
    if (LocalSharedprefrence.get(LocalSharedprefrence.onboardingkey) == true) {
      Authrepo LoginCheck =
          AuthrepoImp(get_it<AuthenticationService>(), get_it<Services>());
      Future.delayed(const Duration(seconds: 4), () {
        if (mounted) {
          if (LoginCheck.isUserSignedIn() == true) {
            context.go(AppRouter.home);
          } else {
            context.go(AppRouter.login);
          }
        }
      });
    } else {
      Future.delayed(const Duration(seconds: 4), () {
        if (mounted) {
          context.go(AppRouter.onboarding);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        WidgetAnimator(
            incomingEffect: WidgetTransitionEffects.incomingScaleDown(
                duration: const Duration(milliseconds: 1000)),
            child: Align(
                alignment: Alignment.topLeft,
                child: SvgPicture.asset(PictureAssets.assetsImagesPlant))),
        WidgetAnimator(
          incomingEffect: WidgetTransitionEffects.incomingScaleUp(
              duration: const Duration(milliseconds: 1000),
              delay: const Duration(milliseconds: 500)),
          child: SvgPicture.asset(PictureAssets.assetsImagesFruithub),
        ),
        WidgetAnimator(
          incomingEffect: WidgetTransitionEffects.incomingScaleUp(
              duration: const Duration(milliseconds: 1000),
              delay: const Duration(milliseconds: 1000)),
          child: SvgPicture.asset(PictureAssets.assetsImagesCircles,
              fit: BoxFit.fill),
        ),
      ],
    );
  }
}
