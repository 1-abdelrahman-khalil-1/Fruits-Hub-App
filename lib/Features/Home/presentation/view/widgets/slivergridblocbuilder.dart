import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitsapp/Core/helperFunctions/dummy.dart';
import 'package:fruitsapp/Features/Home/presentation/cubit/popular_products_cubit.dart';
import 'package:fruitsapp/Features/Home/presentation/cubit/popular_products_cubit_states.dart';
import 'package:fruitsapp/Features/Home/presentation/view/widgets/productslivergridview.dart';
import 'package:skeletonizer/skeletonizer.dart';

class Slivergridblocbuilder extends StatelessWidget {
  const Slivergridblocbuilder({super.key});

  @override
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularProductsCubit, PopularProductsCubitStates>(
      builder: (context, state) {
        if(state is LoadingState)
        {
          return  Skeletonizer.sliver(
            enabled: true,
            child: Productslivergridview(product: [dummyProduct(),dummyProduct() , dummyProduct() , dummyProduct()],));
        } else if (state is SuccessState )
        {
          return Productslivergridview(product: state.products);
        }else 
        {
          return const SliverToBoxAdapter(child: Center(child: Text("Error To Get Products"),),);
        }
      },
    );
  }
}