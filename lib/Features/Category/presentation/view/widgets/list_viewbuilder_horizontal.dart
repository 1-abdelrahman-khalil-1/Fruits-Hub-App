import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruitsapp/Features/Category/presentation/view/widgets/product_item_in_circle.dart';
import 'package:fruitsapp/Core/model/productmodel.dart';

class ListViewbuilderHorizontal extends StatelessWidget {
  const ListViewbuilderHorizontal({
    super.key,
    required this.products,
  });
  final List<Productmodel> products;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return ProductItemInCircle(product: products[index]);
        },
        itemCount: products.length,
        padding: const EdgeInsets.all(0),
      ),
    );
  }
}

