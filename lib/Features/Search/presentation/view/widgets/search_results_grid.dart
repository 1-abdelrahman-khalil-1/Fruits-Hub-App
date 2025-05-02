import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitsapp/Core/utils/assets/appcolors.dart';
import 'package:fruitsapp/Core/utils/assets/apptextstyles.dart';
import 'package:fruitsapp/Core/utils/assets/picture_assets.dart';
import 'package:fruitsapp/Core/utils/widgets/productslivergridview.dart';
import 'package:fruitsapp/Core/utils/widgets/skeltonizerloading_sliver_with_dummy_products.dart';
import 'package:fruitsapp/Features/Search/presentation/cubit/search_cubit.dart';
import 'package:fruitsapp/Features/Search/presentation/cubit/search_state.dart';
import 'package:svg_flutter/svg.dart';

class SearchResultsGrid extends StatelessWidget {
  const SearchResultsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          if (state is SearchInitial) {
            // Show default products or empty state
            return  SliverToBoxAdapter(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: const Center(
                  child: Text("ابحث عن المنتجات"),
                ),
              ),
            );
          } else if (state is SearchLoading) {
            return const SkeltonizerSliverLoadingWithDummyProducts();
          } else if (state is SearchSuccess) {
            if (state.products.isEmpty) {
              return  SliverToBoxAdapter(
                child: SizedBox(
                  height:  MediaQuery.of(context).size.height * 0.8,
                  child: Column(
                    spacing: 10,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(PictureAssets.assetsImagesNoResult),
                      Text(
                        'البحث',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.bold16.copyWith(color: Appcolors.grey600),
                      ),
                      Text(
                        'عفوًا... هذه المعلومات غير متوفرة للحظة',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.regular13.copyWith(color: Appcolors.grey600),
                      ),
                    ],
                  ),
                ),
              );
            }
            return Productslivergridview(
              product: state.products,
              len: state.products.length,
            );
          } else if (state is SearchError) {
            return SliverToBoxAdapter(
              child: Center(
                child: Text("خطأ: ${state.message}"),
              ),
            );
          } else {
            return const SliverToBoxAdapter(
              child: SizedBox.shrink(),
            );
          }
        },
      );
  }
}