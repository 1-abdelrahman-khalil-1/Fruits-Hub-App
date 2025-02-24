import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitsapp/Core/services/get_it.dart';
import 'package:fruitsapp/Features/Home/Data/repo/productrepo.dart';
import 'package:fruitsapp/Features/Home/presentation/cubit/popular_products_cubit.dart';
import 'package:fruitsapp/Features/Home/presentation/view/widgets/popularscreen_body_bloc_consumer.dart';

class PopularScreen extends StatelessWidget {
  const PopularScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PopularProductsCubit(get_it<Productrepo>()),
      child: const PopularscreenbodyBlocConsumer(),
    );
  }
}