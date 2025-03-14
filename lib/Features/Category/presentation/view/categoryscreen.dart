import 'package:flutter/material.dart';
import './/Core/utils/widgets/mybottom_navigation_bar.dart';
import './/Features/Category/presentation/view/widgets/categoryscreen_body.dart';

class Categoryscreen extends StatelessWidget {
  const Categoryscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  const SafeArea(
      child: Scaffold(
        bottomNavigationBar: MybottomNavigationBar(selectedindex: 1),
        body: CategoryscreenBody(),
      ),
    );
  }
}
