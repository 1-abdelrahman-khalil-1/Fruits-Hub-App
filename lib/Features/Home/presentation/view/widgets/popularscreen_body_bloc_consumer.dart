import 'package:flutter/material.dart';
import 'package:fruitsapp/Core/utils/widgets/mybottom_navigation_bar.dart';
import 'package:fruitsapp/Features/Home/presentation/view/widgets/popularscreenbody.dart';

class PopularscreenbodyBlocConsumer extends StatelessWidget {
  const PopularscreenbodyBlocConsumer({
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