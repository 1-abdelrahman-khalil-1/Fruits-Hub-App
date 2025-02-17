import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruitsapp/Core/utils/appcolors.dart';
import 'package:fruitsapp/Core/utils/assets/fontasset.dart';
import 'package:fruitsapp/Core/utils/assets/picture_assets.dart';
import 'package:fruitsapp/Features/Home/presentation/view/widgets/productofhorizontalview.dart';
import 'package:svg_flutter/svg.dart';


class HorizontalListView extends StatelessWidget {
  const HorizontalListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160.h,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.zero,
          itemCount: 5,
          shrinkWrap: true,
          itemBuilder: (context, i) {
            return const ProductOfHorizontalView();
          }),
    );
  }
}

