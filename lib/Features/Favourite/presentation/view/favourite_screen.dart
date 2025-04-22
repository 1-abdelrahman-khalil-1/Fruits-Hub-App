import 'package:flutter/material.dart';
import 'package:fruitsapp/Features/Favourite/presentation/view/widgets/favourite_body.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: Scaffold(  
      body: FavouriteBody(),
    ));
  }
}