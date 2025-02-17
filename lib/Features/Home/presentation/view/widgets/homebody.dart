import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruitsapp/Core/utils/assets/picture_assets.dart';
import 'package:fruitsapp/Features/Home/presentation/view/widgets/custom_appbar.dart';
import 'package:fruitsapp/Features/Home/presentation/view/widgets/horizontallistview.dart';
import 'package:fruitsapp/Features/Home/presentation/view/widgets/popularproductstitle.dart';
import 'package:fruitsapp/Features/Home/presentation/view/widgets/searchtextfield.dart';
import 'package:svg_flutter/svg.dart';

class Homebody extends StatelessWidget {
  const Homebody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15 , vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const CustomHomeAppbar(),
          SizedBox(height: 16.h),
          const Searchtextfield(),
          SizedBox(height: 10.h),
          const HorizontalListView(),
          SizedBox(height: 10.h),
          const Popularproductstitle(),
        ],
      ),
    );
  }
}
