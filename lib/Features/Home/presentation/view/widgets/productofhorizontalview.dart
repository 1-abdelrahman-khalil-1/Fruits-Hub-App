import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruitsapp/Features/Home/presentation/view/widgets/fruitbackground.dart';
import 'package:fruitsapp/Features/Home/presentation/view/widgets/productoffers.dart';

class ProductOfHorizontalView extends StatelessWidget {
  const ProductOfHorizontalView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 342.w,
      margin: const EdgeInsets.only(left: 10),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(16.r)),
      child: const Stack(
        children: [
          Fruitbackground(),
          ProductOffers(),
        ],
      ),
    );
  }
}



