import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruitsapp/Core/cubit/products_cubit.dart';
import 'package:fruitsapp/Core/utils/assets/appcolors.dart';
import 'package:fruitsapp/Core/utils/assets/picture_assets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fruitsapp/Core/model/productmodel.dart';
import 'package:fruitsapp/Core/utils/router/gorouter.dart';
import 'package:fruitsapp/Features/Home/presentation/view/widgets/name_and_price_and_addto_cart.dart';
import 'package:go_router/go_router.dart';
import 'package:svg_flutter/svg.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.productItem});
  final Productmodel productItem;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<ProductsCubit>().fetchProductData(productID: productItem.id);
       context.pushNamed(AppRouter.details_for_product , pathParameters: {"id":productItem.id.toString()});
       },
      child: Container(
        color: Appcolors.white,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SvgPicture.asset(PictureAssets.assetsImagesIconsFavouriteIcon),
              Center(
                child: CachedNetworkImage(
                  imageUrl: productItem.imageUrl,
                  height: 104.h,
                  width: 115.w,
                  fit: BoxFit.cover,
                ),
              ),
              NameAndPriceAndAddtoCart(
                name: productItem.name,
                price: productItem.price,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
