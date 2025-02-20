import 'package:flutter/material.dart';
import 'package:fruitsapp/Features/Home/presentation/view/widgets/backbuttomarrow.dart';
import 'package:fruitsapp/Features/Home/presentation/view/widgets/popular_product_item.dart';
import 'package:fruitsapp/Features/Home/presentation/view/widgets/popularproductstitle.dart';

class Popularscreenbody extends StatelessWidget {
  const Popularscreenbody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          automaticallyImplyLeading: false,
          pinned: true,
          title: Backbuttomarrow(),
        ),
        const SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          sliver: SliverToBoxAdapter(
            child: Column(
              children: [
                Popularproductstitle(
                  showmore: false,
                ),
                SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          sliver: SliverGrid.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 147 / 181),
            itemBuilder: (context, index) {
              return const PopularproductItem();
            },
            itemCount: 30,
          ),
        )
      ],
    );
  }
}
