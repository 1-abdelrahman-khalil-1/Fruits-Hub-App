import 'package:flutter/material.dart';
import 'package:fruitsapp/Features/Search/presentation/view/widgets/search_results_body.dart';

class SearchResultsScreen extends StatelessWidget {
  const SearchResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: SearchResultsBody(),
      ),
    );
  }
}