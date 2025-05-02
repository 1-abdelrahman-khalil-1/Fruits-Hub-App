import 'package:flutter/widgets.dart';
import 'package:fruitsapp/Core/utils/widgets/headerbar.dart';
import 'package:fruitsapp/Core/utils/widgets/searchtextfield.dart';
import 'package:fruitsapp/Features/Search/presentation/view/widgets/search_results_grid.dart';


class SearchResultsBody extends StatelessWidget {
  const SearchResultsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: CustomScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        slivers: [
          SliverToBoxAdapter(child: HeaderBar(title: "البحث", showicon: true, shownotification: true)),
          SliverToBoxAdapter(child: Searchtextfield()),
          SearchResultsGrid(),
        ],
      ),
    );
  }
}