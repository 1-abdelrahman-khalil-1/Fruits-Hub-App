import 'package:flutter/material.dart';
import 'package:fruitsapp/Features/Home/Data/model/productmodel.dart';
import 'package:fruitsapp/Features/Home/presentation/view/widgets/popular_product_item.dart';

class Productslivergridview extends StatelessWidget {
  const Productslivergridview({super.key, required this.product});
  final List<Productmodel> product;
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
              return  PopularproductItem(productItem: product[index],);
            },
            itemCount: product.length,
          );
  }
}