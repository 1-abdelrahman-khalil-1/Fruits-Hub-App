import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruitsapp/Core/model/productmodel.dart';
import 'package:fruitsapp/Core/utils/assets/picture_assets.dart';
import 'package:fruitsapp/Core/cubit/Favourite%20cubit/favourite_cubit.dart';
import 'package:fruitsapp/Core/cubit/Favourite%20cubit/favourite_cubit_states.dart';
import 'package:svg_flutter/svg.dart';

class FavouriteIcon extends StatefulWidget {
  const FavouriteIcon({super.key, required this.product});
  final Productmodel product;

  @override
  State<FavouriteIcon> createState() => _FavouriteIconState();
}

class _FavouriteIconState extends State<FavouriteIcon> {
  @override
  void initState() {
    super.initState();
      context.read<FavouriteCubit>().getFavourites();
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
        // Determine the current icon status directly in the builder
        final bool isFavorite = context.read<FavouriteCubit>().isFavourite(productId: widget.product.id);
        final String currentIcon = isFavorite
            ? PictureAssets.assetsImagesBoldIconsFavouriteBoldRedIcon
            : PictureAssets.assetsImagesIconsFavouriteIcon;

        return GestureDetector(
          onTap: () {
            if (!isFavorite) {
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