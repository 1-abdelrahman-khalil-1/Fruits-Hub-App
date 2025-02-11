import 'package:flutter/material.dart';
import 'package:fruitsapp/Features/SplashScreen/presentation/onboardingwidgets/onboardingbody.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Onboardingbody(),
      ),
    );
  }
}