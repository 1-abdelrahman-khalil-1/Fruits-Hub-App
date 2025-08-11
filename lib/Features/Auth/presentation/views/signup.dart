import 'package:flutter/material.dart';
import 'package:fruitsapp/Features/Auth/presentation/views/signupwidgets/signupbody.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize GetX controller
    
    return const SafeArea(
      child: Scaffold(
        body: Signupbody(),
      ),
    );
  }
}


