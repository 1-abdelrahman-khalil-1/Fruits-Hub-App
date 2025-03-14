import 'package:flutter/material.dart';
import '../../../../Core/utils/widgets/mybottom_navigation_bar.dart';
import 'widgets/homebody.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
      bottomNavigationBar: MybottomNavigationBar(selectedindex: 0),
      body: Homebody(),
    ));
  }
}
