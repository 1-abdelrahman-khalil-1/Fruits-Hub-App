import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitsapp/Core/utils/widgets/mybottom_navigation_bar.dart';
import 'package:fruitsapp/Features/Profile/presentation/view/profile%20screen%20widgets/profile_screen_body.dart';

import '../../../../Core/cubit/Favourite cubit/favourite_cubit.dart';
import '../../../../Core/services/get_it.dart';
import '../../../Favourite/data/repo/favourite_repo.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavouriteCubit(get_it<FavouriteRepo>()),     
      child: const SafeArea(
        child: Scaffold(
          body: ProfileScreenBody(),
          bottomNavigationBar: MybottomNavigationBar(selectedindex: 3),
        ),
      ),
    );
  }

 
}