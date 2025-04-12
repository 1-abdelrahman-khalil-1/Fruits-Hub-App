import 'package:flutter/material.dart';
import 'package:fruitsapp/Core/utils/widgets/mybottom_navigation_bar.dart';
import 'package:fruitsapp/Features/Profile/presentation/view/profile%20info%20widgets/profile_info_body.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        bottomNavigationBar: MybottomNavigationBar(selectedindex: 3),
        body: ProfileInfoBody(),
      ),
    );
  }
}
