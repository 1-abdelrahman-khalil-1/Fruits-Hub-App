import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitsapp/Core/cubit/products_cubit.dart';
import 'package:fruitsapp/Core/cubit/products_cubit_states.dart';
import 'package:fruitsapp/Core/helperFunctions/dummy.dart';
import 'package:fruitsapp/Features/Details_for_product/presentation/view/widgets/details_for_product_body.dart';
import 'package:skeletonizer/skeletonizer.dart';

class DetailsForProductBodyBlocBuilder extends StatelessWidget {
  const DetailsForProductBodyBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsCubitStates>(
      builder: (context, state) {
        if(state is SuccessState)
        {
          return DetailsForProductBody(product: state.product,);
        }else if (state is ErrorState)
        {
          return const Center(
            child: Text("Error To Get Product"),
          );
        }else{
          return Skeletonizer(child: DetailsForProductBody(product: dummyProduct()));
        }
      },
    );
  }
}