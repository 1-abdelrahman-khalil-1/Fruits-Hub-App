import 'package:flutter/material.dart';

import '../../../../../../../Core/model/productmodel.dart';
import 'details_for_product_data.dart';
import 'half_eclipse_background.dart';
class DetailsForProductBody extends StatelessWidget {
  const DetailsForProductBody({super.key, required this.product});
  final Productmodel product;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: 
      Column(
        children: [
          HalfEclipseBackground(
            imageUrl: product.imageUrl,
          ),
          DetailsForProductData(product: product)
        ],
      )
    );
  }
}