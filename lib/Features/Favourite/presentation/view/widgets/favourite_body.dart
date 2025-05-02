import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitsapp/Core/utils/widgets/headerbar.dart';
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
  bool _isFirstLoad = true;

  @override
  void initState() {
    super.initState();
    // Load favorites only once when the widget is first initialized
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_isFirstLoad) {
        context.read<FavouriteCubit>().getFavourites();
        _isFirstLoad = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: HeaderBar(
                title: "المفضلة", showicon: true, shownotification: false),
          ),
          BlocBuilder<FavouriteCubit, FavouriteCubitStates>(
            builder: (context, state) {
              if (state is FavouriteSuccessState) {
                if (state.favouriteProducts.isEmpty) {
                  return const SliverToBoxAdapter(
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text("لم تقم بإضافة أي منتجات للمفضلة بعد"),
                      ),
                    ),
                  );
                }
                return Productslivergridview(
                    product: state.favouriteProducts,
                    len: state.favouriteProducts.length);
              } else if (state is FavouriteErrorState) {
                return SliverToBoxAdapter(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(state.errorMessage),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () =>
                              context.read<FavouriteCubit>().getFavourites(),
                          child: const Text("إعادة المحاولة"),
                        )
                      ],
                    ),
                  ),
                );
              } else {
                return const SkeltonizerSliverLoadingWithDummyProducts();
              }
            },
          )
        ],
      ),
    );
  }
}
