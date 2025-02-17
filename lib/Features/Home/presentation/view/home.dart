import 'package:flutter/material.dart';
import 'package:fruitsapp/Features/Home/presentation/view/widgets/homebody.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: Scaffold(
      body: Homebody(),
    ));
  }
}