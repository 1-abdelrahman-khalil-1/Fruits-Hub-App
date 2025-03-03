import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruitsapp/Core/utils/widgets/header.dart';
import 'package:fruitsapp/Core/utils/widgets/mybottom_navigation_bar.dart';
import 'package:fruitsapp/Core/utils/widgets/slivergridblocbuilder.dart';
import 'package:fruitsapp/Features/Home/presentation/view/widgets/popularproductstitle.dart';
import 'package:fruitsapp/Features/Home/presentation/view/widgets/searchtextfield.dart';

class FilteringResults extends StatelessWidget {
  const FilteringResults({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: const MybottomNavigationBar(selectedindex: 1),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const HeaderBar(title: "المنتجات", showicon: false ,shownotification: true,),
                      SizedBox(height: 16.h),
                      const Searchtextfield(),
                      SizedBox(height: 10.h),
                      const Popularproductstitle(
                        title: "النتائج",
                        showmore: true,
                      ),
                      SizedBox(height: 10.h),
                    ],
                  ),
                ),
                const Slivergridblocbuilder(),
              ],
            ),
          ),
      ),
    );
  }
}