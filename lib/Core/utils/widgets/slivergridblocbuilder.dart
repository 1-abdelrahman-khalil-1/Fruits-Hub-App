import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitsapp/Core/utils/widgets/skeltonizerloading_sliver_with_dummy_products.dart';
import 'package:fruitsapp/Core/cubit/products_cubit.dart';
import 'package:fruitsapp/Core/cubit/products_cubit_states.dart';
import 'package:fruitsapp/Features/Home/presentation/view/widgets/productslivergridview.dart';
class Slivergridblocbuilder extends StatelessWidget {
  const Slivergridblocbuilder({super.key,  this.showmore_items =false});
  final bool showmore_items;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsCubitStates>(
      builder: (context, state) {
        if (state is SuccessState) {
          return Productslivergridview(product: state.products , len: (showmore_items==false?state.products.length/2 : state.products.length).round());
        } else if (state is ErrorState) {
          return const SliverToBoxAdapter(
            child: Center(
              child: Text("Error To Get Products"),
            ),
          );
        } else {
          return const SkeltonizerSliverLoadingWithDummyProducts();
        }
      },
    );
  }
}

