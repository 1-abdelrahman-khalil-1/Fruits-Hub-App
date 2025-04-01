import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/Product Cubit/products_cubit.dart';
import '../../../../../Core/utils/assets/appcolors.dart';
import 'headerbar.dart';
import 'popularproductstitle.dart';
import '../../../../../Core/utils/widgets/slivergridblocbuilder.dart';
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
    return   CustomScrollView( //should be singlechildscrollview bec it was only one builder 
      slivers: [
        SliverAppBar(
          automaticallyImplyLeading: false,
          pinned: true,
          backgroundColor: Appcolors.snow,
        title:  
        const HeaderBar(
          title: "الأكثر مبيعًا",
          showicon: true,
          shownotification: true,
        )),
        const SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          sliver: SliverToBoxAdapter(
            child: Column(
              children: [
                Popularproductstitle(
                  title: 'الأكثر مبيعًا',
                  showmore: false,
                ),
                SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        ),
        const Slivergridblocbuilder(showmore_items: true,),
      ],
    );
  }
}
