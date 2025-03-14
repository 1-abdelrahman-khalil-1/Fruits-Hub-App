import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './/Features/Category/presentation/view/widgets/product_item_in_circle.dart';
import './/Core/model/productmodel.dart';

class ListViewbuilderHorizontal extends StatelessWidget {
  const ListViewbuilderHorizontal({
    super.key,
    required this.products,
  });
  final List<Productmodel> products;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 15),
            child: ProductItemInCircle(product: products[index]));
        },
        itemCount: products.length,
        padding: const EdgeInsets.all(0),
      ),
    );
  }
}

