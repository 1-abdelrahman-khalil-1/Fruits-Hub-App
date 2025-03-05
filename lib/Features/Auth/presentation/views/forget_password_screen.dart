import 'package:flutter/material.dart';
import 'package:fruitsapp/Features/Auth/presentation/views/forget_password_widgets/forget_password_screen_body.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
      body: ForgetPasswordScreenBody(),
    ));
  }
}
