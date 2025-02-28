import 'package:flutter/material.dart';
import 'package:fruitsapp/Core/helperFunctions/dummy.dart';
import 'package:fruitsapp/Features/Category/presentation/view/widgets/list_viewbuilder_horizontal.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SkeltonizerloadingWithDummyProducts extends StatelessWidget {
  const SkeltonizerloadingWithDummyProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
        enabled: true,
        child: ListViewbuilderHorizontal(products: dummyProducts()));
  }
}
