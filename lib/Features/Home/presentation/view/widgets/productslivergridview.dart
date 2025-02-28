import 'package:flutter/material.dart';
import 'package:fruitsapp/Core/model/productmodel.dart';
import 'package:fruitsapp/Core/utils/widgets/product_item.dart';

class Productslivergridview extends StatelessWidget {
  const Productslivergridview({super.key, required this.product, required this.len});
  final List<Productmodel> product;
  final int len;
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 147/181
            ),
            itemBuilder: (context, index) {
              return  ProductItem(productItem: product[index],);
            },
            itemCount: len,
          );
  }
}