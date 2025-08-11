import 'package:flutter/material.dart';
import 'package:fruitsapp/Features/Auth/presentation/views/login.dart';
import 'package:get/get.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../Core/utils/assets/apptextstyles.dart';
import '../../../../Core/services/sharedprefrence.dart';

class FrontAndBackgroundImageandSkip extends StatelessWidget {
  const FrontAndBackgroundImageandSkip({
    super.key,
    required this.backgroundimage,
    required this.frontimage,
    required this.showtext,
  });

  final String backgroundimage;
  final String frontimage;
  final bool showtext;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      width: double.infinity,
      child: Stack(
        children: [
          Positioned.fill(
              child: SvgPicture.asset(
            backgroundimage,
            fit: BoxFit.fill,
          )),
          Positioned(
              bottom: 10,
              right: 0,
              left: 0,
              top: 100,
              child: SvgPicture.asset(frontimage)),
          GestureDetector(
            onTap: () {
              LocalSharedprefrence.set(
                  LocalSharedprefrence.onboardingkey, true);
              Get.to(const LoginScreen());
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 40, right: 22),
              child: Visibility(
                visible: showtext,
                child: Text(
                  'تخط',
                  style: AppTextStyles.semiBold13,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
