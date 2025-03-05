import 'package:flutter/material.dart';
import 'package:fruitsapp/Features/Auth/presentation/views/update_password_widgets/update_password_body.dart';

class UpdatePasswordScreen extends StatelessWidget {
  const UpdatePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: Scaffold(
      body: UpdatePasswordBody(),
    ));
  }
}