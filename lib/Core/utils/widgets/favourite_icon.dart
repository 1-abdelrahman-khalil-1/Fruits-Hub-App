import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruitsapp/Core/model/productmodel.dart';
import 'package:fruitsapp/Core/utils/assets/picture_assets.dart';
import 'package:fruitsapp/Features/Favourite/presentation/cubit/favourite_cubit.dart';
import 'package:fruitsapp/Features/Favourite/presentation/cubit/favourite_cubit_states.dart';
import 'package:svg_flutter/svg.dart';

class FavouriteIcon extends StatefulWidget {
  const FavouriteIcon({super.key, required this.product});
  final Productmodel product;

  @override
  State<FavouriteIcon> createState() => _FavouriteIconState();
}

class _FavouriteIconState extends State<FavouriteIcon> {
  String currentIcon = PictureAssets.assetsImagesIconsFavouriteIcon;
   bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    // Initial check for favorite status
    context.read<FavouriteCubit>().getFavourites();

    _checkFavoriteStatus();
  }
@override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Check favorite status when dependencies change (e.g., navigation)
    if (_isInitialized) {
      _checkFavoriteStatus();
    }
    _isInitialized = true;
  }

  void _checkFavoriteStatus() {
    context.read<FavouriteCubit>().isFavourite(productId: widget.product.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavouriteCubit, FavouriteCubitStates>(
      listener: (context, state) {
        if (state is FavouriteErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage)),
          );
        }
      },
      builder: (context, state) {
        // Update icon based on the current state
        if (state is FavouriteIsFavouriteState && state.productId == widget.product.id) {
          currentIcon = state.isFavourite
              ? PictureAssets.assetsImagesBoldIconsFavouriteBoldRedIcon
              : PictureAssets.assetsImagesIconsFavouriteIcon;
          log("Icon updated to $currentIcon for product ${widget.product.id}");
        }

        return GestureDetector(
          onTap: () {
            if (currentIcon == PictureAssets.assetsImagesIconsFavouriteIcon) {
              context.read<FavouriteCubit>().addToFavourites(product: widget.product);
            } else {
              context.read<FavouriteCubit>().removeFromFavourites(productId: widget.product.id);
            }
          },
          child: SvgPicture.asset(
            currentIcon,
            width: 20.w,
            height: 20.h,
          ),
        );
      },
    );
  }
}