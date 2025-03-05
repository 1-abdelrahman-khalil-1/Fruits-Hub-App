import 'package:flutter/material.dart';
import 'package:fruitsapp/Features/Auth/presentation/views/verify_otp_widgets/verify_otp_body.dart';

class VerifyOtpScreen extends StatelessWidget {
  const VerifyOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: Scaffold(
      body : VerifyOtpBody()
    ));
  }
}