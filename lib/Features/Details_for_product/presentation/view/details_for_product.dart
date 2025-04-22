import 'package:flutter/material.dart';
import 'widgets/details_for_product_body.dart';

import '../../../../Core/model/productmodel.dart';

class DetailsForProduct extends StatelessWidget {
  final Productmodel product;

  const DetailsForProduct({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(                                              
        body: DetailsForProductBody(product: product), // Use the refactored widget
      ),
    );
  }
}