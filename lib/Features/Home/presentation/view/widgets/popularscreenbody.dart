import 'package:flutter/material.dart';
<<<<<<< HEAD
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
=======
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
>>>>>>> 5989eae (connect to supabase and fetch popular products from supabase database)
          automaticallyImplyLeading: false,
          pinned: true,
          title: Backbuttomarrow(),
        ),
<<<<<<< HEAD
        const SliverPadding(
=======
        SliverPadding(
>>>>>>> 5989eae (connect to supabase and fetch popular products from supabase database)
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
<<<<<<< HEAD
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
=======
        Slivergridblocbuilder(),
>>>>>>> 5989eae (connect to supabase and fetch popular products from supabase database)
      ],
    );
  }
}
