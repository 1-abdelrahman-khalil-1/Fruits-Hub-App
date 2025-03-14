import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../Core/cubit/products_cubit.dart';
import 'widgets/details_for_product_body_bloc_builder.dart';
class DetailsForProduct extends StatefulWidget {
  const DetailsForProduct({super.key, required this.productid});
 final int productid;

  @override
  State<DetailsForProduct> createState() => _DetailsForProductState();
}

class _DetailsForProductState extends State<DetailsForProduct> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ProductsCubit>().fetchProductData(productID: widget.productid);
  }
  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: Scaffold(
      body: DetailsForProductBodyBlocBuilder(),
    ));
  }
}