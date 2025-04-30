import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitsapp/Core/utils/widgets/headerbar.dart';
import 'package:fruitsapp/Core/utils/widgets/slivergridblocbuilder.dart';
import 'package:fruitsapp/Core/cubit/Favourite%20cubit/favourite_cubit.dart';
import 'package:fruitsapp/Core/cubit/Favourite%20cubit/favourite_cubit_states.dart';

import '../../../../../Core/utils/widgets/productslivergridview.dart';
import '../../../../../Core/utils/widgets/skeltonizerloading_sliver_with_dummy_products.dart';

class FavouriteBody extends StatefulWidget {
  const FavouriteBody({super.key});

  @override
  State<FavouriteBody> createState() => _FavouriteBodyState();
}

class _FavouriteBodyState extends State<FavouriteBody> {
  bool _initialized = false;

  @override
  void initState() {
    super.initState();
    // Only fetch favorites if not already loaded
    if (!_initialized) {
      _initialized = true;
      context.read<FavouriteCubit>().getFavourites();
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(child: HeaderBar(title: "المفضلة", showicon: true, shownotification: false),),
        BlocBuilder<FavouriteCubit, FavouriteCubitStates>(
        builder: (context, state) {
        if (state is FavouriteSuccessState) {
          return Productslivergridview(product: state.favouriteProducts , len: state.favouriteProducts.length);
        } else if (state is FavouriteErrorState) {
          return const SliverToBoxAdapter(
            child: Center(
              child: Text("Error To Get Products"),
            ),
          );
        } else {
          return const SkeltonizerSliverLoadingWithDummyProducts();
        }
      },
    )
      ],
    );
  }
}
