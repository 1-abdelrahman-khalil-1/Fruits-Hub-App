import 'package:flutter/material.dart';
import 'splashwidgets/splashbody.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Splashbody(),
      ),
    );
  }
}