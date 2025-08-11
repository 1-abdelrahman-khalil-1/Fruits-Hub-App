import 'package:flutter/material.dart';
import 'package:fruitsapp/Features/Auth/presentation/views/loginwidgets/loginbody.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize GetX controller
    
    return const SafeArea(
      child: Scaffold(
        body: Loginbody(),
      ),
    );
  }
}

