import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitsapp/Core/cubit/products_cubit.dart';
import 'package:fruitsapp/Core/cubit/products_cubit_states.dart';
import 'package:fruitsapp/Features/Category/presentation/view/widgets/skeltonizerloading_with_dummy_products.dart';
import 'package:fruitsapp/Features/Category/presentation/view/widgets/list_viewbuilder_horizontal.dart';
import 'package:fruitsapp/Features/Category/presentation/view/widgets/ourcategory_title_and_filtering.dart';

class OurCategoryBlocBuilder extends StatelessWidget {
  const OurCategoryBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const OurCategoryTitleAndFiltering(),
        BlocBuilder<ProductsCubit, ProductsCubitStates>(
          builder: (context, state) {
            if (state is SuccessState) {
              return  ListViewbuilderHorizontal(products: state.products ,);
            } else if (state is ErrorState) {
              return const Center(
                child: Text("Error To Get Products"),
              );
            } else {
              return const SkeltonizerloadingWithDummyProducts();
            }
          },
        )
      ],
    );
  }
}

