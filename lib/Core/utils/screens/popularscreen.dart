import 'package:flutter/material.dart';
import '../widgets/mybottom_navigation_bar.dart';
import '../widgets/popularscreenbody.dart';

class PopularScreen extends StatelessWidget {
  const PopularScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
      bottomNavigationBar: MybottomNavigationBar(selectedindex: 0),
      body: Popularscreenbody(),
    ));
  }
}