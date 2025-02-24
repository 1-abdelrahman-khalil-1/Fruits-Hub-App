import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitsapp/Features/Home/presentation/cubit/popular_products_cubit.dart';
import 'package:fruitsapp/Features/Home/presentation/view/widgets/backbuttomarrow.dart';
import 'package:fruitsapp/Features/Home/presentation/view/widgets/popularproductstitle.dart';
import 'package:fruitsapp/Features/Home/presentation/view/widgets/slivergridblocbuilder.dart';

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
    context.read<PopularProductsCubit>().fetchLowProductsPrice();
  }
  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverAppBar(
          automaticallyImplyLeading: false,
          pinned: true,
          title: Backbuttomarrow(),
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
        Slivergridblocbuilder(),
      ],
    );
  }
}