import 'package:flutter/material.dart';
import 'package:fruitsapp/Core/helperFunctions/dummy.dart';
import 'package:fruitsapp/Core/utils/widgets/productslivergridview.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SkeltonizerSliverLoadingWithDummyProducts extends StatelessWidget {
  const SkeltonizerSliverLoadingWithDummyProducts({super.key,});
  @override
  Widget build(BuildContext context) {
    return Skeletonizer.sliver(
        enabled: true,
        child: Productslivergridview(
          len: dummyProducts().length,
          product: 
            dummyProducts(),
        ));
  }
}
