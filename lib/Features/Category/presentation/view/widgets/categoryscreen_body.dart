import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../Core/utils/widgets/headerbar.dart';
import '../../../../../Core/cubit/Product Cubit/products_cubit.dart';
import '../../../../../Core/utils/widgets/popularproductstitle.dart';
import '../../../../../Core/utils/widgets/searchtextfield.dart';
import 'our_category_bloc_builder.dart';

import '../../../../../../../Core/utils/widgets/slivergridblocbuilder.dart';
class CategoryscreenBody extends StatefulWidget {
  const CategoryscreenBody({super.key});

  @override
  State<CategoryscreenBody> createState() => _CategoryscreenBodyState();
}

class _CategoryscreenBodyState extends State<CategoryscreenBody> {
  @override
  void initState() {
    super.initState();
    context.read<ProductsCubit>().fetchPopularProducts();
  }

  @override
  Widget build(BuildContext context) {
    return EasyRefresh(
      triggerAxis: Axis.vertical,
      onRefresh: () {
        context.read<ProductsCubit>().fetchPopularProducts();
      },
      child: Padding(
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
                  const OurCategoryBlocBuilder(),
                  SizedBox(height: 10.h),
                  const Popularproductstitle(
                    title: 'الأكثر مبيعًا',
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
    );
  }
}
