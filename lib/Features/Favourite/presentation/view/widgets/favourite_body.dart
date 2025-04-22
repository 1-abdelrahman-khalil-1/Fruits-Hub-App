import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitsapp/Features/Favourite/presentation/cubit/favourite_cubit.dart';

class FavouriteBody extends StatefulWidget {
  const FavouriteBody({super.key});

  @override
  State<FavouriteBody> createState() => _FavouriteBodyState();
}

class _FavouriteBodyState extends State<FavouriteBody> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<FavouriteCubit>().getFavourites();
  }
  @override
  Widget build(BuildContext context) {
    return  const SingleChildScrollView(child:Column(
      children:[]

    ));
  }
}