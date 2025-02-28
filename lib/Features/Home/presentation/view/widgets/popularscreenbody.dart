import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitsapp/Core/cubit/products_cubit.dart';
import 'package:fruitsapp/Core/utils/widgets/custom_appbar.dart';
import 'package:fruitsapp/Features/Home/presentation/view/widgets/popularproductstitle.dart';
import 'package:fruitsapp/Core/utils/widgets/slivergridblocbuilder.dart';

class Popularscreenbody extends StatefulWidget {
  const Popularscreenbody({super.key});

  @override
  State<Popularscreenbody> createState() => _PopularscreenbodyState();
}

class _PopularscreenbodyState extends State<Popularscreenbody> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ProductsCubit>().fetchPopularProducts();
  }

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverAppBar(
          automaticallyImplyLeading: false,
          pinned: true,
          title: HeaderBar(
            title: "الأكثر مبيعًا",
            showicon: true,
          ),
        ),
        SliverPadding(
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
        Slivergridblocbuilder(showmore_items: true,),
      ],
    );
  }
}
