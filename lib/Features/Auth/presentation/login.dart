import 'package:flutter/material.dart';
import 'package:fruitsapp/Features/Auth/presentation/loginwidgets/loginbody.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child:  Scaffold(
        body: Loginbody() 
      ),
    );
  }
}