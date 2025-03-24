import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../Core/cubit/Product Cubit/products_cubit.dart';
import '../../../../../Core/cubit/Product Cubit/products_cubit_states.dart';
import '../../../../../../../Core/helperFunctions/dummy.dart';
import 'details_for_product_body.dart';
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